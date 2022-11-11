//
//  ThreadList.swift
//  2CH-HK-GREEN
//
//  Created by Wheatley on 03.11.2022.
//

import Foundation
import UIKit


class ThreadListViewModel: ThreadListViewModelProtocol {
    
    private var boardName: String = ""
    
    private var thumbnailUrlArray: [String] = []
    private var postsCount: [String] = []
    private var postNumber = [Int]()
    
    func postNumberFirstInThread(indexPath: IndexPath) -> Int {
        return postNumber[indexPath.row]
    }
    
    func postsCountForIndexPath(indexPath: IndexPath) -> String {
        return "\(postsCount[indexPath.row]) постов в треде"
        
    }
    
    func generatePostsViewModel(url: String, completion: @escaping (PostsListViewModel)->() ) {
        
        Networking().getData(url: url) { result in
            switch result {
            case .success(let data):
//                print(String(data: data, encoding: .utf8))
                guard let res = try? JSONDecoder().decode(PostsListNetworkResponse.self, from: data) else {return}
                
                
                
                var postsArray = [String]()
                
                
                res.posts.map { post in
                    postsArray.append(post.comment.html2String)
                }
//
                let vm = PostsListViewModel(posts: postsArray)
//                vm.postsArray = postsArray
//                print(postsArray)
                completion(vm)
                
                
                
            case .failure(_): break
                
            }
        }
        
    }
    
    func imageURLForIndexPath (indexPath: IndexPath) -> URL {
        let urlForImageThumbnail = thumbnailUrlArray[indexPath.row]
        let stringToExport = "https://2ch.hk"+"\(urlForImageThumbnail)"
        let url = URL(string: stringToExport)!
        return url
    }
    
    func imageForIndexPath(indexPath: IndexPath) -> UIImage? {
        let urlForImageThumbnail = thumbnailUrlArray[indexPath.row]
        let stringToExport = "https://2ch.hk"+"\(urlForImageThumbnail)"
        let url = URL(string: stringToExport)!
        

        
        
        if let data = try? Data(contentsOf: url) {
            if let imgData = UIImage(data: data) {
                return imgData
            } else {
                return nil
            }
            
            
        } else {
            return nil
        }
        
        
        
    }
    
    var nameOfBoard: String {
        return boardName
    }
    
    func boardNameReturn() -> String {
        return boardName
    }
    
    
    private var threadsArray: [String] = []
    
    var arrayOfThreads: [String] {
        return threadsArray
    }
    
    var numberOfRows: Int {
        return threadsArray.count
    }
    
    func presentThread(board: String, firstPost: Int, lastPost: Int) {

        
    }
    
    init(board: String, completion: @escaping (ThreadListViewModel)->()) {
        
        let networking = Networking()
        let boardString = "https://2ch.hk/\(board)/index.json"
        
        networking.getData(url: boardString) { result in
            
            switch result {
            case .success(let success):
                
                let threadList = try? JSONDecoder().decode(ThreadListNetworkResponse.self, from: success)
                
                guard let threadList = threadList else {return}
                
                self.boardName = threadList.board.infoOuter
                
                //                threadList.threads.first?.postsCount
                
                threadList.threads.map({ threadResponse in
                    guard let threadComment = threadResponse.posts.first?.comment.html2String else {return}
                    guard let threadThumbnailUrl = threadResponse.posts.first?.files?.first?.thumbnail else {return}
                    let postsCount: Int = threadResponse.postsCount
                    guard let postNum = threadResponse.posts.first?.num else {return}
                    print(postNum)
                    
                    //                print(threadThumbnailUrl)
                    
                    
                    self.threadsArray.append(threadComment)
                    self.thumbnailUrlArray.append(threadThumbnailUrl)
                    self.postsCount.append(String(describing: postsCount))
                    self.postNumber.append(postNum)
                    completion(self)
                })
                
                
            case .failure(_):
                
                print("failure")
            }
        }
        
    }
    
    
}
