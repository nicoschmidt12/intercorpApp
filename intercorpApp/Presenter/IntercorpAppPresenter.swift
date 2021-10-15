//
//  IntercorpAppPresenter.swift
//  intercorpApp
//
//  Created by Nicolas schmidt on 15/10/2021.
//

import Foundation

class IntercorpAppPresenter: IntercorpAppPresenterProtocol {
  
  // MARK: - Protocol properties
  
  var view: IntercorpAppViewProtocol?
  var interactor: IntercorpAppInteractorProtocol?
  var router: IntercorpAppRouterProtocol?
}
