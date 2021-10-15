//
//  ViewController.swift
//  intercorpApp
//
//  Created by Nicolas schmidt on 15/10/2021.
//

import UIKit

class IntercorpAppView: UIViewController, IntercorpAppViewProtocol {
  
  // MARK: - Protocol properties
  
  var presenter: IntercorpAppPresenterProtocol?
  
  // MARK: - Life Cycle
  
  override func viewDidLoad() {
    super.viewDidLoad()
  }
}
