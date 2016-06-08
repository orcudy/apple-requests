//
//  AppDelegate.swift
//  demo
//
//  Created by Chris Orcutt User on 6/8/16.
//  Copyright © 2016 Apple Requests. All rights reserved.
//

import UIKit

class TokenManager {
    static let sharedInstance = TokenManager()
    var device = ""
}

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        //register for push notifications
        let settings = UIUserNotificationSettings(forTypes: [.Alert, .Sound], categories: nil)
        UIApplication.sharedApplication().registerUserNotificationSettings(settings)
        UIApplication.sharedApplication().registerForRemoteNotifications()
        return true
    }
    
    func application(application: UIApplication, didRegisterForRemoteNotificationsWithDeviceToken deviceToken: NSData) {
        print("device token: \(deviceToken)")
        
        if let token = String(data: deviceToken, encoding: NSUTF8StringEncoding){
            TokenManager.sharedInstance.device = token
        }
    }
    
    func application(application: UIApplication, didFailToRegisterForRemoteNotificationsWithError error: NSError) {
        print("error: \(error)")
    }
}

