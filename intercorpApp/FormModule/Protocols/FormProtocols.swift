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
}

protocol FormPresenterProtocol: AnyObject {
  var view: FormViewProtocol? { get set }
  var interactor: FormInteractorProtocol? { get set }
  var router: FormRouterProtocol? { get set }
}

protocol FormInteractorProtocol: AnyObject {
  var presenter: FormPresenterProtocol? { get set }
}
