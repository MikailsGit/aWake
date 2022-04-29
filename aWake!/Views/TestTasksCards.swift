//
//  TestTasksCards.swift
//  aWake
//
//  Created by Mikail Yavuz on 09/03/22.
//

import SwiftUI


struct TestTasksCards: View {
    
    @ObservedObject var dataStorage = DataStorage()
    
    var body: some View {
        HStack {
            VStack {
                Button {
                    dataStorage.speech.toggle()
                } label: {
                    ZStack {
                        RoundedRectangle(cornerRadius: 10)
                            .frame(width: 300, height: 140)
                            .foregroundColor(dataStorage.speech ? Color.myYellow : Color.gray.opacity(0.20))
                        
                        VStack {
                            HStack {
                                Text("Voice Scanner").foregroundColor(.black)
                                    .font(.system(size: 28))
                                    .bold()
                                    .padding(.top, 5)
                                    .padding(.trailing, 30)
                                
                            }
                            .frame(width: 230, height: 40)
                            
                            Spacer()
                            
                            Text("Medium").foregroundColor(.black)
                                .font(.system(size: 20))
                                .padding(.bottom, 10)
                                .padding(.trailing, 130)
                            
                        } .padding(.trailing, 65)
                    } .frame(width: 300, height: 140)
                }
            }
            VStack {
                Button {
                    
                    dataStorage.qrCode.toggle()
                    
                } label: {
                    ZStack {
                        RoundedRectangle(cornerRadius: 10)
                            .frame(width: 300, height: 140)
                            .foregroundColor(dataStorage.qrCode ? Color.myYellow : Color.gray.opacity(0.20))
                        
                        VStack {
                            HStack {
                                Text("QRCode Scanner").foregroundColor(.black)
                                    .font(.system(size: 28))
                                    .bold()
                                    .padding(.top, 5)
                                    .padding(.trailing, 0)
                                
                            }
                            .frame(width: 230, height: 40)
                            
                            Spacer()
                            
                            Text("Hard").foregroundColor(.black)
                                .font(.system(size: 20))
                                .padding(.bottom, 10)
                                .padding(.trailing, 155)
                            
                        } .padding(.trailing, 65)
                    } .frame(width: 300, height: 140)
                }
            }
            VStack {
                Button {
                    
                    dataStorage.steps.toggle()
                    
                } label: {
                    ZStack {
                        RoundedRectangle(cornerRadius: 10)
                            .frame(width: 300, height: 140)
                            .foregroundColor(dataStorage.steps ? Color.myYellow : Color.gray.opacity(0.20))
                        
                        VStack {
                            HStack {
                                Text("Steps Scanner").foregroundColor(.black)
                                    .font(.system(size: 28))
                                    .bold()
                                    .padding(.top, 5)
                                    .padding(.trailing, 30)
                                
                            }
                            .frame(width: 230, height: 40)
                            
                            Spacer()
                            
                            Text("Hard").foregroundColor(.black)
                                .font(.system(size: 20))
                                .padding(.bottom, 10)
                                .padding(.trailing, 155)
                            
                        } .padding(.trailing, 65)
                    } .frame(width: 300, height: 140)
                }
            }
        }
    }
}
