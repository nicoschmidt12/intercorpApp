//
//  FormDataManager.swift
//  intercorpApp
//
//  Created by Nicolas schmidt on 16/10/2021.
//

import Foundation
import FBSDKCoreKit
import FBSDKLoginKit

class FormAPIDataManager: FormAPIDataManagerProtocol {
  
  // MARK: - Protocol properties
  
  weak var interactor: FormInteractorProtocol?
  
  // MARK: - Private properties
  
  let constants: FormConstants = FormConstants()
  
  // MARK: - Function
  
  func getUserEmail() {
    GraphRequest(graphPath: constants.graphPath, parameters: [constants.fields: constants.userDefaultEmail]).start(completion: { (connection, result, error) -> Void in
      if (error == nil) {
        if let data: NSDictionary = result as? NSDictionary
        {
          guard let userEmail: String = data.object(forKey: self.constants.userDefaultEmail) as? String else { return }
          self.interactor?.setupUserDefaults(with: userEmail)
        }
      }
    })
  }
}
