//
//  BoardsListTableViewController.swift
//  2CH-HK-GREEN
//
//  Created by Wheatley on 06.11.2022.
//

import UIKit

class BoardsListTableViewController: UITableViewController {
    let cellIdentifier: String = "cellIdentifier"
    
    var isNextViewPresented: Bool = false
    
    var viewModel: BoardsListViewModelProtocol?
    
    override func viewWillAppear(_ animated: Bool) {
        isNextViewPresented = false
        
        
        viewModel = BoardsListViewModel {
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
            
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: cellIdentifier)
    }
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return viewModel?.boards.count ?? 10
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath)
        var config = cell.defaultContentConfiguration()
        config.text = viewModel?.boards[indexPath.row].0
        config.secondaryText = viewModel?.boards[indexPath.row].1
//        config.image =
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
    
    
    
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let boardLiteral = viewModel?.boards[indexPath.row].0 else {return}
        
        viewModel?.generateBoardViewModel(indexPath: indexPath, board: boardLiteral, completion: { viewModel in
            guard self.isNextViewPresented == false else {return}
            
            DispatchQueue.main.async {
                let vc = ThreadListTableViewController()
//                vc.viewModel = viewModel
                vc.initialSetup(board: boardLiteral)
                self.navigationController?.pushViewController(vc, animated: true)
                self.isNextViewPresented = true
            }
            
            
            
        })
        
    }
    
}
