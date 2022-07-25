//
//  MainView.swift
//  MyCoffee
//
//  Created by Yang Jianqi on 2022/7/8.
//

import SwiftUI
import CoreLocation
import WeatherKit
import Introspect
import UniformTypeIdentifiers

struct MainView: View {
    // MARK:  PROPERTY
    @StateObject var set = setData()
    @StateObject var location = locationManager()
    @State var selectedTab: Tab = .home
    @State private var showingAlert = false
    
    // MARK:  BODY
    var body: some View {
        ZStack(alignment: .bottom) {
            switch selectedTab {
            case .home:
                HomeView()
                    .introspectNavigationController { navigationController in
                        navigationController.clearBackgroundColor()
                    }
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
            case .bean:
                BeanView()
                    .introspectNavigationController { navigationController in
                        navigationController.clearBackgroundColor()
                    }
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
            case .tasting:
                TastingView()
                    .introspectNavigationController { navigationController in
                        navigationController.clearBackgroundColor()
                    }
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
            case .settings:
                Settings()
                    .introspectNavigationController { navigationController in
                        navigationController.clearBackgroundColor()
                    }
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
            }
                
            BottomBar(selectedTab: $selectedTab)
                .offset(y:set.tabBarShow ? 0 : 80)
                .animation(.easeIn(duration: 0.3), value: set.tabBarShow)
            
            HeaderView()
                .introspectViewController { viewController in
                        viewController.view.backgroundColor = .clear
                    }
                .padding(.top, K_StatusHeight - 10)
                .background(Material.ultraThinMaterial)
                .padding(.bottom, UIScreen.main.bounds.size.height - 80)
                .offset(y:set.tabBarShow ? 0 : -90)
                .animation(.easeIn(duration: 0.3), value: set.tabBarShow)
        }
        .onAppear {
            set.menuLevel = 0
        }
        .background(.clear)
        .textSelection(.enabled)
        .background {
            if set.menuLevel == 0 {
                switch selectedTab {
                case .home :
                    backgroundGradient.ignoresSafeArea(.all)
                case .bean:
                    Color.white
                case .tasting:
                    Color.white
                case .settings:
                    Color.white
                }
            } else {
                
            }
        }
        .environmentObject(location)
        .environmentObject(set)
        .ignoresSafeArea()
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
            .environmentObject(setData())
    }
}
