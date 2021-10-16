//
//  IntercorpAppProtocols.swift
//  intercorpApp
//
//  Created by Nicolas schmidt on 15/10/2021.
//

import Foundation
import UIKit

protocol IntercorpAppViewProtocol: AnyObject {
  var presenter: IntercorpAppPresenterProtocol? { get set }
}

protocol IntercorpAppRouterProtocol: AnyObject {
  func presentIntercorpAppModule(from window: UIWindow?)
}

protocol IntercorpAppPresenterProtocol: AnyObject {
  var view: IntercorpAppViewProtocol? { get set }
  var interactor: IntercorpAppInteractorProtocol? { get set }
  var router: IntercorpAppRouterProtocol? { get set }
  
  func loginWithFacebook(viewController: UIViewController)
}

protocol IntercorpAppInteractorProtocol: AnyObject {
  var presenter: IntercorpAppPresenterProtocol? { get set }
  
  func loginWithFacebook(viewController: UIViewController)
}
