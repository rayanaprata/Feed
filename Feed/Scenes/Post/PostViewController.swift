//
//  PostViewController.swift
//  Feed
//
//  Created by Claudio Noberto  on 02/10/21.
//

import UIKit
import FirebaseFirestore

class PostViewController: UIViewController {

    // MARK: Properties
    var send = false
    let toolBar = UIToolbar()
    
    // MARK: Outlets
    @IBOutlet var labelName: UILabel!
    @IBOutlet var textViewPost: UITextView!
    
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
        toolBarUI()
    }
    
    // MARK: Actions
    
    // MARK: Methods
    private func setupUI() {
        textViewPost.delegate = self
        textViewPost.text = "Adicione o texto da sua postagem"
        textViewPost.textColor = UIColor.lightGray
        textViewDidBeginEditing(textViewPost)
        textViewDidEndEditing(textViewPost)
        labelName.text = UserSession.shared.name
    }
    
    private func toolBarUI() {
        toolBar.sizeToFit()
        let publish = UIBarButtonItem(title: "Publicar", style: .done, target: self, action: #selector(publishAction))
        let space = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        toolBar.barTintColor = UIColor(red: 0.83, green: 0.83, blue: 0.83, alpha: 1.00)
        publish.tintColor = UIColor.black
        toolBar.setItems([space,publish,space], animated: true)
        textViewPost.inputAccessoryView = toolBar
    }
    
    @objc func publishAction() {
        textViewPost.resignFirstResponder()

        if send {
            let message = textViewPost.text
            let db = Firestore.firestore()
            
            db.collection("posts").addDocument(data: [
                "message": message,
                "name": UserSession.shared.name
            ]) { error in
                if error != nil {
                    print("deu erro")
                } else {
                    self.textViewPost.text = ""
                    self.toolBar.barTintColor = UIColor(red: 0.83, green: 0.83, blue: 0.83, alpha: 1.00)
                    self.send = false
                    
                }
            }
            print("mandou, em!")
        }
    }

}

extension PostViewController: UITextViewDelegate {
    
    func textViewDidBeginEditing(_ textView: UITextView) {
        if textView.textColor == UIColor.lightGray {
            textView.text = nil
            textView.textColor = UIColor.black
        }
    }
    
    func textViewDidEndEditing(_ textView: UITextView) {
        if textView.text.isEmpty {
            textView.text = "Adicione o texto da sua postagem"
            textView.textColor = UIColor.lightGray
        }
    }
    
    func textViewDidChange(_ textView: UITextView) {
        
        if textView.text.count >= 1 {
            toolBar.barTintColor = UIColor(red: 0.98, green: 0.79, blue: 0.01, alpha: 1.00)
            send = true
        } else {
            toolBar.barTintColor = UIColor(red: 0.83, green: 0.83, blue: 0.83, alpha: 1.00)
            send = false
        }
    }
}


