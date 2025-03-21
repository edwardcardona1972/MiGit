//
//  AppDelegate.swift
//  iOSCalculator
//
//  Created by Eduard Alexis Cardona Grajales on 26/2/25.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        //setup
        setupView()
        
        return true
    }

    
// MARK: - Private methods
    
private func setupView() {
    window = UIWindow(frame: UIScreen.main.bounds)
    let vc = HomeViewController()
    window?.rootViewController = vc
    window?.makeKeyAndVisible()
    }
}

