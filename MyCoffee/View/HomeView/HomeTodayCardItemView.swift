//
//  HomeTodayCardView.swift
//  MyCoffee
//
//  Created by Yang Jianqi on 2022/7/17.
//
import Foundation
import SwiftUI
import WeatherKit
import MapKit

struct HomeTodayCardItemsView: View {
    
    @Binding var todayReviewData: TodayReview
    
    @State var weather: Weather?
    @EnvironmentObject var lm: locationManager
    @State private var gps_log = [CLLocationCoordinate2D]()
    
    var latitude: Double  { return(lm.location?.latitude ?? 0) }
    var longitude: Double { return(lm.location?.longitude ?? 0) }
    
    var placeMark: String { return("\(lm.placemark?.name ?? "")") }
    var country: String { return("\(lm.placemark?.country ?? "点击获取位置")") }
    var locality: String { return("\(lm.placemark?.locality ?? "")") }
    
    var currentAnnotation: MKPointAnnotation{
        let newLocation = MKPointAnnotation()
        newLocation.coordinate = CLLocationCoordinate2D(
            latitude: (lm.location?.latitude ?? 0), longitude: (lm.location?.longitude ?? 0)
        )
        return newLocation
    }
    
    @State private var changingMood: Bool = false
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false, content: {
            HStack{
                cardWeather()
                
                cardMood(mood: todayReviewData.mood)
                    .onTapGesture {
                        changingMood = true
                    }
                    .sheet(isPresented: $changingMood) {
                        NavigationStack {
                            changeTodayDataView(data: $todayReviewData)
                                .toolbar {
                                    ToolbarItem(id: "1", placement: .cancellationAction){
                                        Button("Dismiss") {
                                            changingMood = false
                                        }
                                    }
                                    ToolbarItem(id: "2", placement: .confirmationAction) {
                                        Button("Add") {
                                            changingMood = false
                                        }
                                    }
                                }
                        }
                    }
                
                cardCups(cups: todayReviewData.cupsCoffee)
                    .onTapGesture {
                        changingMood = true
                    }
                
                cardBeanStorage(weight: todayReviewData.beanStorage)
                    .onTapGesture {
                        changingMood = true
                    }
            }
        })
    }
    
    @ViewBuilder
    func cardWeather() -> some View {
        Group {
            if let weather = weather {
                VStack {
                    Text("Weather")
                        .font(.system(size: 25, weight: .bold, design: .serif))
                    VStack(alignment: .center) {
                        Text("\(self.country)")
                        Text("\(self.locality)")
                        Text(self.country == "点击获取位置" ? " " : date2string(Datestr: weather.currentWeather.date))
                        Text(self.country == "点击获取位置" ? " " : weather.currentWeather.temperature.description)
                        Image(systemName: self.country == "点击获取位置" ? "arrow.counterclockwise" : weather.currentWeather.symbolName)
                    }
                }
            } else {
                ProgressView()
                    .task {
                        self.lm.updateLocation()
                        self.gps_log.append(self.currentAnnotation.coordinate)
                        await weather = weatherData(latitude: self.latitude, longitude: self.longitude).getWeather()
                    }
            }
        }
        .onTapGesture {
            self.lm.updateLocation()
            self.gps_log.append(self.currentAnnotation.coordinate)
        }
        .foregroundColor(.white)
        .frame(width: UIScreen.main.bounds.width / 2.5, height: UIScreen.main.bounds.height / 5, alignment: .center)
        .background(Color(hex: "#079992"))
        .cornerRadius(15)
        .padding(.leading,10)
    }
    
    @ViewBuilder
    func cardMood(mood: Mood) -> some View {
        VStack(spacing: 5) {
            Text("Mood")
                .font(.system(size: 25, weight: .bold, design: .serif))
            VStack {
                Text(mood.moodName)
                    .padding(.bottom, 10)
                Text(mood.moodImg)
            }
            .frame(height: UIScreen.main.bounds.height / 10, alignment: .center)
        }
        .foregroundColor(.white)
        .frame(width: UIScreen.main.bounds.width / 2.5, height: UIScreen.main.bounds.height / 5, alignment: .center)
        .background(Color(hex: "#38ada9"))
        .cornerRadius(15)
    }
    
    @ViewBuilder
    func cardCups(cups: Int) -> some View {
        VStack {
            Text("Cups")
                .font(.system(size: 25, weight: .bold, design: .serif))
            Text("\(cups)")
                .frame(height: UIScreen.main.bounds.height / 10, alignment: .center)
        }
        .foregroundColor(.white)
        .frame(width: UIScreen.main.bounds.width / 2.5, height: UIScreen.main.bounds.height / 5, alignment: .center)
        .background(Color(hex: "#78e08f"))
        .cornerRadius(15)
    }
    
    @ViewBuilder
    func cardBeanStorage(weight: Double) -> some View {
        let weight = String(format: "%.2f", weight)
        VStack {
            Text("BeanStorage")
                .font(.system(size: 25, weight: .bold, design: .serif))
            Text("\(weight) g")
                .frame(height: UIScreen.main.bounds.height / 10, alignment: .center)
        }
        .foregroundColor(.white)
        .frame(width: UIScreen.main.bounds.width / 2, height: UIScreen.main.bounds.height / 5, alignment: .center)
        .background(Color(hex: "#b8e994"))
        .cornerRadius(15)
        .padding(.trailing, 10)
    }
}

struct HomeTodayCardItemView_Previews: PreviewProvider {
    static var previews: some View {
        HomeTodayCardItemsView(todayReviewData: .constant(todayReviews.last!))
            .environmentObject(locationManager())
            //.previewLayout(.sizeThatFits)
    }
}
