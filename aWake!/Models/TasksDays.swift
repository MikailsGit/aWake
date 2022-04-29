//
//  TasksDays.swift
//  aWake
//
//  Created by Mikail Yavuz on 24/02/22.
//

import Foundation

enum TasksDays : Int {
    case monday = 1
    case tuesday
    case wednesday
    case thursday
    case friday
    case saturday
    case sunday
}

class DaysData : Identifiable, ObservableObject {
    var id = UUID()
    var longName : String
    var shortName : String
    @Published var isSelected = false
    
    init(longName : String, shortName : String, isSelected : Bool) {
        self.longName = longName
        self.shortName = shortName
        self.isSelected = isSelected
    }
}

var daysArray : [DaysData] = [
    DaysData(longName: "Monday", shortName: "M", isSelected: false),
    DaysData(longName: "Tuesday", shortName: "T", isSelected: false),
    DaysData(longName: "Wednesday", shortName: "W", isSelected: false),
    DaysData(longName: "Thursday", shortName: "T", isSelected: false),
    DaysData(longName: "Friday", shortName: "F", isSelected: false),
    DaysData(longName: "Saturday", shortName: "S", isSelected: false),
    DaysData(longName: "Sunday", shortName: "S", isSelected: false),
]

