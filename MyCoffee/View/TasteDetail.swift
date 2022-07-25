//
//  TasteDetail.swift
//  MyCoffee
//
//  Created by Yang Jianqi on 2022/7/25.
//

import SwiftUI

struct TasteDetail: View {
    @EnvironmentObject var set: setData
    
    var body: some View {
        VStack {
            Text("123")
        }
        .onAppear {
            set.tabBarShow = false
        }
        .onDisappear {
            set.tabBarShow = true
        }
    }
}

struct TasteDetail_Previews: PreviewProvider {
    static var previews: some View {
        TasteDetail()
            .environmentObject(setData())
    }
}
