//
//  ViewController.swift
//  Swifty
//
//  Created by Muhammad Ewaily on 11/5/19.
//  Copyright © 2019 Muhammad Ewaily. All rights reserved.
//

import UIKit
import TweeTextField

class LoginViewController: UIViewController{
    
    var loginViewModel = LoginViewModel()
    
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var logInButton: UIButton!
    @IBOutlet weak var usernameTextField: TweeActiveTextField!
    @IBOutlet weak var passwordTextField: TweeActiveTextField!
    
    @IBAction func pressLogin(_ sender: Any) {
                
//        guard let email = usernameTextField.text, !email.isEmpty else {return}
//        guard let password = passwordTextField.text, !password.isEmpty else {return}
//        loginViewModel.sendRequest(email: email, password: password) {
//                (error:Error?, userModel:UserModel?) in
//
//                    if userModel != nil  {
//                        self.navigateToTabBar(user: userModel!)
//                            }
//                    else {
//                        let alert = UIAlertController(title: "Login Failed", message: "Please Try Again", preferredStyle: .alert)
//                        let action = UIAlertAction(title: "Try Again", style: .default, handler: nil)
//                        alert.addAction(action)
//                        self.present(alert, animated: true ,completion: nil)
//                }
//                    }
        temp()
    }
    
    func temp() {

        loginViewModel.sendRequest(email: "m@s34.com", password: "12345678") {
                (error:Error?, userModel:UserModel?) in
                    
                    if userModel != nil  {
                        self.navigateToTabBar(user: userModel!)
                            }
                    else {
                        let alert = UIAlertController(title: "Login Failed", message: "Please Try Again", preferredStyle: .alert)
                        let action = UIAlertAction(title: "Try Again", style: .default, handler: nil)
                        alert.addAction(action)
                        self.present(alert, animated: true ,completion: nil)
                }
                    }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateButtonUI()
        setupKeyboardDismissRecognizer()
        setupNotificationCenter()
    }
    
    func updateButtonUI() {
        logInButton.layer.cornerRadius = 26
    }
    
    func setupNotificationCenter() {
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name:UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name:UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    func setupKeyboardDismissRecognizer(){
            let tapRecognizer: UITapGestureRecognizer = UITapGestureRecognizer(
                target: self,
                action: #selector(LoginViewController.dismissKeyboard))
            
            self.view.addGestureRecognizer(tapRecognizer)
    }
        
    @objc func dismissKeyboard()
    {
       view.endEditing(true)
    }
    
    @objc func keyboardWillShow(notification:NSNotification){

        let userInfo = notification.userInfo!
        var keyboardFrame:CGRect = (userInfo[UIResponder.keyboardFrameBeginUserInfoKey] as! NSValue).cgRectValue
        keyboardFrame = self.view.convert(keyboardFrame, from: nil)

        var contentInset:UIEdgeInsets = self.scrollView.contentInset
        contentInset.bottom = keyboardFrame.size.height
        scrollView.contentInset = contentInset
    }

   @objc func keyboardWillHide(notification:NSNotification){

        let contentInset:UIEdgeInsets = UIEdgeInsets.zero
        scrollView.contentInset = contentInset
    }
    
    func navigateToTabBar(user: UserModel) {
        
        if let viewController = UIStoryboard(name: "TabBar", bundle: nil).instantiateViewController(withIdentifier: "TabBar") as? TabBar {
            viewController.currentUser = user
            if let navigator = self.navigationController {
                navigator.pushViewController(viewController, animated: true)
            }
        }
    }
}


extension LoginViewController: UITextFieldDelegate{
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == usernameTextField {
            passwordTextField.becomeFirstResponder()
        }
        else {
            passwordTextField.resignFirstResponder()
            pressLogin(self)
        }
        return true
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        scrollView.setContentOffset(CGPoint(x: 0, y: (textField.superview?.frame.origin.y)!), animated: true)
    }
}
