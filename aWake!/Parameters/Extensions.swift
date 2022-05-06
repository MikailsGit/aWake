//
//  Extensions.swift
//  aWake
//
//  Created by Mikail Yavuz on 07/03/22.
//

import Foundation
import SwiftUI


extension Date: RawRepresentable {
    private static let formatter = ISO8601DateFormatter()
    
    public var rawValue: String {
        Date.formatter.string(from: self)
    }
    
    public init?(rawValue: String) {
        self = Date.formatter.date(from: rawValue) ?? Date()
    }
}


extension Color {
    static let myYellow = Color(red: 244 / 255, green: 191 / 255, blue: 66 / 255)
}

extension View {
    func underlineTextField() -> some View {
        self
            .padding(.vertical, 10)
            .overlay(Rectangle().frame(height: 2).padding(.top, 35))
            .foregroundColor(.myYellow)
            .padding(10)
    }
}

extension View {
    func timerStyle() -> some View {
        self
            .padding(.top, 200)
            .font(.system(size: 60))
            .padding(.vertical, 10)
            .overlay(Rectangle().foregroundColor(.myYellow).frame(height: 4).padding(.top, 265))
            .padding(10)
    }
}

extension View {
    func timerStyle2() -> some View {
        self
            .padding(.top, 0)
            .font(.system(size: 60))
            .padding(.vertical, 10)
            .overlay(Rectangle().foregroundColor(.myYellow).frame(height: 4).padding(.top, 65))
            .padding(10)
        
    }
}

extension View {
    func levelModifier() -> some View {
        self
            .font(.system(size: 20))
            .padding(.bottom, 10)
            .padding(.trailing, 125)
    }
}

extension DispatchQueue {
    
    static func background(delay: Double = 0.0, background: (() -> Void)? = nil, completion: (() -> Void)? = nil) {
        DispatchQueue.global(qos: .background).async {
            background?()
            if let completion = completion {
                DispatchQueue.main.asyncAfter(deadline: .now() + delay, execute: {
                    completion()
                })
            }
        }
    }
}
