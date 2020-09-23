//
//  PostListTableViewController.swift
//  RedditMASTER
//
//  Created by Austin Goetz on 9/22/20.
//

import UIKit

class PostListTableViewController: UITableViewController {
    
    // MARK: - Properties
    var posts: [Post] = []

    override func viewDidLoad() {
        super.viewDidLoad()

        fetchPosts()
    }
    
    func fetchPosts() {
        PostController.fetchPosts { (result) in
            switch result {
            case .success(let posts):
                self.posts = posts
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }

    // MARK: - Table view data source
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.posts.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "postCell", for: indexPath) as? PostTableViewCell else { return UITableViewCell() }

        let post = posts[indexPath.row]
        cell.post = post

        return cell
    }
}
