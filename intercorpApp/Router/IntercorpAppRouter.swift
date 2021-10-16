//
//  IntercorpAppRouter.swift
//  intercorpApp
//
//  Created by Nicolas schmidt on 15/10/2021.
//

import Foundation
import UIKit

class IntercorpAppRouter: IntercorpAppRouterProtocol {
  
  func presentIntercorpAppModule(from window: UIWindow?) {
    let view: IntercorpAppView = IntercorpAppView.instantiateFromStoryboard()
    let interactor: IntercorpAppInteractorProtocol = IntercorpAppInteractor()
    let router: IntercorpAppRouterProtocol = IntercorpAppRouter()
    let presenter: IntercorpAppPresenterProtocol = IntercorpAppPresenter()
    let navigationController = UINavigationController(rootViewController: view)
    window?.rootViewController = navigationController
    view.presenter = presenter
    presenter.view = view
    presenter.router = router
    presenter.interactor = interactor
    interactor.presenter = presenter
  }
}
