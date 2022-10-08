//
//  LoginViewController.swift
//  Movie4U
//
//  Created by Harish Anantharaman on 14/03/22.
//

import UIKit
import SkyFloatingLabelTextField

protocol LoginViewControllerDelegate: AnyObject {
    func onLogin()
    func onSignUp()
}

class LoginViewController: UIViewController {
    
    weak var parentingCoordinator: LoginViewControllerDelegate?
    
    let loginLabel: UILabel = {
       let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Login"
        label.textColor = .black
        return label
    }()
    
    let loginSubtitle: UILabel = {
       let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Please sign in to continue"
        label.textColor = .black
        return label
    }()
    
    let emailTextField: SkyFloatingLabelTextField = {
        let textField = SkyFloatingLabelTextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.placeholder = "Email"
        textField.title = "Email"
        textField.titleColor = .blue
        textField.tintColor = .blue
        textField.selectedTitleColor = .blue
        textField.selectedLineColor = .blue
        return textField
    }()
    
    let passwordTextField: SkyFloatingLabelTextField = {
        let textField = SkyFloatingLabelTextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.isSecureTextEntry = true
        textField.placeholder = "Password"
        textField.title = "Password"
        textField.titleColor = .blue
        textField.tintColor = .blue
        textField.selectedTitleColor = .blue
        textField.selectedLineColor = .blue
        return textField
    }()
    
    let loginButton: UIButton = {
        let button = UIButton(type: .roundedRect)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Login", for: .normal)
        button.addTarget(self, action: #selector(handleLogin), for: .touchUpInside)
        return button
    }()
    
    let signupDisclaimerLabel: UILabel = {
       let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Don't have an account?"
        return label
    }()
    
    let signUpButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Signup", for: .normal)
        button.addTarget(self, action: #selector(handleSignUp), for: .touchUpInside)
        return button
    }()
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupLoginView()
    }
    
    func setupLoginView() {
        view.addSubview(loginLabel)
        
        NSLayoutConstraint.activate([
            loginLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 100),
            loginLabel.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20)
        ])
        
        view.addSubview(loginSubtitle)
        NSLayoutConstraint.activate([
            loginSubtitle.topAnchor.constraint(equalTo: loginLabel.bottomAnchor, constant: 30),
            loginSubtitle.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20),
            loginSubtitle.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -20)
        ])
        
        view.addSubview(emailTextField)
        NSLayoutConstraint.activate([
            emailTextField.topAnchor.constraint(equalTo: loginSubtitle.bottomAnchor, constant: 50),
            emailTextField.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20),
            emailTextField.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -20)
        ])
        
        view.addSubview(passwordTextField)
        NSLayoutConstraint.activate([
            passwordTextField.topAnchor.constraint(equalTo: emailTextField.bottomAnchor, constant: 30),
            passwordTextField.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20),
            passwordTextField.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -20)
        ])
        
        setupLoginButton()
        setupSignUpButton()
    }
    
    func setupLoginButton() {
        view.addSubview(loginButton)
        NSLayoutConstraint.activate([
            loginButton.widthAnchor.constraint(equalToConstant: 100),
            loginButton.heightAnchor.constraint(equalToConstant: 50),
            loginButton.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: 50),
            loginButton.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
    }
    
    func setupSignUpButton() {
        view.addSubview(signupDisclaimerLabel)
        NSLayoutConstraint.activate([
            signupDisclaimerLabel.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -40),
            signupDisclaimerLabel.leftAnchor.constraint(greaterThanOrEqualTo: view.leftAnchor, constant: 20),
            signupDisclaimerLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
        
        view.addSubview(signUpButton)
        
        NSLayoutConstraint.activate([
            signUpButton.leftAnchor.constraint(equalTo: signupDisclaimerLabel.rightAnchor, constant: 5),
            signUpButton.rightAnchor.constraint(greaterThanOrEqualTo: view.rightAnchor, constant: -30),
            signUpButton.bottomAnchor.constraint(equalTo: signupDisclaimerLabel.bottomAnchor)
        ])
    }
    
    @objc func handleLogin() {
        parentingCoordinator?.onLogin()
    }
    
    @objc func handleSignUp() {
        parentingCoordinator?.onSignUp()
    }
}
