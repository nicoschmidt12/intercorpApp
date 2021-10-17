//
//  FormProtocols.swift
//  intercorpApp
//
//  Created by Nicolas schmidt on 16/10/2021.
//

import Foundation
import UIKit
protocol FormViewProtocol: AnyObject {
  var presenter: FormPresenterProtocol? { get set }
}

protocol FormRouterProtocol: AnyObject {
  func presentFormModule(from viewController: AnyObject?)
  func dismiss(controller: AnyObject?)
}

protocol FormPresenterProtocol: AnyObject {
  var view: FormViewProtocol? { get set }
  var interactor: FormInteractorProtocol? { get set }
  var router: FormRouterProtocol? { get set }
  
  func sendUserData(userData: User?)
  func facebookLogout()
  func dismissFormModule()
  func fetchUserEmail()
}

protocol FormInteractorProtocol: AnyObject {
  var presenter: FormPresenterProtocol? { get set }
  var dataManager: FormDataManagerProtocol? { get set }
  
  func getUserData(userData: User)
  func facebookLogout()
  func setupUserDefaults(with id: String)
  func fetchUserEmail()
}

protocol FormDataManagerProtocol: AnyObject {
  var interactor: FormInteractorProtocol? { get set }
  
  func getUserEmail()
}
