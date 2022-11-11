//
//  ThreadListTableViewController.swift
//  2CH-HK-GREEN
//
//  Created by Wheatley on 05.11.2022.
//

import UIKit

class ThreadListTableViewController: UITableViewController {
    
    var nextViewControllerStringURL: String?
    
    
    var viewModel: ThreadListViewModel?
    
    
    
    func initialSetup(board: String) {
        
        viewModel = ThreadListViewModel(board: board, completion: {_ in
            DispatchQueue.main.async {
                guard let boardName = self.viewModel?.nameOfBoard else {return}
                self.tabBarItem = UITabBarItem(title: "Доска: \(boardName)", image: UIImage(systemName: "gear.circle"), selectedImage: UIImage(systemName: "gear.circle.fill"))
                self.tableView.reloadData()
            }
            
            
        })
    }
    
    //    override func viewWillAppear(_ animated: Bool) {
    //        initialSetup()
    //    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        initialSetup(board: "b")
        self.tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
    }
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return viewModel?.numberOfRows ?? 1
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        guard let number = viewModel?.postNumberFirstInThread(indexPath: indexPath) else {return}
        
        let urlString = Networking().getThreadURLString(board: "b", threadFirstPost: number, threadLastPost: number)
        
        viewModel?.generatePostsViewModel(url: urlString, completion: { PostsListViewModel in
            
//            print(PostsListViewModel.postsArray)
            

            
            DispatchQueue.main.async {
                let postsViewController = PostsListTableViewController()
                postsViewController.viewModel = PostsListViewModel
                self.navigationController?.pushViewController(postsViewController, animated: true)
            }
            
            
        })

    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        var config = UIListContentConfiguration.valueCell()
//        config.imageToTextPadding = CGFloat(60)
        config.text = viewModel?.arrayOfThreads[indexPath.row] ?? "sample"
        
        
        
        config.secondaryText = viewModel?.postsCountForIndexPath(indexPath: indexPath)

        
        
        DispatchQueue.global(qos: .background).async {
            let imageData = self.viewModel?.imageForIndexPath(indexPath: indexPath)
            DispatchQueue.main.async {
//                print("image requested")
                config.image = imageData
//                tableView.reloadData()
            }
        }
        
        
        
        
        
        
        
        

        

        
        
        cell.contentConfiguration = config
        
        return cell
    }
    
    
    
    /*
     // Override to support conditional editing of the table view.
     override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
     // Return false if you do not want the specified item to be editable.
     return true
     }
     */
    
    /*
     // Override to support editing the table view.
     override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
     if editingStyle == .delete {
     // Delete the row from the data source
     tableView.deleteRows(at: [indexPath], with: .fade)
     } else if editingStyle == .insert {
     // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
     }
     }
     */
    
    /*
     // Override to support rearranging the table view.
     override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {
     
     }
     */
    
    /*
     // Override to support conditional rearranging of the table view.
     override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
     // Return false if you do not want the item to be re-orderable.
     return true
     }
     */
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    

}
