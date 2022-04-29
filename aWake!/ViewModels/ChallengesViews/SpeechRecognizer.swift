//
//  SpeechRecognizer.swift
//  aWake
//
//  Created by Mikail Yavuz on 29/04/22.
//

import AVFoundation
import Foundation
import Speech
import SwiftUI

//class SpeechRecognizer: ObservableObject {
//    enum RecognizerError: Error {
//        case nilRecognizer
//        case notAuthorizedToRecognize
//        case notPermittedToRecord
//        case recognizerIsUnavailable
//        
//        var message: String {
//            switch self {
//            case .nilRecognizer: return "Can't initialize speech recognizer"
//            case .notAuthorizedToRecognize: return "Not authorized to recognize speech"
//            case .notPermittedToRecord: return "Not permitted to record audio"
//            case .recognizerIsUnavailable: return "Recognizer is unavailable"
//            }
//        }
//    }
//    
//    var transcript: String = ""
//    
//    private var audioEngine: AVAudioEngine?
//    private var request: SFSpeechAudioBufferRecognitionRequest?
//    private var task: SFSpeechRecognitionTask?
//    private let recognizer: SFSpeechRecognizer?
//    
//    init() {
//        recognizer = SFSpeechRecognizer(locale: Locale.init(identifier: "en-GB"))
//        
//        
//        Task(priority: .background) {
//            do {
//                guard recognizer != nil else {
//                    throw RecognizerError.nilRecognizer
//                }
//                guard await SFSpeechRecognizer.hasAuthorizationToRecognize() else {
//                    throw RecognizerError.notAuthorizedToRecognize
//                }
//                guard await AVAudioSession.sharedInstance().hasPermissionToRecord() else {
//                    throw RecognizerError.notPermittedToRecord
//                }
//            } catch {
//                speakError(error)
//            }
//        }
//    }
//    
//    deinit {
//        reset()
//    }
//    
//    func transcribe() {
//        DispatchQueue(label: "Speech Queue", qos: .background).async { [weak self] in
//            guard let self = self, let recognizer = self.recognizer, recognizer.isAvailable else {
//                self?.speakError(RecognizerError.recognizerIsUnavailable)
//                return
//            }
//        }
//    }
//    
//    func stopTranscribing() {
//        reset()
//    }
//    
//    func reset() {
//        task?.cancel()
//        audioEngine?.stop()
//        audioEngine = nil
//        request = nil
//        task = nil
//    }
//    
//    private func speak(_ message: String) {
//        transcript = message
//    }
//    
//    private func speakError(_ error: Error) {
//        var errorMessage = ""
//        if let error = error as? RecognizerError {
//            errorMessage += error.message
//        } else {
//            errorMessage += error.localizedDescription
//        }
//        transcript = "<< \(errorMessage) >>"
//    }
//}

extension SFSpeechRecognizer {
    static func hasAuthorizationToRecognize() async -> Bool {
        await withCheckedContinuation { continuation in
            requestAuthorization { status in
                continuation.resume(returning: status == .authorized)
            }
        }
    }
}

extension AVAudioSession {
    func hasPermissionToRecord() async -> Bool {
        await withCheckedContinuation { continuation in
            requestRecordPermission { authorized in
                continuation.resume(returning: authorized)
            }
        }
    }
}

