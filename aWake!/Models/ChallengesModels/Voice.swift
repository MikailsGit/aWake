//
//  Voice.swift
//  aWake
//
//  Created by Mikail Yavuz on 10/03/22.
//

import Foundation
import SwiftUI
import Speech

public class SwiftUISpeech: ObservableObject {
    init() {
        
        SFSpeechRecognizer.requestAuthorization { authStatus in
            OperationQueue.main.addOperation {
                switch authStatus {
                case .authorized:
                    break
                    
                case .denied:
                    break
                    
                case .restricted:
                    break
                    
                case .notDetermined:
                    break
                    
                default:
                    break
                }
            }
        }
        
        recognitionTask?.cancel()
        self.recognitionTask = nil
    }
    
    func getButton() -> SpeechButton {
        return button
    }
    
    func startRecording() {
        
        outputText = "";
        
        let audioSession = AVAudioSession.sharedInstance()
        let inputNode = audioEngine.inputNode
        
        do {
            try audioSession.setCategory(.record, mode: .measurement, options: .duckOthers)
            try audioSession.setActive(true, options: .notifyOthersOnDeactivation)
        } catch {
            print("ERROR: - Audio Session Failed!")
        }
        
        
        let recordingFormat = inputNode.outputFormat(forBus: 0)
        inputNode.installTap(onBus: 0, bufferSize: 1024, format: recordingFormat) { (buffer: AVAudioPCMBuffer, when: AVAudioTime) in
            self.recognitionRequest?.append(buffer)
        }
        
        audioEngine.prepare()
        
        do {
            try audioEngine.start()
        } catch {
            print("ERROR: - Audio Engine failed to start")
        }
        
        recognitionRequest = SFSpeechAudioBufferRecognitionRequest()
        guard let recognitionRequest = recognitionRequest else { fatalError("Unable to create a SFSpeechAudioBufferRecognitionRequest object") }
        recognitionRequest.shouldReportPartialResults = true
        
        recognitionTask = speechRecognizer?.recognitionTask(with: recognitionRequest){ result, error in
            if (result != nil){
                self.outputText = (result?.transcriptions[0].formattedString)!
            }
            if let result = result{
                
                self.outputText = result.transcriptions[0].formattedString
            }
            if error != nil {
                
                self.audioEngine.stop()
                inputNode.removeTap(onBus: 0)
                self.recognitionRequest = nil
                self.recognitionTask = nil
            }
        }
    }
    
    func stopRecording() {
        
        audioEngine.stop()
        recognitionRequest?.endAudio()
        self.audioEngine.inputNode.removeTap(onBus: 0)
        self.recognitionTask?.cancel()
        self.recognitionTask = nil
        
    }
    
    
    func getSpeechStatus() -> String {
        
        switch authStat {
            
        case .authorized:
            return "Authorized"
            
        case .notDetermined:
            return "Not yet Determined"
            
        case .denied:
            return "Denied - Close the App"
            
        case .restricted:
            return "Restricted - Close the App"
            
        default:
            return "ERROR: No Status Defined"
            
        }
    }
    
    @Published var isRecording:Bool = false
    @Published var button = SpeechButton()
    
    private let speechRecognizer = SFSpeechRecognizer(locale: Locale(identifier : "en-GB"))
    private var recognitionRequest : SFSpeechAudioBufferRecognitionRequest?
    private let authStat = SFSpeechRecognizer.authorizationStatus()
    private var recognitionTask : SFSpeechRecognitionTask?
    private let audioEngine = AVAudioEngine()
    public var outputText : String = "";
    
    
}
