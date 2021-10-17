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
  let datePicker: UIDatePicker = UIDatePicker()
  
  // MARK: - Life Cycle
  
  override func viewDidLoad() {
    super.viewDidLoad()
    setupNavigationBar()
    setupButtons()
    createDatePicker()
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
  
  private func createDatePicker() {
    // Toolbar
    let toolbar: UIToolbar = UIToolbar()
    toolbar.sizeToFit()
    // Bar button
    let doneButton: UIBarButtonItem = UIBarButtonItem(barButtonSystemItem: .done, target: nil, action: #selector(doneButtonTap))
    toolbar.setItems([doneButton], animated: true)
    // Assign toolbar
    birthdayTextField.inputAccessoryView = toolbar
    // Assign datePicker to the textField
    birthdayTextField.inputView = datePicker
    // DatePicker mode
    datePicker.datePickerMode = .date
  }
  
  private func clearTextFields() {
    nameTextField.text = ""
    surnameTextField.text = ""
    ageTextField.text = ""
    birthdayTextField.text = ""
  }
  
  // MARK: - Funtions
  
  func showPopupConfirmation() {
    let alertController = UIAlertController(title: constants.popupTitle, message: constants.popupMessage, preferredStyle: .alert)
    alertController.addAction(UIAlertAction(title: constants.popupButtonText, style: .default))
    self.present(alertController, animated: true, completion: nil)
    clearTextFields()
  }
  
  // MARK: - Buttons Actions
  
  @IBAction func createUserButtonTap(_ sender: Any) {
    let user: User = User.init(name: nameTextField.text ?? "", surname: surnameTextField.text ?? "", age: ageTextField.text ?? "", birthday: birthdayTextField.text ?? "")
    presenter?.sendUserData(userData: user)
  }
  
  @IBAction func logoutButtonTap(_ sender: Any) {
    presenter?.facebookLogout()
  }
  
  @objc func doneButtonTap() {
    let formatter: DateFormatter = DateFormatter()
    formatter.dateStyle = .medium
    formatter.timeStyle = .none
    birthdayTextField.text = formatter.string(from: datePicker.date)
    self.view.endEditing(true)
  }
}
