//
//  FeedViewController.swift
//  Feed
//
//  Created by Claudio Noberto  on 02/10/21.
//

import UIKit
import FirebaseFirestore

class FeedViewController: UIViewController {

    // MARK: Properties
    var posts: [PostModel] = []
    
    // MARK: Outlets
    @IBOutlet weak var tableViewFeed: UITableView!
    
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
        fetchPosts()
    }
    
    // MARK: Actions
    
    // MARK: Methods
    private func setupUI() {
        
        tableViewFeed.register(UINib(nibName: "PostTableViewCell", bundle: nil), forCellReuseIdentifier: "PostTableViewCell")
        tableViewFeed.dataSource = self
        tableViewFeed.delegate = self
        tableViewFeed.reloadData()
    }
    
    func fetchPosts() {
        
        posts = []
        
        let db = Firestore.firestore()
        db.collection("posts").getDocuments { query, error in
            if error != nil {
                print("deu erro ao recuperar os posts")
            }
            else {
                let documents = query?.documents ?? []
                for document in documents {
                    let dict = document.data()
                    let newPost = PostModel(name: dict["name"] as? String,
                                            message: dict["message"] as? String)
                    self.posts.append(newPost)
                }
                self.tableViewFeed.reloadData()
            }
        }
    }

}

extension FeedViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return posts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
                
        let post = posts[indexPath.row]
        
        if let cell = tableViewFeed.dequeueReusableCell(withIdentifier: "PostTableViewCell") as? PostTableViewCell {
            cell.setup(post)
            return cell
        }
        
        return UITableViewCell()
    }
    
}
