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
    checkUserDefaults()
    setupFacebookButton()
  }
  
  // MARK: - Private Funtions
  
  private func setupFacebookButton() {
    facebookButton.layer.cornerRadius = CGFloat(constants.facebookButtonCornerRadius)
    facebookButton.setTitle(constants.facebookButtonText, for: .normal)
  }
  
  private func checkUserDefaults() {
    let defaults = UserDefaults.standard
    if let _ = defaults.value(forKey: constants.userDefaultAuth) as? String {
      presenter?.router?.goToFormModule(from: self)
    }
  }
  
  // MARK: - Funtions
  
  func showPopup() {
    let alertController = UIAlertController(title: constants.popupTitle, message: constants.popupMessage, preferredStyle: .alert)
    alertController.addAction(UIAlertAction(title: constants.popupButtonText, style: .default))
    self.present(alertController, animated: true, completion: nil)
  }
  
  // MARK: - Button Action
  
  @IBAction func facebookButtonTaped(_ sender: Any) {
    presenter?.loginWithFacebook(viewController: self)
  }
}
