//
//  SignUpViewController.swift
//  Feed
//
//  Created by Rayana Prata Neves on 30/09/21.
//

import UIKit

class SignUpViewController: UIViewController {

    // MARK: Properties
    
    // MARK: Outlets
    @IBOutlet weak var textFieldName: CustomTextField!
    @IBOutlet weak var textFieldEmail: CustomTextField!
    @IBOutlet weak var textFieldPassword: CustomTextField!
    @IBOutlet weak var textFieldConfirmPassword: CustomTextField!
    
    // MARK: Initialization
    init() {
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: Overrides
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
    }
    
    // MARK: Actions
    @IBAction func handlerButtonRegister(_ sender: Any) {
        
        guard let email = textFieldEmail.text, let password = textFieldPassword.text, let name = textFieldName.text, let confirmPassword = textFieldConfirmPassword.text else { return }
        
        if name.count < 2 {
            print("digite um nome válido")
            return
        }
        
        if !email.contains("@") {
            print("email incorreto")
            return
        }
        
        if password != confirmPassword {
            print("a senha n é igual")
            return
        }
        
        FirebaseAuthManager.createAccount(name: name, email: email, password: password)
        
    }
    
    // MARK: Methods
    private func setupUI() {
        title = "Cadastrar"
        let tap = UITapGestureRecognizer(target: self, action: #selector(handleClick))
        view.addGestureRecognizer(tap)
    }
    
    @objc func handleClick() {
        textFieldName.resignFirstResponder()
        textFieldEmail.resignFirstResponder()
        textFieldPassword.resignFirstResponder()
        textFieldConfirmPassword.resignFirstResponder()
    }
}
