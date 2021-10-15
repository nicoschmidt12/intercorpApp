//
//  IntercorpAppRouter.swift
//  intercorpApp
//
//  Created by Nicolas schmidt on 15/10/2021.
//

import Foundation
import UIKit

class IntercorpAppRouter: IntercorpAppRouterProtocol {
  class func createIntercorpAppModule() -> UIViewController {
    let view = IntercorpAppView()
    let presenter: IntercorpAppPresenterProtocol = IntercorpAppPresenter()
    let interactor: IntercorpAppInteractorProtocol = IntercorpAppInteractor()
    let router: IntercorpAppRouterProtocol = IntercorpAppRouter()
    
    view.presenter = presenter
    presenter.view = view
    presenter.router = router
    presenter.interactor = interactor
    interactor.presenter = presenter
    
    return view
  }
}
