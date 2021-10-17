//
//  FormInteractor.swift
//  intercorpApp
//
//  Created by Nicolas schmidt on 16/10/2021.
//

import Foundation
import FBSDKLoginKit
import FirebaseDatabase

class FormInteractor: FormInteractorProtocol {
  
  // MARK: - Protocol properties
  
  weak var presenter: FormPresenterProtocol?
  var dataManager: FormAPIDataManagerProtocol?
  
  // MARK: - Private properties
  
  private let constants: FormConstants = FormConstants()
  private let dataBase: DatabaseReference = Database.database().reference()
  private var userEmail: String?
  
  // MARK: - Functions
  
  func getUserData(userData: User) {
    let values: [String : Any] = [
      constants.userName:userData.name,
      constants.userSurname:userData.surname,
      constants.userAge:userData.age,
      constants.userBirthday:userData.birthday]
    if let emailWithOutDots = userEmail?.replacingOccurrences(
      of: constants.characterToWillBeReplace,
      with: constants.characterToWillBeSet,
      options: NSString.CompareOptions.literal,
      range:nil) {
      dataBase.child(emailWithOutDots).setValue(values)
      presenter?.showPopupConfirmation()
    }
  }
  
  func facebookLogout() {
    // facebook logout
    LoginManager().logOut()
    // reset current user defaults
    let defaults: UserDefaults = UserDefaults.standard
    defaults.removeObject(forKey: constants.userDefaultAuth)
    defaults.synchronize()
    
    presenter?.dismissFormModule()
  }
  
  func fetchUserEmail() {
    dataManager?.getUserEmail()
  }
  
  func setupUserDefaults(with email: String) {
    self.userEmail = email
    let defaults: UserDefaults = UserDefaults.standard
    defaults.set(email, forKey: constants.userDefaultAuth)
    defaults.synchronize()
  }
}
