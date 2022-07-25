//
//  HideKeyBoardExtension.swift
//  Devote
//
//  Created by Yang Jianqi on 2022/6/13.
//

import SwiftUI

#if canImport(UIKit)
extension View {
    func hideKeyboard() {
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}
#endif



