//
//  SignInViewController.swift
//  Feed
//
//  Created by Rayana Prata Neves on 30/09/21.
//

import UIKit
import FirebaseAuth

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
        
        //Auth.auth().signIn(withEmail: String, password: <#T##String#>, completion: <#T##((AuthDataResult?, Error?) -> Void)?##((AuthDataResult?, Error?) -> Void)?##(AuthDataResult?, Error?) -> Void#>)
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

}
