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
  
  @IBOutlet weak var nameTextField: UITextField!
  @IBOutlet weak var surnameTextField: UITextField!
  @IBOutlet weak var ageTextField: UITextField!
  @IBOutlet weak var birthdayTextField: UITextField!
  @IBOutlet weak var createUserButton: UIButton!
  @IBOutlet weak var logoutButton: UIButton!
  
  // MARK: - Protocol properties
  
  var presenter: FormPresenterProtocol?
  
  // MARK: - Private properties
  
  let constants: FormConstants = FormConstants()
  let dateFormatter: DateFormatter = DateFormatter()
  
  // MARK: - Life Cycle
  
  override func viewDidLoad() {
    super.viewDidLoad()
    setupNavigationBar()
    setupButtons()
    presenter?.fetchUserEmail()
  }
  
  // MARK: - Private funtions
  
  private func setupButtons() {
    // user button
    createUserButton.layer.cornerRadius = CGFloat(constants.buttonsCornerRadius)
    createUserButton.backgroundColor = .systemBlue
    createUserButton.tintColor = .white
    createUserButton.setTitle(constants.createUserButtonTitle, for: .normal)
    
    // logout button
    logoutButton.layer.cornerRadius = CGFloat(constants.buttonsCornerRadius)
    logoutButton.backgroundColor = .red
    logoutButton.tintColor = .white
    logoutButton.setTitle(constants.logoutButtonTitle, for: .normal)
  }
  
  private func setupNavigationBar() {
    title = constants.navigationTitle
    navigationItem.setHidesBackButton(true, animated: false)
  }
  
  // MARK: - Buttons Actions
  
  @IBAction func createUserButtonTap(_ sender: Any) {
    //dateFormatter.dateFormat = constants.dateFormat
    //let birthday = dateFormatter.date(from: birthdayTextField.text ?? "")
    let user: User = User.init(name: nameTextField.text ?? "", surname: surnameTextField.text ?? "", age: ageTextField.text ?? "", birthday: birthdayTextField.text ?? "")
    presenter?.sendUserData(userData: user)
  }
  
  @IBAction func logoutButtonTap(_ sender: Any) {
    presenter?.facebookLogout()
  }
}
