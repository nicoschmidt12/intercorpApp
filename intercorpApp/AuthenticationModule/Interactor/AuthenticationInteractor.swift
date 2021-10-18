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
  var apiDataManager: AuthenticationAPIDataManagerProtocol?
  
  // MARK: - Functions
  
  func loginWithFacebook(viewController: UIViewController) {
    apiDataManager?.loginWithFacebook(viewController: viewController)
  }
  
  func goToFormModule() {
    presenter?.goToFormModule()
  }
  
  func callToPopup() {
    presenter?.callToPopup()
  }
  
  func stopAnimationButton() {
    presenter?.stopAnimatingButton()
  }
}
