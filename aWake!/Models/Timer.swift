//
//  Timer.swift
//  aWake
//
//  Created by Mikail Yavuz on 09/03/22.
//

import Foundation
import SwiftUI

func countDownString(from date: Date, until nowDate: Date) -> String {
    let calendar = Calendar.current
    let components = calendar
        .dateComponents([.hour, .minute, .second]
                        ,from: nowDate,
                        to: date)
    return String(format: "%02d : %02d : %02d",
                  components.hour ?? 00,
                  components.minute ?? 00,
                  components.second ?? 00)
}
