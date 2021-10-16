//
//  FormView.swift
//  intercorpApp
//
//  Created by Nicolas schmidt on 16/10/2021.
//

import Foundation
import UIKit

class FormView: UIViewController, FormViewProtocol {
  
  // MARK: - Outlets
  
  // MARK: - Protocol properties
  
  var presenter: FormPresenterProtocol?
  
  // MARK: - Private properties
  
  let constants: FormConstants = FormConstants()
  
  // MARK: - Life Cycle
  
  override func viewDidLoad() {
    super.viewDidLoad()
    title = constants.screenTitle
  }
  
  // MARK: - Private funtions
}
