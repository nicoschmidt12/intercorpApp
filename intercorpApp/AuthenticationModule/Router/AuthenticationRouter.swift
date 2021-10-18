//
//  IntercorpAppRouter.swift
//  intercorpApp
//
//  Created by Nicolas schmidt on 15/10/2021.
//

import Foundation
import UIKit

class AuthenticationRouter: AuthenticationRouterProtocol {
  
  let routerForm: FormRouter = FormRouter()
  
  func presentAuthenticationModule(from window: UIWindow?) {
    let view: AuthenticationView = AuthenticationView.instantiateFromStoryboard()
    let interactor: AuthenticationInteractorProtocol = AuthenticationInteractor()
    let router: AuthenticationRouterProtocol = AuthenticationRouter()
    let presenter: AuthenticationPresenterProtocol = AuthenticationPresenter()
    let dataManager: AuthenticationAPIDataManagerProtocol = AuthenticationAPIDataManager()
    let navigationController = UINavigationController(rootViewController: view)
    window?.rootViewController = navigationController
    view.presenter = presenter
    presenter.view = view
    presenter.router = router
    presenter.interactor = interactor
    interactor.presenter = presenter
    interactor.apiDataManager = dataManager
    dataManager.interactor = interactor
  }
  
  func goToFormModule(from viewController: AnyObject?) {
    guard let viewController: UIViewController = viewController as? UIViewController else { return }
    routerForm.presentFormModule(from: viewController)
  }
}
