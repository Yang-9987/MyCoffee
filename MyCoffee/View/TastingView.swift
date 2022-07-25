//
//  TastingView.swift
//  MyCoffee
//
//  Created by Yang Jianqi on 2022/7/8.
//

import SwiftUI

struct TastingView: View {
    @State var dbmsg = ""
    var body: some View {
        VStack {
            HStack{
                Button("点击测试db"){
                    dbmsg = "\(SQLiteBase.shared)"
                    //let users = Table("users")
                }
                .padding()
                
                Button("检查select"){
                    SQLiteBase.shared.check()
                }
                .padding()
            }
            Text("结果输出: \(dbmsg)")
                .padding()
        }
    }
}

struct TastingView_Previews: PreviewProvider {
    static var previews: some View {
        TastingView()
    }
}
