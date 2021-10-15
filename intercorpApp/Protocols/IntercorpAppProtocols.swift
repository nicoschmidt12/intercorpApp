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
  static func createIntercorpAppModule() -> UIViewController
}

protocol IntercorpAppPresenterProtocol: AnyObject {
  var view: IntercorpAppViewProtocol? { get set }
  var interactor: IntercorpAppInteractorProtocol? { get set }
  var router: IntercorpAppRouterProtocol? { get set }
}

protocol IntercorpAppInteractorProtocol: AnyObject {
  var presenter: IntercorpAppPresenterProtocol? { get set }
}
