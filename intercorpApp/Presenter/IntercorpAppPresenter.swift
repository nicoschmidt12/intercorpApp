//
//  IntercorpAppPresenter.swift
//  intercorpApp
//
//  Created by Nicolas schmidt on 15/10/2021.
//

import Foundation
import UIKit

class IntercorpAppPresenter: IntercorpAppPresenterProtocol {
  
  // MARK: - Protocol properties
  
  weak var view: IntercorpAppViewProtocol?
  var interactor: IntercorpAppInteractorProtocol?
  var router: IntercorpAppRouterProtocol?
  
  func loginWithFacebook(viewController: UIViewController) {
    interactor?.loginWithFacebook(viewController: viewController)
  }
}
