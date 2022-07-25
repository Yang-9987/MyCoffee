//
//  exampleData.swift
//  MyCoffee
//
//  Created by Yang Jianqi on 2022/7/8.
//

import Foundation
import SwiftUI
import CoreLocation
import WeatherKit


// MARK:  MyFavoriteThings
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

var myFavoriteItems = [
    MyFavoriteItem(type: .Bean, title: "Whiskey Barrel-Aged", taste: "Like Whiskey", date: string2data(strDate: "2022-07-18")),
    MyFavoriteItem(type: .Bean, title: "Paradeisi Blend", taste: "Apple", date: string2data(strDate: "2022-07-19")),
    MyFavoriteItem(type: .Taste, title: "ColdBrew-Whiskey", taste: "Love it!", date: string2data(strDate: "2022-07-18")),
    MyFavoriteItem(type: .Taste, title: "Family Together", taste: "We will drink it every year!", date: string2data(strDate: "2021-07-21"))
]


// MARK:  TabThings
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

var tabItems = [
    TabItem(type: .TabType, icon: "house.circle", text: "今日回顾", tab: .home),
    TabItem(type: .TabType, icon: "heart.circle", text: "豆子", tab: .bean),
    TabItem(type: .TabType, icon: "list.bullet.circle", text: "品尝记录", tab: .tasting),
    TabItem(type: .TabType, icon: "gear.circle", text: "设置", tab: .settings),
]

// MARK:  TodayReview

var todayReviews: [TodayReview] = [
    TodayReview(index: string2data(strDate: "2022-07-16"), mood: .Happy, cupsCoffee: 2, beanStorage: 180),
    TodayReview(index: string2data(strDate: "2022-07-17"), mood: .KissKiss, cupsCoffee: 2, beanStorage: 180)
]

// MARK:  CupsCoffee
var cupCoffees: [CupCoffee] = [
    CupCoffee(name: "Americano", shop: "StarBucks", comment: "好苦", score: 4.0),
    CupCoffee(name: "Latte", shop: "StarBucks", comment: "味道有点淡", score: 4.2),
    CupCoffee(name: "生椰拿铁", shop: "熊熊牌", comment: "真不错", score: 4.9)
]

