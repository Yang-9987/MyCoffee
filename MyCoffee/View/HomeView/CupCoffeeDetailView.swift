//
//  CupCoffeeDetailView.swift
//  MyCoffee
//
//  Created by Yang Jianqi on 2022/7/24.
//

import SwiftUI
import Introspect

struct CupCoffeeDetailView: View {
    @Environment(\.presentationMode) var presentationMode
    @EnvironmentObject var set: setData
    var data: CupCoffee
    
    var body: some View {
        VStack {
            ScrollView(.vertical, showsIndicators: false, content: {
                VStack(alignment: .leading, spacing: 10) {
                    HStack {
                        Text(data.name)
                            .font(.system(size: 30, weight: .semibold, design: .serif))
                        Spacer()
                    }
                }
                .padding()
            })
        }
        .navigationBarBackButtonHidden()
        .navigationBarItems(leading: Button(action: {
                    self.presentationMode.wrappedValue.dismiss()
                }, label: {
                    HStack {
                        Image(systemName: "arrow.left")
                        Text("Cups")
                            .foregroundColor(.black)
                    }
                })
        )
        .onDisappear {
            set.tabBarShow = true
        }
        .onAppear {
            set.tabBarShow = false
        }
    }
}

struct CupCoffeeDetailView_Previews: PreviewProvider {
    static var previews: some View {
        CupCoffeeDetailView(data: cupCoffees[0])
            .environmentObject(setData())
    }
}
