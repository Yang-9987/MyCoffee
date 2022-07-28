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
var myFavoriteItems = [
    MyFavoriteItem(type: .Bean, title: "Whiskey Barrel-Aged", taste: "Like Whiskey", date: string2data(strDate: "2022-07-18")),
    MyFavoriteItem(type: .Bean, title: "Paradeisi Blend", taste: "Apple", date: string2data(strDate: "2022-07-19")),
    MyFavoriteItem(type: .Taste, title: "ColdBrew-Whiskey", taste: "Love it!", date: string2data(strDate: "2022-07-18")),
    MyFavoriteItem(type: .Taste, title: "Family Together", taste: "We will drink it every year!", date: string2data(strDate: "2021-07-21"))
]

// MARK:  TabThings
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

// MARK:  Bean

var beans: [Bean] = [
    Bean(name: "House", plantPlace: .LatinAmerica, subPlace: "", kind: .Arabica, process: .WashedProcess, roast: .Medium, flavor: "Lively and peaceful", acidity: .Medium, body: .Medium, releaseDate: Date(), story: """
        The masters chose beans from Latin America
        And use water washing process
        This seemingly simple combination
        After baking
        Nothing is simple anymore
        The beans have undergone the baptism of heat and transformed into something else
        A deep radiant chestnut color
        The air is full of spices mixed with the smell of cocoa.
        -- Starbucks
        """, imgURL: "", img: "House"),
    Bean(name: "Kenya", plantPlace: .Africa, subPlace: "", kind: .Arabica, process: .WashedProcess, roast: .Medium, flavor: "Grapefruit flavor, berry flavor, if juicy, rich in taste", acidity: .High, body: .MediumHigh, releaseDate: Date(), story: """
        The high altitude environment and tradition of growing this coffee
        make it stand out and remain so.
        So when we started serving this coffee in 1971,
        we continued to amaze our customers,
        and even professional coffee tasters,
        by displaying flavors that are
        not often found in coffee.Bright,
        fruity acidity and a slight wine texture.
        Between blackcurrant and sour grapes.
        Even better, these flavors
        are even more pronounced as he cools down.
        -- Starbucks
        """, imgURL: "", img: "Kenya"),
    Bean(name: "Breakfast", plantPlace: .LatinAmerica, subPlace: "", kind: .Arabica, process: .WashedProcess, roast: .Medium, flavor: "Refreshing and fragrant", acidity: .High, body: .Low, releaseDate: Date(), story: """
        This coffee was created in 1998 for those who prefer it
        Mild, soft, taste specially created by the customer.
        As opposed to the feeling of smoke,
        This coffee shows only moderate roasting.
        It's the result of the great masters experimenting with baking and flavors.

        If you expect to wake up in the morning,
        I don't want it to be too strong,
        But I want coffee to be rich,
        Then the breakfast mix is perfect.
        Vibrant citrus acidity and a very clean finish,
        Make this coffee the perfect way to start your day.
        -- Starbucks
        """, imgURL: "", img: "Breakfast"),
    Bean(name: "Verona", plantPlace: .MultiOrigin, subPlace: "", kind: .Arabica, process: .WashedProcess, roast: .Deep, flavor: "Baking sweet and black cocoa flavors", acidity: .Medium, body: .High, releaseDate: Date(), story: """
        This is the first custom-made coffee
        since starbucks was founded.
        Created exclusively for Seattle restaurant
        Jake O 'Shaunessey's in 1975,
        the Blend is called Jake's Blend
        with 80% Yoken Blend and 20% Italian roast.
        -- Starbucks
        """, imgURL: "", img: "Verona")
]
