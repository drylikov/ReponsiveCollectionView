//
//  AppDelegate.swift
//  CollectionViewResponsiveLayout
//
//  Created by Alfian Losari on 2/8/19.
//  Copyright © 2019 Alfian Losari. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        setupDarkTheme()
        return true
    }
    
    private func setupDarkTheme() {
        UINavigationBar.appearance().barTintColor = UIColor(red: 45/255, green: 45/255, blue: 45/255, alpha: 1.0)
        UINavigationBar.appearance().titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
        UIBarButtonItem.appearance().tintColor = UIColor.white
    }

}
