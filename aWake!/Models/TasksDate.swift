//
//  TasksDate.swift
//  aWake
//
//  Created by Mikail Yavuz on 23/02/22.
//

import Foundation

class TasksData : Identifiable, ObservableObject {
    
    @Published var title : String
    @Published var level : String
    @Published var choose : Bool
    
    init(title : String, level : String, choose : Bool) {
        self.title = title
        self.level = level
        self.choose = choose
    }
}

var tasksArray : [TasksData] = [
    TasksData(title: "Voice scanner", level: "Medium", choose: false),
    TasksData(title: "QRCode scanner", level: "Hard  ", choose: false)
]

