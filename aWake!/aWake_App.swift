//
//  aWake_App.swift
//  aWake!
//
//  Created by Mikail Yavuz on 29/04/22.
//

import SwiftUI

@main
struct aWakeApp: App {
    
    @ObservedObject var dataStorage = DataStorage()
    
    @AppStorage("start", store: .standard) var test : Bool = false
    
    @ViewBuilder
    var body: some Scene {
        WindowGroup {
            
            if test == false {
                MainView()
            } else if test == true {
                TaskView()
            }
        }
    }
}

