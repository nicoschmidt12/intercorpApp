//
//  IntercorpAppRouter.swift
//  intercorpApp
//
//  Created by Nicolas schmidt on 15/10/2021.
//

import Foundation
import UIKit

class AuthenticationRouter: AuthenticationRouterProtocol {
  
  func presentAuthenticationModule(from window: UIWindow?) {
    let view: AuthenticationView = AuthenticationView.instantiateFromStoryboard()
    let interactor: AuthenticationInteractorProtocol = AuthenticationInteractor()
    let router: AuthenticationRouterProtocol = AuthenticationRouter()
    let presenter: AuthenticationPresenterProtocol = AuthenticationPresenter()
    let navigationController = UINavigationController(rootViewController: view)
    window?.rootViewController = navigationController
    view.presenter = presenter
    presenter.view = view
    presenter.router = router
    presenter.interactor = interactor
    interactor.presenter = presenter
  }
}
