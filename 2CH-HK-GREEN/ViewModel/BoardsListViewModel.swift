//
//  boardsListViewModel.swift
//  2CH-HK-GREEN
//
//  Created by Wheatley on 06.11.2022.
//

import Foundation

class BoardsListViewModel: BoardsListViewModelProtocol {
    
    func generateBoardViewModel (indexPath: IndexPath, board: String, completion: @escaping (ThreadListViewModel)->()) {
        ThreadListViewModel(board: board) { viewModel in
            completion(viewModel)
        }
    }
    
    internal var threads: [String] = []
    var boards: [(String, String)] = []
    
    init(completion: @escaping ()->()) {
        
        Networking().getData(url: Networking.keys.boardsListURL.rawValue) { result in
            

            switch result {
            case .success(let success):
                
                let response = try? JSONDecoder().decode(BoardsListNetworkResponse.self, from: success)
                guard let response = response else {return}
                
                
                for board in response {
                    
                    let toAppend = (board.id, board.infoOuter)
//                    print(toAppend)
                    
                    self.boards.append(toAppend)
                }
                    
                completion()
            case .failure(_):
                print("failure")
            }
            
        }
        
    }
    
    
    
    
}
