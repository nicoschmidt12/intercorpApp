//
//  IntercorpAppView.swift
//  intercorpApp
//
//  Created by Nicolas schmidt on 15/10/2021.
//

import UIKit

class AuthenticationView: UIViewController, AuthenticationViewProtocol {
  
  // MARK: - Outlets
  
  @IBOutlet weak var facebookButton: UIButton!
  
  // MARK: - Protocol properties
  
  var presenter: AuthenticationPresenterProtocol?
  
  // MARK: - Private properties
  
  let constants: AuthenticationConstants = AuthenticationConstants()
  
  // MARK: - Life Cycle
  
  override func viewDidLoad() {
    super.viewDidLoad()
    setupFacebookButton()
  }
  
  // MARK: - Private funtions
  
  private func setupFacebookButton() {
    facebookButton.layer.cornerRadius = CGFloat(constants.facebookButtonCornerRadius)
    facebookButton.setTitle(constants.facebookButtonText, for: .normal)
  }
  
  @IBAction func facebookButtonTaped(_ sender: Any) {
    presenter?.loginWithFacebook(viewController: self)
  }
}
