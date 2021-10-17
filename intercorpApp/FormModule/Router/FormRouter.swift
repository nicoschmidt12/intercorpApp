//
//  FormRouter.swift
//  intercorpApp
//
//  Created by Nicolas schmidt on 16/10/2021.
//

import Foundation
import UIKit

class FormRouter: FormRouterProtocol {
  func presentFormModule(from viewController: AnyObject?) {
    guard let viewController: UIViewController = viewController as? UIViewController else { return }
    let view: FormView = FormView.instantiateFromStoryboard()
    let interactor: FormInteractorProtocol = FormInteractor()
    let router: FormRouterProtocol = FormRouter()
    let presenter: FormPresenterProtocol = FormPresenter()
    let dataManager: FormAPIDataManagerProtocol = FormAPIDataManager()
    
    view.presenter = presenter
    presenter.view = view
    presenter.router = router
    presenter.interactor = interactor
    interactor.presenter = presenter
    interactor.dataManager = dataManager
    dataManager.interactor = interactor
    
    viewController.navigationController?.pushViewController(view, animated: true)
  }
  
  func dismiss(controller: AnyObject?) {
    guard let viewController: UIViewController = controller as? UIViewController else { return }
    viewController.navigationController?.popViewController(animated: true)
  }
}
