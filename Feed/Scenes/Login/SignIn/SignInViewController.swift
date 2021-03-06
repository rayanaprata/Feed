//
//  SignInViewController.swift
//  Feed
//
//  Created by Rayana Prata Neves on 30/09/21.
//

import UIKit

class SignInViewController: UIViewController {

    
    // MARK: Properties
    
    // MARK: Outlets
    @IBOutlet weak var textFieldEmail: CustomTextField!
    @IBOutlet weak var textFieldPassword: CustomTextField!
    
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
    @IBAction func handlerButtonCreateAccount(_ sender: Any) {
        let viewController = SignUpViewController()
        navigationController?.pushViewController(viewController, animated: true)
    }
    
    @IBAction func handlerButtonEntry(_ sender: Any) {
        
        guard let email = textFieldEmail.text,
              let password = textFieldPassword.text
        else {return}
        
        FirebaseAuthManager.signIn(email: email, password: password) { error in
            if error != nil {
                print("Error: \(error?.localizedDescription)")
                self.alert()
            }
            else {
                // TODO: Navegar para o Feed
                let viewController = TabBarViewController()
                UIApplication.shared.windows.first?.rootViewController = viewController
            }
        }
    }
    
    // MARK: Methods
    private func setupUI() {
        title = "Login"
        self.navigationItem.backBarButtonItem = UIBarButtonItem(title:"", style:.plain, target:nil, action:nil)
        navigationController?.navigationBar.barTintColor = UIColor(red: 0.96, green: 0.80, blue: 0.27, alpha: 1.00)
        navigationController?.navigationBar.tintColor = .black
        navigationController?.navigationBar.titleTextAttributes = [.foregroundColor: UIColor.black]
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(handleClick))
        view.addGestureRecognizer(tap)
    }
    
    @objc func handleClick() {
        textFieldEmail.resignFirstResponder()
        textFieldPassword.resignFirstResponder()
    }
    
    func alert() {
        let alert = UIAlertController(title: "Erro", message: "Preencha os dados corretamente", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Tentar novamente", style: .cancel))
        present(alert, animated: true)
    }
    

}
