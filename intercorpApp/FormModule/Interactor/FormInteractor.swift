//
//  FormInteractor.swift
//  intercorpApp
//
//  Created by Nicolas schmidt on 16/10/2021.
//

import Foundation
import FBSDKLoginKit

class FormInteractor: FormInteractorProtocol {
  
  // MARK: - Protocol properties
  
  weak var presenter: FormPresenterProtocol?
  var dataManager: FormDataManagerProtocol?
  
  // MARK: - Private properties
  
  let constants: FormConstants = FormConstants()
  
  // MARK: - Functions
  
  func getUserData(userData: User) {
    print(userData.name)
  }
  
  func facebookLogout() {
    // facebook logout
    LoginManager().logOut()
    // reset current user defaults
    let defaults = UserDefaults.standard
    defaults.removeObject(forKey: constants.userDefaultAuth)
    defaults.synchronize()
    
    presenter?.dismissFormModule()
  }
  
  func fetchUserEmail() {
    dataManager?.getUserEmail()
  }
  
  func setupUserDefaults(with id: String) {
    let defaults = UserDefaults.standard
    defaults.set(id, forKey: constants.userDefaultAuth)
    defaults.synchronize()
  }
}
