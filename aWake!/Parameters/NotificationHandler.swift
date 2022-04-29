//
//  NotificationHandler.swift
//  aWake
//
//  Created by Mikail Yavuz on 23/02/22.
//

import Foundation
import UserNotifications

func notificationRequest(date : DateComponents, title : String, subtitle : String) {
    
    let center = UNUserNotificationCenter.current()
    
    //    center.removeAllPendingNotificationRequests()
    
    let addRequest = {
        UNUserNotificationCenter.current().removeAllPendingNotificationRequests()
        let content = UNMutableNotificationContent()
        content.title = title
        content.subtitle = subtitle
        //        content.sound = UNNotificationSound(named: UNNotificationSoundName(rawValue: music))
        content.sound = UNNotificationSound(named: UNNotificationSoundName(rawValue: "Song"))
        
        let trigger = UNCalendarNotificationTrigger(dateMatching: date, repeats: false)
        
        let request = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: trigger)
        center.add(request)
    }
    center.getNotificationSettings { settings in
        if settings.authorizationStatus == .authorized {
            addRequest()
        } else {
            center.requestAuthorization(options: [.alert, .badge, .sound, .criticalAlert]) { success, error in
                if success {
                    addRequest()
                } else {
                    print("Pas d'autorisation")
                }
            }
        }
    }
}


func notificationReepeting(interval : Double, title : String, subtitle : String) {
    let center = UNUserNotificationCenter.current()
    
    let addRequest = {
        let content = UNMutableNotificationContent()
        content.title = title
        content.subtitle = subtitle
        //        content.sound = UNNotificationSound(named: UNNotificationSoundName(music))
        content.sound = UNNotificationSound(named: UNNotificationSoundName(rawValue: "Song"))
        
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: interval, repeats: true)
        
        let request = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: trigger)
        center.add(request)
    }
    
    center.getNotificationSettings { settings in
        if settings.authorizationStatus == .authorized {
            addRequest()
        } else {
            center.requestAuthorization(options: [.sound, .alert, .badge, .criticalAlert]) { success, error in
                if success {
                    addRequest()
                } else {
                    print("Pas d'autorisation")
                }
            }
        }
    }
}


func deleteNotifications() {
    let center = UNUserNotificationCenter.current()
    center.removeAllPendingNotificationRequests()
}
