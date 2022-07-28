//
//  Settings.swift
//  MyCoffee
//
//  Created by Yang Jianqi on 2022/7/8.
//

import SwiftUI
import CoreLocation

struct Settings: View {
    @Environment(\.presentationMode) var presentationMode
    @EnvironmentObject var set: setData
    
    var body: some View {
        VStack {
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
                }
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
        }
    }
}

struct Settings_Previews: PreviewProvider {
    static var previews: some View {
        Settings()
            .environmentObject(setData())
    }
}
