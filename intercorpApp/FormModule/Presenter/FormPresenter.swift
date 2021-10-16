//
//  FormPresenter.swift
//  intercorpApp
//
//  Created by Nicolas schmidt on 16/10/2021.
//

import Foundation

class FormPresenter: FormPresenterProtocol {
  
  // MARK: - Protocol properties
  
  weak var view: FormViewProtocol?
  var interactor: FormInteractorProtocol?
  var router: FormRouterProtocol?
}
