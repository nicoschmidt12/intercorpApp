//
//  FormDataManager.swift
//  intercorpApp
//
//  Created by Nicolas schmidt on 16/10/2021.
//

import Foundation
import FBSDKCoreKit
import FBSDKLoginKit

class FormDataManager: FormDataManagerProtocol {
  
  // MARK: - Protocol properties
  
  weak var interactor: FormInteractorProtocol?
  
  // MARK: - Private properties
  
  let constants: FormConstants = FormConstants()
  
  // MARK: - Function
  
  func getUserEmail() {
    GraphRequest(graphPath: constants.graphPath, parameters: [constants.fields: constants.userDefaultId]).start(completion: { (connection, result, error) -> Void in
      if (error == nil) {
        if let data: NSDictionary = result as? NSDictionary
        {
          guard let userId: String = data.object(forKey: self.constants.userDefaultId) as? String else { return }
          self.interactor?.setupUserDefaults(with: userId)
        }
      }
    })
  }
}
