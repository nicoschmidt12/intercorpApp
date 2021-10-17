//
//  IntercorpAppView.swift
//  intercorpApp
//
//  Created by Nicolas schmidt on 15/10/2021.
//

import TransitionButton
import UIKit

class AuthenticationView: UIViewController, AuthenticationViewProtocol {
  
  // MARK: - Outlets
  
  ///Cannot use 'constants' because property initializers run before 'self' is available
  let facebookButton = TransitionButton(frame: CGRect(x: 0, y: 0, width: 250, height: 48))
  
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
    facebookButton.center = view.center
    facebookButton.backgroundColor = UIColor(
      red: constants.rgbRed,
      green: constants.rgbGreen,
      blue: constants.rgbBlue)
    facebookButton.setTitle(constants.facebookButtonText, for: .normal)
    facebookButton.layer.cornerRadius = CGFloat(constants.facebookButtonCornerRadius)
    facebookButton.addTarget(self, action: #selector(didTapFacebookButton), for: .touchUpInside)
    facebookButton.spinnerColor = .white
    view.addSubview(facebookButton)
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
  
  func goToFormModule() {
    DispatchQueue.main.async {
      self.facebookButton.stopAnimation(animationStyle: .expand, revertAfterDelay: 1) {
        DispatchQueue.main.async {
          self.presenter?.router?.goToFormModule(from: self)
        }
      }
    }
  }
  
  // MARK: - Button Action
  
  @objc func didTapFacebookButton() {
    facebookButton.startAnimation()
    presenter?.loginWithFacebook(viewController: self)
  }
}
