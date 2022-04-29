//
//  DaysCard.swift
//  aWake
//
//  Created by Mikail Yavuz on 24/02/22.
//

import SwiftUI

struct DaysCard: View {
    
    @StateObject var daysSeletion = DaysData(longName: String(), shortName: String(), isSelected: Bool())
    
    var body: some View {
        HStack {
            ForEach(daysArray) { day in
                Button(action: {
                    daysSeletion.isSelected.toggle()
                }) {
                    Circle()
                        .strokeBorder(Color.myYellow, lineWidth: 1)
                        .background(Circle().fill(day.isSelected == true ? Color.myYellow : Color.white))
                        
                        .overlay(
                            Text(daysSeletion.shortName)
                            .bold()
                            .font(.system(size: 30))
                            .foregroundColor(.black)
                    )
                }
            }
        }
    }
}

struct DaysCard_Previews: PreviewProvider {
    static var previews: some View {
        DaysCard()
    }
}
