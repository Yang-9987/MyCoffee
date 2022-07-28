//
//  BeanDetail.swift
//  MyCoffee
//
//  Created by Yang Jianqi on 2022/7/25.
//

import SwiftUI

struct BeanDetail: View {
    @Environment(\.presentationMode) var presentationMode
    @EnvironmentObject var set: setData
    @Binding var bean: Bean
    
    var body: some View {
        ScrollView(.vertical, showsIndicators: false, content: {
            VStack {
                Text("hahaha")
            }
            .navigationBarBackButtonHidden()
            .navigationBarItems(leading: Button(action: {
                        self.presentationMode.wrappedValue.dismiss()
                    }, label: {
                        HStack {
                            Image(systemName: "arrow.left")
                            Text("Bean")
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
        })
    }
}

struct BeanDetail_Previews: PreviewProvider {
    static var previews: some View {
        BeanDetail(bean: .constant(beans[0]))
            .environmentObject(setData())
    }
}
