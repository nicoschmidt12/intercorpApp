//
//  AppDelegate.swift
//  intercorpApp
//
//  Created by Nicolas schmidt on 15/10/2021.
//

import UIKit
import Firebase

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
  
  var window: UIWindow?
  
  func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
    window = UIWindow(frame: UIScreen.main.bounds)
    let viewController = IntercorpAppRouter.createIntercorpAppModule()
    window?.rootViewController = viewController
    window?.makeKeyAndVisible()
    
    // Firebase
    FirebaseApp.configure()
    return true
  }
}

