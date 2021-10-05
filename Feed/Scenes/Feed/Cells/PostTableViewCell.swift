//
//  PostTableViewCell.swift
//  Feed
//
//  Created by Rayana Prata Neves on 04/10/21.
//

import UIKit

class PostTableViewCell: UITableViewCell {


    @IBOutlet weak var labelName: UILabel!
    @IBOutlet weak var labelTextPost: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()

    }

    func setup (_ post: PostModel) {
        labelName.text = post.name
        labelTextPost.text = post.message
    }
    
}
