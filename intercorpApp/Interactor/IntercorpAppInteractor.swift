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

class IntercorpAppInteractor: IntercorpAppInteractorProtocol {
  
  // MARK: - Protocol properties
  
  weak var presenter: IntercorpAppPresenterProtocol?
  
  func loginWithFacebook(viewController: UIViewController) {
    let loginManager = LoginManager()
    loginManager.logOut()
    loginManager.logIn(permissions: [], viewController: viewController) { (Result) in
      switch Result {
      case .success(granted: _, declined: _, token: let token):
        let credential = FacebookAuthProvider.credential(withAccessToken: token?.tokenString ?? String())
        Auth.auth().signIn(with: credential) { result, error in
          // TODO - Go to form Module
        }
      case .cancelled:
        break
      case .failed(_):
        // TODO - Create popup
        break
      @unknown default:
        break
      }
    }
  }
}
