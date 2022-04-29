//
//  TasksCardsCreate.swift
//  aWake
//
//  Created by Mikail Yavuz on 07/03/22.
//

import SwiftUI

struct TasksCardsCreate: View {
    
    @ObservedObject var dataStorage = DataStorage()
    
    @State var select : Bool = false
    var challengeName : String
    var challengeLevel : String
    
    var titlePadding : CGFloat
    var levelPadding : CGFloat
    
    var body: some View {
        VStack {
            Button {
                
                select.toggle()
                self.select = select
                
            } label: {
                ZStack {
                    RoundedRectangle(cornerRadius: 10)
                        .frame(width: 300, height: 140)
                        .foregroundColor(select ? Color.myYellow : Color.gray.opacity(0.20))
                    
                    VStack {
                        HStack {
                            Text(challengeName).foregroundColor(.black)
                                .font(.system(size: 28))
                                .bold()
                                .padding(.top, 5)
                                .padding(.trailing, titlePadding)
                            
                        }
                        .frame(width: 230, height: 40)
                        
                        Spacer()
                        
                        Text(challengeLevel).foregroundColor(.black)
                            .font(.system(size: 20))
                            .padding(.bottom, 10)
                            .padding(.trailing, levelPadding)
                        
                    } .padding(.trailing, 65)
                } .frame(width: 300, height: 140)
            }
        }.environmentObject(DataStorage())
    }
}
