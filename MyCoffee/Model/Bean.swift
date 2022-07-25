//
//  Bean.swift
//  MyCoffee
//
//  Created by Yang Jianqi on 2022/6/8.
//

import Foundation

struct Bean: Identifiable, Codable, Hashable {
    
    //MARK: 实例相关属性
    var id: UUID
    var name: String //豆子名称
    var plantPlace: PlantPlace //种植大区
    var subPlace: String //种植小区
    var kind: Kind //豆子品种
    var process: Process //处理方式
    var roast: Roast //烘焙程度
    var flavor: String //风味
    var acidity: acidity_body //酸度
    var body: acidity_body //醇度
    var releaseDate: Date //生产日期
    var story: String //故事
    var imgURL: String //用户上传图片
    var img: String //占位符图片
    
    init(id: UUID = UUID(), name: String, plantPlace: PlantPlace, subPlace: String, kind: Kind, process: Process, roast: Roast, flavor: String, acidity: acidity_body, body: acidity_body, releaseDate: Date, story: String, imgURL: String, img: String) {
        self.id = id
        self.name = name
        self.plantPlace = plantPlace
        self.subPlace = subPlace
        self.kind = kind
        self.process = process
        self.roast = roast
        self.flavor = flavor
        self.acidity = acidity
        self.body = body
        self.releaseDate = releaseDate
        self.story = story
        self.imgURL = imgURL
        self.img = img
    }
    
    struct Data {
        var name: String = ""
        var plantPlace: PlantPlace = .LatinAmerica
        var subPlace: String = ""
        var kind: Kind = .Arabica
        var process: Process = .HoneyProcess
        var roast: Roast = .Light
        var flavor: String = ""
        var acidity: acidity_body = .Low
        var body: acidity_body = .Low
        var releaseDate: Date = Date()
        var story: String = ""
        var imgURL: String = ""
        var img: String = "coffeebean"
    }
    
    var data: Data {
        Data(name: name, plantPlace: plantPlace, subPlace: subPlace, kind: kind, process: process, roast: roast, flavor: flavor, acidity: acidity, body: body, releaseDate: releaseDate, story: story, imgURL: imgURL, img: img)
    }
    
    mutating func update(from data: Data) {
        name = data.name
        plantPlace = data.plantPlace
        subPlace = data.subPlace
        kind = data.kind
        process = data.process
        roast = data.roast
        flavor = data.flavor
        acidity = data.acidity
        body = data.body
        releaseDate = data.releaseDate
        story = data.story
        imgURL = data.imgURL
        img = data.img
    }
    
    init(data: Data) {
        id = UUID()
        name = data.name
        plantPlace = data.plantPlace
        subPlace = data.subPlace
        kind = data.kind
        process = data.process
        roast = data.roast
        flavor = data.flavor
        acidity = data.acidity
        body = data.body
        releaseDate = data.releaseDate
        story = data.story
        imgURL = data.imgURL
        img = data.img
    }
    
}
