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
        
        guard let email = textFieldEmail.text,
                let password = textFieldPassword.text,
                let name = textFieldName.text,
                let confirmPassword = textFieldConfirmPassword.text
        else { return }
        
        if validateFields(name: name, email: email, password: password, confirmPassword: confirmPassword) {
            FirebaseAuthManager.createAccount(name: name, email: email, password: password) { error in
                if error != nil {
                    //print("Error: \(error?.localizedDescription)")
                }
                else {
                    // TODO: Navegar para o Feed
                    let viewController = TabBarViewController()
                    UIApplication.shared.windows.first?.rootViewController = viewController
                }
            }
        }
    }
    
    // MARK: Methods
    private func validateFields(name: String, email: String, password: String, confirmPassword: String) -> Bool {
        
        var isOk = true
        var message = ""
        
        if password.count < 6 {
            message = "Senha muito curta"
            isOk = false
        }
        
        if !email.contains("@") {
            message = "Insira um e-mail válido"
            isOk = false
        }
        
        if name.count < 2 {
            message = "Insira um nome válido"
            isOk = false
        }
        
        if password.count >= 6 {
            if password != confirmPassword {
                message = "Senhas diferentes"
                isOk = false
            }
        }
        
        if !isOk {
            handleAlert(message)
        }
        
        return isOk
    }
    
    func handleAlert(_ message: String) {
        let alert = UIAlertController(title: "Erro", message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .cancel))
        present(alert, animated: true)
    }
    
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
