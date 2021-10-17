//
//  IntercorpAppInteractor.swift
//  intercorpApp
//
//  Created by Nicolas schmidt on 15/10/2021.
//

import Foundation
import FirebaseAuth
import FBSDKLoginKit
import UIKit

class AuthenticationInteractor: AuthenticationInteractorProtocol {
  
  // MARK: - Protocol properties
  
  weak var presenter: AuthenticationPresenterProtocol?
  
  // MARK: - Functions
  
  func loginWithFacebook(viewController: UIViewController) {
    let loginManager = LoginManager()
    loginManager.logOut()
    loginManager.logIn(permissions: [.email], viewController: viewController) { (Result) in
      switch Result {
        // When the service is success, we call Form Module
      case .success(granted: _, declined: _, token: let token):
        let credential = FacebookAuthProvider.credential(withAccessToken: token?.tokenString ?? String())
        Auth.auth().signIn(with: credential) { result, error in
          self.presenter?.goToFormModule()
        }
        // When the service is cancelled, we don't do nothing
      case .cancelled:
        break
        // When the service failed, the popup is called
      case .failed(_):
        self.presenter?.callToPopup()
        break
      @unknown default:
        break
      }
    }
  }
}
