//
//  QRCodeView.swift
//  aWake
//
//  Created by Mikail Yavuz on 09/03/22.
//

import SwiftUI

struct QRCodeView: View {
    
    
    @AppStorage("start", store: .standard) var start : Bool = false
    
    @State var qrCodeText: String = ""
    
    @State var testBoolQRCode = false
    
    var body: some View {
        VStack {
            QRCodeScanner(qrCodeFrameColor: UIColor(Color.myYellow), qrCodeText: $qrCodeText).edgesIgnoringSafeArea(.all)
        }
        
        VStack {
            
            if qrCodeText == "mc3qrcode" {
                Text("")
                    .onAppear {
                        testBoolQRCode.toggle()
                    }
            }
            
            if testBoolQRCode == true {
                
                Button {
                    deleteNotifications()
                    start.toggle()
                } label: {
                    Image(systemName: "checkmark.circle.fill")
                        .font(.system(size: 120))
                        .foregroundColor(.myYellow)
                        .frame(width: 200, height: 200, alignment: .center)
                }
            }
        }
    }
}

struct QRCodeView_Previews: PreviewProvider {
    static var previews: some View {
        QRCodeView()
    }
}
