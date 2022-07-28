//
//  BeanView.swift
//  MyCoffee
//
//  Created by Yang Jianqi on 2022/7/8.
//

import SwiftUI
import CoreLocation
import WeatherKit

@available(iOS 16.0, *)
struct BeanView: View {
    
    @EnvironmentObject var set: setData
    @State var beansData: [Bean] = beans
    
    init(){
        UITableView.appearance().backgroundColor = UIColor(Color(.clear))
          }
    
    var body: some View {
        NavigationStack {
            VStack(alignment: .leading, spacing: 10){
                Spacer()
                    .frame(height: 35)
                List {
                    ForEach($beansData) { $beanData in
                        NavigationLink(destination: {
                            BeanDetail(bean: $beanData)
                        }, label: {
                            BeanListItemView(bean: beanData)
                            
                        })
                    }.swipeActions(edge: .trailing) {
                        Button {
                            print("Mark as favorite")
                        } label: {
                            Label("Favorite", systemImage: "star")
                        }
                        .tint(.yellow)
             
                        Button {
                            print("Delete")
                        } label: {
                            Label("Delete", systemImage: "trash")
                        }
                        .tint(.red)
                    }
                    .swipeActions(edge: .leading) {
                        Button {
                            print("Share")
                        } label: {
                            Label("Share", systemImage: "square.and.arrow.up")
                        }
                        .tint(.green)
             
                    }
                }
            }
        }
    }
}

struct BeanView_Previews: PreviewProvider {
    static var previews: some View {
        BeanView()
            .environmentObject(setData())
    }
}
