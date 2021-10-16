//
//  SceneDelegate.swift
//  intercorpApp
//
//  Created by Nicolas schmidt on 15/10/2021.
//

import UIKit
import FBSDKLoginKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
  
  var window: UIWindow?
  
  func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
    guard let windowScene = (scene as? UIWindowScene) else { return }
    window?.windowScene = windowScene
    window?.makeKeyAndVisible()
    AuthenticationRouter().presentAuthenticationModule(from: window)
  }
  
  func scene(_ scene: UIScene, openURLContexts URLContexts: Set<UIOpenURLContext>) {
    guard let url = URLContexts.first?.url else {
      return
    }
    
    ApplicationDelegate.shared.application(
      UIApplication.shared,
      open: url,
      sourceApplication: nil,
      annotation: [UIApplication.OpenURLOptionsKey.annotation]
    )
  }
}

