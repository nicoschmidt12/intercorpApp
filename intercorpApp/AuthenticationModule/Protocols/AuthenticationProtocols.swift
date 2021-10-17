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
  
  func showPopup()
  func goToFormModule()
}

protocol AuthenticationRouterProtocol: AnyObject {
  func presentAuthenticationModule(from window: UIWindow?)
  func goToFormModule(from viewController: AnyObject?)
}

protocol AuthenticationPresenterProtocol: AnyObject {
  var view: AuthenticationViewProtocol? { get set }
  var interactor: AuthenticationInteractorProtocol? { get set }
  var router: AuthenticationRouterProtocol? { get set }
  
  func loginWithFacebook(viewController: UIViewController)
  func goToFormModule()
  func callToPopup()
}

protocol AuthenticationInteractorProtocol: AnyObject {
  var presenter: AuthenticationPresenterProtocol? { get set }
  
  func loginWithFacebook(viewController: UIViewController)
}
