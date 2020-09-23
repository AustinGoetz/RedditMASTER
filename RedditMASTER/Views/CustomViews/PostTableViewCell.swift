//
//  PostTableViewCell.swift
//  RedditMASTER
//
//  Created by Austin Goetz on 9/22/20.
//

import UIKit

// MARK: - Protocol
// Don't do this until you have done the alert controller
protocol PresentErrorToUserDelegate: AnyObject {
    func presentError(error: LocalizedError)
}

class PostTableViewCell: UITableViewCell {

    // MARK: - Outlets
    @IBOutlet weak var thumbnailImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var upvoteLabel: UILabel!
    
    // MARK: - Properties
    weak var delegate: PresentErrorToUserDelegate?
    var post: Post? {
        didSet {
            updateViews()
        }
    }
    
    // MARK: - Helper Functions/Methods
    func updateViews() {
        guard let post = post else { return }
        titleLabel.text = post.title
        upvoteLabel.text = "Upvotes: \(post.ups)"
        // We do this because we are going to fetch the image right from this cell. As we scroll it will reset the image and not have the old image showing up
        thumbnailImageView.image = nil
        
        PostController.fetchThumbnailFor(post: post) { (result) in
            DispatchQueue.main.async {
                switch result {
                case .success(let image):
                    DispatchQueue.main.async {
                        self.thumbnailImageView.image = image
                    }
                case .failure(let error):
                    // Just print at first until we define the delegate and
                    self.delegate?.presentError(error: error)
                    print(error.localizedDescription)
                }
            }
        }
    }
}
