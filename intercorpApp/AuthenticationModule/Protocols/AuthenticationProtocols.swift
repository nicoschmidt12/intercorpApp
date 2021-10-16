//
//  IntercorpAppProtocols.swift
//  intercorpApp
//
//  Created by Nicolas schmidt on 15/10/2021.
//

import Foundation
import UIKit

protocol AuthenticationViewProtocol: AnyObject {
  var presenter: AuthenticationPresenterProtocol? { get set }
}

protocol AuthenticationRouterProtocol: AnyObject {
  func presentAuthenticationModule(from window: UIWindow?)
}

protocol AuthenticationPresenterProtocol: AnyObject {
  var view: AuthenticationViewProtocol? { get set }
  var interactor: AuthenticationInteractorProtocol? { get set }
  var router: AuthenticationRouterProtocol? { get set }
  
  func loginWithFacebook(viewController: UIViewController)
}

protocol AuthenticationInteractorProtocol: AnyObject {
  var presenter: AuthenticationPresenterProtocol? { get set }
  
  func loginWithFacebook(viewController: UIViewController)
}
