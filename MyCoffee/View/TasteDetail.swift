//
//  TasteDetail.swift
//  MyCoffee
//
//  Created by Yang Jianqi on 2022/7/25.
//

import SwiftUI

struct TasteDetail: View {
    @Environment(\.presentationMode) var presentationMode
    @EnvironmentObject var set: setData
    
    var body: some View {
        VStack {
            Text("123")
        }
        .navigationBarBackButtonHidden()
        .navigationBarItems(leading: Button(action: {
                    self.presentationMode.wrappedValue.dismiss()
                }, label: {
                    HStack {
                        Image(systemName: "arrow.left")
                        Text("Taste")
                            .foregroundColor(.black)
                    }
                })
        )
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
