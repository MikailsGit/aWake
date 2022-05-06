//
//  DataStorage.swift
//  aWake
//
//  Created by Mikail Yavuz on 09/03/22.
//

import Foundation


class DataStorage: ObservableObject {
    
    @Published var complete: Bool {
        didSet {
            UserDefaults.standard.set(complete, forKey: "complete")
        }
    }
    
    
    
    @Published var voiceComplete: Bool {
        didSet {
            UserDefaults.standard.set(voiceComplete, forKey: "voiceComplete")
        }
    }
    
    @Published var qrComplete: Bool {
        didSet {
            UserDefaults.standard.set(qrComplete, forKey: "qrComplete")
        }
    }
    
    @Published var stepsComplete: Bool {
        didSet {
            UserDefaults.standard.set(stepsComplete, forKey: "stepsComplete")
        }
    }
    
    
    
    @Published var speech: Bool {
        didSet {
            UserDefaults.standard.set(speech, forKey: "speech")
        }
    }
    
    @Published var qrCode: Bool {
        didSet {
            UserDefaults.standard.set(qrCode, forKey: "qrCode")
        }
    }
    
    @Published var steps: Bool {
        didSet {
            UserDefaults.standard.set(steps, forKey: "steps")
        }
    }
    
    
    
    @Published var date: Date {
        didSet {
            UserDefaults.standard.set(date, forKey: "date")
        }
    }
    
    
    
    init() {
        self.complete = UserDefaults.standard.object(forKey: "complete") as? Bool ?? false
        
        self.voiceComplete = UserDefaults.standard.object(forKey: "voiceComplete") as? Bool ?? false
        self.qrComplete = UserDefaults.standard.object(forKey: "qrComplete") as? Bool ?? false
        self.stepsComplete = UserDefaults.standard.object(forKey: "stepsComplete") as? Bool ?? false
        
        self.speech = UserDefaults.standard.object(forKey: "speech") as? Bool ?? false
        self.qrCode = UserDefaults.standard.object(forKey: "qrCode") as? Bool ?? false
        self.steps = UserDefaults.standard.object(forKey: "steps") as? Bool ?? false
        
        self.date = UserDefaults.standard.object(forKey: "date") as? Date ?? Date()
    }
}

