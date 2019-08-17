//
//  AppDelegate.swift
//  Moop
//
//  Created by Chang Woo Son on 22/05/2019.
//  Copyright © 2019 kor45cw. All rights reserved.
//

import UIKit
import Firebase
import Networking

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        librarySetup()
        ShortcutManager.shared.application(didFinishLaunchingWithOptions: launchOptions)
        NotificationManager.shared.register(application)
        MovieInfoManager.shared.requestFutureData()
        return true
    }
    
    /// - Tag: PerformAction
    func application(_ application: UIApplication, performActionFor shortcutItem: UIApplicationShortcutItem, completionHandler: @escaping (Bool) -> Void) {
        ShortcutManager.shared.application(performActionFor: shortcutItem)
    }
    
    /// - Tag: DidBecomeActive
    func applicationDidBecomeActive(_ application: UIApplication) {
        ShortcutManager.shared.applicationDidBecomeActive(rootViewController: window?.rootViewController)
    }
    
    /// - Tag: WillResignActive
    func applicationWillResignActive(_ application: UIApplication) {
        ShortcutManager.shared.applicationWillResignActive(application)
    }
}

extension AppDelegate {
    func librarySetup() {
        FirebaseApp.configure()
        Fabric.with([Crashlytics.self])
        APISetupManager.setup()
    }
}
