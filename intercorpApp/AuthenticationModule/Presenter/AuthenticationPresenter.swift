//
//  IntercorpAppPresenter.swift
//  intercorpApp
//
//  Created by Nicolas schmidt on 15/10/2021.
//

import Foundation
import UIKit

class AuthenticationPresenter: AuthenticationPresenterProtocol {
  
  // MARK: - Protocol properties
  
  weak var view: AuthenticationViewProtocol?
  var interactor: AuthenticationInteractorProtocol?
  var router: AuthenticationRouterProtocol?
  
  // MARK: - Functions
  
  func loginWithFacebook(viewController: UIViewController) {
    interactor?.loginWithFacebook(viewController: viewController)
  }
  
  func goToFormModule() {
    router?.goToFormModule(from: view)
  }
  
  func callToPopup() {
    view?.showPopup()
  }
}
