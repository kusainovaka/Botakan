//
//  AppDelegate.swift
//  mamakaz
//
//  Created by Kamila Kusainova on 10.12.17.
//  Copyright © 2017 kusainovaka. All rights reserved.
//
import UIKit
import StoreKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        
        window = UIWindow(frame: screenBounds)
        
        let menuViewController = UINavigationController(rootViewController: MenuViewController())
        window?.rootViewController = menuViewController
        window?.makeKeyAndVisible()
        
        return true
    }
}

