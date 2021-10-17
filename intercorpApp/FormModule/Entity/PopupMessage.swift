//
//  PopupMessage.swift
//  intercorpApp
//
//  Created by Nicolas schmidt on 17/10/2021.
//

import Foundation
import UIKit

class PopupMessage {
  
  // MARK: - Enum
  
  enum popupType {
    case confirmation
    case missingField
  }
  
  // MARK: - Private Properties
  
  private let constants: FormConstants = FormConstants()
  
  // MARK: - Functions
  
  func callPopup(popupType: popupType, view: UIViewController) {
    switch popupType {
    case .confirmation:
      showPopup(
        view: view,
        title: constants.popupConfirmationTitle,
        message: constants.popupConfirmationMessage,
        buttonText: constants.popupButtonText)
    case .missingField:
      showPopup(
        view: view,
        title: constants.popupMissingFieldTitle,
        message: constants.popupMissingFieldMessage,
        buttonText: constants.popupButtonText)
    }
  }
  
  // MARK: - Private Functions
  private func showPopup(view: UIViewController, title: String, message: String, buttonText: String) {
    let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
    alertController.addAction(UIAlertAction(title: buttonText, style: .default))
    view.present(alertController, animated: true, completion: nil)
  }
}
