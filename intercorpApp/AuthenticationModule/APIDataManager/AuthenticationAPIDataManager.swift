//
//  AuthenticationAPIDataManager.swift
//  intercorpApp
//
//  Created by Nicolas schmidt on 17/10/2021.
//

import Foundation
import FirebaseAuth
import FBSDKLoginKit
import UIKit

class AuthenticationAPIDataManager: AuthenticationAPIDataManagerProtocol {
  weak var interactor: AuthenticationInteractorProtocol?
  
  func loginWithFacebook(viewController: UIViewController) {
    let loginManager = LoginManager()
    loginManager.logOut()
    loginManager.logIn(permissions: [.email], viewController: viewController) { (Result) in
      switch Result {
        // When the service is success, we call Form Module
      case .success(granted: _, declined: _, token: let token):
        let credential = FacebookAuthProvider.credential(withAccessToken: token?.tokenString ?? String())
        Auth.auth().signIn(with: credential) { result, error in
          self.interactor?.goToFormModule()
        }
        // When the service is cancelled, the animation button is stopped
      case .cancelled:
        self.interactor?.stopAnimationButton()
        break
        // When the service failed, the popup is called
      case .failed(_):
        self.interactor?.callToPopup()
        break
      @unknown default:
        break
      }
    }
  }
  
  
}
