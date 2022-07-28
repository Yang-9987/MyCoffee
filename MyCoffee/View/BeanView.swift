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
    
    var body: some View {
        VStack {
            Text("Test")
        }
        .onAppear {
            set.HeaderColor = .white
            
            
        }
    }
}

struct BeanView_Previews: PreviewProvider {
    static var previews: some View {
        BeanView()
            .environmentObject(setData())
    }
}
