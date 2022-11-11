//
//  PostsListViewModel.swift
//  2CH-HK-GREEN
//
//  Created by Wheatley on 12.11.2022.
//

import Foundation

class PostsListViewModel {
    private var posts: [String]
    
    init(posts: [String]) {
        self.posts = posts
    }
    
    var postsArray: [String] {
        return posts
    }
    
    var numberOfPosts: Int {
        return posts.count
    }
    
    func postForIndexPath (indexPath: IndexPath) -> String {
        return posts[indexPath.row]
    }
}
