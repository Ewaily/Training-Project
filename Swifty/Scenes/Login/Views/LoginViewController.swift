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
    
    var loginViewModel: LoginViewModel?
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var logInButton: UIButton!
    @IBOutlet weak var usernameTextField: TweeActiveTextField!
    @IBOutlet weak var passwordTextField: TweeActiveTextField!
    
    @IBAction func pressLogin(_ sender: Any) {
        
        let email = usernameTextField.text
        let password = passwordTextField.text
        let locale = "EN"
        
        if email!.isEmpty || password!.isEmpty {
            showAlert(message: "Complete the requird fields", title: "Empty fields")
            return
        }
        
        let signInParameters = ["email": email, "password": password, "locale": locale] as! [String: String]
        
        Login.login(para: signInParameters) { (_: Error?, success: Bool, user: UserModel) in
            if success {
                self.loginViewModel = LoginViewModel(userModel: user)
               // self.showAlert(message: "Welcome \((self.loginViewModel?.userName)!)", title: "Login Success")
                self.performSegue(withIdentifier: "TabBar", sender: self)
            }
            else {
                self.showAlert(message: "Invalied email or password", title: "Wrong credentials!")
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
