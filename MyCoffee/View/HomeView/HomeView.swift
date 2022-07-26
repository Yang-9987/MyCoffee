//
//  ContentView.swift
//  MyCoffee
//
//  Created by Yang Jianqi on 2022/6/8.
//

import SwiftUI
import ProgressHUD
import WeatherKit
import CoreLocation
import MapKit
import Introspect

struct HomeView: View {
    // MARK:  PROPERTY
    @EnvironmentObject var set: setData
    @State var task: String = ""
    @State private var showNewtaskItem: Bool = false
    @State var todayReview: TodayReview = todayReviews.last!
    
    @State var beans: [MyFavoriteItem] = myFavoriteItems.filter { $0.type == .Bean }.sorted { $0.date > $1.date }
    @State var tastes: [MyFavoriteItem] = myFavoriteItems.filter { $0.type == .Taste }.sorted { $0.date > $1.date }
    
    @State private var offsets = [CGSize](repeating: CGSize.zero, count: 6)
    
    // MARK:  Func
    
    // MARK:  Body
    var body: some View {
        NavigationView {
            ScrollView(.vertical, showsIndicators: false, content: {
                VStack(alignment: .leading, spacing: 10) {
                    Spacer()
                        .frame(height: 35)
                    // MARK:  Title
                    HStack() {
                        Text("Today's")
                            .foregroundColor(Color.green)
                            .font(.system(size: 40, weight: .bold, design: .serif))
                        Spacer()
                    }
                    .padding(.top, 10)
                    .padding(.leading, 15)
                    
                    // MARK:  Card
                    HomeTodayCardItemsView(todayReviewData: $todayReview)
                        .shadow(radius: 10)
                    
                    // MARK:  Title
                    HStack() {
                        Text("My Favorite")
                            .foregroundColor(Color.green)
                            .font(.system(size: 40, weight: .bold, design: .serif))
                    }
                    .padding(.leading, 15)
                    
                    // MARK:  Bean&Taste
                    VStack(alignment: .leading) {
                        VStack(alignment: .leading) {
                            Text("Bean")
                                .foregroundColor(Color("heavyGreen"))
                                .font(.system(size: 30, weight: .medium, design: .serif))
                            ForEach(beans) { myFavoriteItem in
                                NavigationLink(destination: BeanDetail()){
                                    MyFavoriteView(myFavoriteData: myFavoriteItem)
                                        .foregroundColor(Color.black)
                                }
                            }
                        }
                        .padding(.leading, 10)
                        .padding(.trailing, 20)
                        
                        VStack(alignment: .leading) {
                            Text("Taste")
                                .foregroundColor(Color("heavyGreen"))
                                .font(.system(size: 30, weight: .medium, design: .serif))
                            ForEach(tastes) { myFavoriteItem in
                                NavigationLink(destination: TasteDetail()){
                                    MyFavoriteView(myFavoriteData: myFavoriteItem)
                                        .foregroundColor(Color.black)
                                }
                            }
                        }
                        .padding(.top, 5)
                        .padding(.leading, 10)
                        .padding(.trailing, 20)
                    }
                    .padding(.leading, 15)
                    
                    // MARK:  Title
                    HStack() {
                        Text("Cups")
                            .foregroundColor(Color.green)
                            .font(.system(size: 40, weight: .bold, design: .serif))
                    }
                    .padding(.leading, 15)
                    
                    // MARK:  CupsView
                    VStack {
                        ForEach(cupCoffees.sorted { $0.score > $1.score}) { cupCoffee in
                            NavigationLink(destination: CupCoffeeDetailView(data: cupCoffee)){
                                CupsListItemView(data: cupCoffee)
                                    .foregroundColor(Color.black)
                            }
                        }
                    }
                    
                    // MARK:  Blank
                    VStack {
                        
                    }
                    .frame(height: 30)
                    
                    Spacer()
                }
            })
            .onAppear {
                set.HeaderColor = Color("backgroundColor")
            }
        }
        .accentColor(Color("mybrown"))
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
