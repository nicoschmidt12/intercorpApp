//
//  AppDelegate.swift
//  intercorpApp
//
//  Created by Nicolas schmidt on 15/10/2021.
//

import UIKit
import Firebase
import FBSDKLoginKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
  
  var window: UIWindow?
  
  func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
    
    // Firebase
    FirebaseApp.configure()
    
    // Facebook
    ApplicationDelegate.shared.application(application, didFinishLaunchingWithOptions:launchOptions)
    
    return true
  }
  
  func application(_ app: UIApplication, open url: URL, options:[UIApplication.OpenURLOptionsKey: Any] = [:]) -> Bool {
    ApplicationDelegate.shared.application(
      app,
      open: url,
      sourceApplication: options[UIApplication.OpenURLOptionsKey.sourceApplication] as? String,
      annotation: options[UIApplication.OpenURLOptionsKey.annotation]
    )
  }
}

