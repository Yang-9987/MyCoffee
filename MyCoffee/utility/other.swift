//
//  itemFormatter.swift
//  Devote
//
//  Created by Yang Jianqi on 2022/6/13.
//

import Foundation
import SwiftUI

// MARK:  Formatter


func string2data(strDate: String) -> Date {
    let dateString = strDate
    var newDate: Date?
    let dateformatter = DateFormatter()

    dateformatter.dateFormat = "YYYY-MM-dd"
    newDate = dateformatter.date(from: dateString)

    return newDate!
}

func date2string(Datestr: Date) -> String {
    let eventdate = Datestr
    let dateformatter = DateFormatter()
    
    dateformatter.dateStyle = .full
    dateformatter.timeStyle = .long
    dateformatter.dateFormat = "YYYY-MM-dd"
    let dateString = dateformatter.string(from: eventdate)
    
    return dateString
}

// MARK:  UI

extension Color {
    init(hex string: String) {
        var string: String = string.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines)
        if string.hasPrefix("#") {
            _ = string.removeFirst()
        }

        // Double the last value if incomplete hex
        if !string.count.isMultiple(of: 2), let last = string.last {
            string.append(last)
        }

        // Fix invalid values
        if string.count > 8 {
            string = String(string.prefix(8))
        }

        // Scanner creation
        let scanner = Scanner(string: string)

        var color: UInt64 = 0
        scanner.scanHexInt64(&color)

        if string.count == 2 {
            let mask = 0xFF

            let g = Int(color) & mask

            let gray = Double(g) / 255.0

            self.init(.sRGB, red: gray, green: gray, blue: gray, opacity: 1)

        } else if string.count == 4 {
            let mask = 0x00FF

            let g = Int(color >> 8) & mask
            let a = Int(color) & mask

            let gray = Double(g) / 255.0
            let alpha = Double(a) / 255.0

            self.init(.sRGB, red: gray, green: gray, blue: gray, opacity: alpha)

        } else if string.count == 6 {
            let mask = 0x0000FF
            let r = Int(color >> 16) & mask
            let g = Int(color >> 8) & mask
            let b = Int(color) & mask

            let red = Double(r) / 255.0
            let green = Double(g) / 255.0
            let blue = Double(b) / 255.0

            self.init(.sRGB, red: red, green: green, blue: blue, opacity: 1)

        } else if string.count == 8 {
            let mask = 0x000000FF
            let r = Int(color >> 24) & mask
            let g = Int(color >> 16) & mask
            let b = Int(color >> 8) & mask
            let a = Int(color) & mask

            let red = Double(r) / 255.0
            let green = Double(g) / 255.0
            let blue = Double(b) / 255.0
            let alpha = Double(a) / 255.0

            self.init(.sRGB, red: red, green: green, blue: blue, opacity: alpha)

        } else {
            self.init(.sRGB, red: 1, green: 1, blue: 1, opacity: 1)
        }
    }
}

var backgroundGradient: 
LinearGradient {
    let stops = [Gradient.Stop(color: Color("backgroundColor"), location: 0.0),
                 Gradient.Stop(color: Color("mybrown"), location: 1.0)]
  return LinearGradient(stops: stops, startPoint: .top, endPoint: .bottom)
}

// MARK:  UX

let feedback = UINotificationFeedbackGenerator()

// MARK:  DATA
public var K_StatusHeight: CGFloat {
    get {
        if #available(iOS 13.0, *) {
            let keyWindow = UIApplication.shared.connectedScenes
                .map({ $0 as? UIWindowScene })
                .compactMap({ $0 })
                .first?.windows.first
            let statusBar = keyWindow?.windowScene?.statusBarManager?.statusBarFrame
            return statusBar?.size.height ?? 20.0
        } else {
            return UIApplication.shared.statusBarFrame.size.height
        }
    }
}

extension UINavigationController {

    func clearBackgroundColor() {
        topViewController?.view.backgroundColor = .clear
        topViewController?.parent?.view.backgroundColor = .clear
        topViewController?.parent?.parent?.view.backgroundColor = .clear
    }
}
