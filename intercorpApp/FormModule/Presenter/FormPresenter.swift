//
//  FormPresenter.swift
//  intercorpApp
//
//  Created by Nicolas schmidt on 16/10/2021.
//

import Foundation
import UIKit

class FormPresenter: FormPresenterProtocol {
  
  // MARK: - Protocol properties
  
  weak var view: FormViewProtocol?
  var interactor: FormInteractorProtocol?
  var router: FormRouterProtocol?
  
  // MARK: - Functions
  
  func sendUserData(userData: User?) {
    guard let user: User = userData else { return }
    interactor?.getUserData(userData: user)
  }
  
  func facebookLogout() {
    interactor?.facebookLogout()
  }
  
  func dismissFormModule() {
    router?.dismiss(controller: view)
  }
  
  func fetchUserEmail() {
    interactor?.fetchUserEmail()
  }
}
