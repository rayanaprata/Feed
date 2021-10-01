//
//  SignUpViewController.swift
//  Feed
//
//  Created by Rayana Prata Neves on 30/09/21.
//

import UIKit
import FirebaseAuth

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
        
        guard let email = textFieldEmail.text, let password = textFieldPassword.text else { return }
        
        Auth.auth().createUser(withEmail: email, password: password) { authResult, error in
            
            
            
        }
    }
    
    // MARK: Methods
    private func setupUI() {
        title="Cadastrar"
    }
}
