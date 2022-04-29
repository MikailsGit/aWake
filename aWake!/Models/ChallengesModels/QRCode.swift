//
//  QRCode.swift
//  aWake
//
//  Created by Mikail Yavuz on 18/02/22.
//

import Foundation
import AVFoundation
import SwiftUI

class QRCodeScannerViewController: UIViewController {
    
    let captureSession = AVCaptureSession()
    let captureMetadataOutput = AVCaptureMetadataOutput()
    var videoPreviewLayer: AVCaptureVideoPreviewLayer?
    var qrCodeFrameView = UIView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        guard let captureDevice = AVCaptureDevice.default(.builtInWideAngleCamera, for: .video, position: .back) else {
            print("Failed to get the camera device")
            return
        }
        do {
            
            let input = try AVCaptureDeviceInput(device: captureDevice)
            captureSession.addInput(input)
            
            
            captureSession.addOutput(captureMetadataOutput)
            
            captureMetadataOutput.metadataObjectTypes = [.qr]
            
            
            videoPreviewLayer = AVCaptureVideoPreviewLayer(session: captureSession)
            videoPreviewLayer?.videoGravity = AVLayerVideoGravity.resizeAspectFill
            videoPreviewLayer?.frame = view.layer.bounds
            view.layer.addSublayer(videoPreviewLayer!)
            
            
            captureSession.startRunning()
            
            
            qrCodeFrameView.layer.borderWidth = 2
            view.addSubview(qrCodeFrameView)
            view.bringSubviewToFront(qrCodeFrameView)
            
        } catch {
            return
        }
    }
    
    func qrCodeFrameBorder(color: UIColor) {
        qrCodeFrameView.layer.borderColor = color.cgColor
    }
}


struct QRCodeScanner: UIViewControllerRepresentable {
    
    var qrCodeFrameColor: UIColor
    @Binding var qrCodeText: String
    
    let qrCodeScannerViewController = QRCodeScannerViewController()
    func makeUIViewController(context: Context) -> QRCodeScannerViewController {
        qrCodeScannerViewController.qrCodeFrameBorder(color: qrCodeFrameColor)
        qrCodeScannerViewController.captureMetadataOutput.setMetadataObjectsDelegate(context.coordinator, queue: .main)
        return qrCodeScannerViewController
    }
    
    func updateUIViewController(_ uiViewController: QRCodeScannerViewController, context: Context) {
        
    }
    
    func makeCoordinator() -> QRCodeScannerCoordinator {
        QRCodeScannerCoordinator(self)
    }
    
    class QRCodeScannerCoordinator: NSObject, AVCaptureMetadataOutputObjectsDelegate {
        let qrCodeScanner: QRCodeScanner
        let qrCodeScannerViewController: QRCodeScannerViewController
        init(_ qrCodeScanner: QRCodeScanner) {
            self.qrCodeScanner = qrCodeScanner
            qrCodeScannerViewController = qrCodeScanner.qrCodeScannerViewController
        }
        
        
        func metadataOutput(_ output: AVCaptureMetadataOutput, didOutput metadataObjects: [AVMetadataObject], from connection: AVCaptureConnection) {
            
            if metadataObjects.count == 0 {
                qrCodeScannerViewController.qrCodeFrameView.frame = CGRect.zero
                qrCodeScanner.qrCodeText = ""
                return
            }
            
            let metadataObj = metadataObjects[0] as! AVMetadataMachineReadableCodeObject
            if metadataObj.type == AVMetadataObject.ObjectType.qr {
                
                let barCodeObject = qrCodeScannerViewController.videoPreviewLayer?.transformedMetadataObject(for: metadataObj)
                qrCodeScannerViewController.qrCodeFrameView.frame = barCodeObject!.bounds
                guard let qrCodeText = metadataObj.stringValue else { return }
                qrCodeScanner.qrCodeText = qrCodeText
            }
        }
    }
}

