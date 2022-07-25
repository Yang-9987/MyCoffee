//
//  GlobalVariable.swift
//  MyCoffee
//
//  Created by Yang Jianqi on 2022/7/20.
//

import Foundation
import SwiftUI

// MARK:  Global Variable
class setData: ObservableObject {
    @Published var tabBarShow: Bool = true
    @Published var HeaderColor: Color = Color("backgroundColor")
    @Published var menuLevel: Int = 0
}
