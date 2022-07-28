//
//  tabItems.swift
//  MyCoffee
//
//  Created by Yang Jianqi on 2022/7/28.
//

import Foundation


// MARK:  TabItem
enum TabItemType {
    case TabType
    case ButtonType
}

struct TabItem: Identifiable {
    
    var id = UUID()
    
    var type: TabItemType
    var icon: String
    var text: String
    var tab: Tab?
    
}

enum Tab: String {
    case home
    case bean
    case tasting
    case settings
}


// MARK:  FavoriteType
enum MyFavoriteType {
    case Bean
    case Taste
}

struct MyFavoriteItem: Identifiable {
    var id = UUID()
    var type: MyFavoriteType
    var title: String
    var taste: String
    var date: Date
}
