//
//  TasksLevel.swift
//  aWake
//
//  Created by Mikail Yavuz on 23/02/22.
//

import Foundation

enum tasksLevel : String {
    case easy = "Easy"
    case medium = "Medium"
    case hard = "Hard"
}

let easy = tasksLevel(rawValue: "Easy")!
let medium = tasksLevel(rawValue: "Medium")!
let hard = tasksLevel(rawValue: "Hard")!
