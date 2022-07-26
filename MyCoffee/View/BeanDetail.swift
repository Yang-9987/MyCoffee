//
//  BeanDetail.swift
//  MyCoffee
//
//  Created by Yang Jianqi on 2022/7/25.
//

import SwiftUI

struct BeanDetail: View {
    @EnvironmentObject var set: setData
    
    var body: some View {
        List {
            ForEach(1..<8) { index in
                HStack {
                    Image("photo-\(index)")
                        .resizable()
                        .scaledToFill()
                        .frame(width: 100, height: 50)
                        .cornerRadius(10)
         
                    Text("Photo #\(index)")
                        .bold()
                }
                .swipeActions(edge: .trailing) {
                    Button {
                        print("Mark as favorite")
                    } label: {
                        Label("Favorite", systemImage: "star")
                    }
                    .tint(.yellow)
         
                    Button {
                        print("Delete")
                    } label: {
                        Label("Delete", systemImage: "trash")
                    }
                    .tint(.red)
                }
                .swipeActions(edge: .leading) {
                    Button {
                        print("Share")
                    } label: {
                        Label("Share", systemImage: "square.and.arrow.up")
                    }
                    .tint(.green)
         
                }
            }
         
        }
        .onAppear {
            set.tabBarShow = false
        }
        .onDisappear {
            set.tabBarShow = true
        }
    }
}

struct BeanDetail_Previews: PreviewProvider {
    static var previews: some View {
        BeanDetail()
            .environmentObject(setData())
    }
}
