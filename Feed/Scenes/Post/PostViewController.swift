//
//  PostViewController.swift
//  Feed
//
//  Created by Claudio Noberto  on 02/10/21.
//

import UIKit

class PostViewController: UIViewController {

    // MARK: Properties
    
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
}
