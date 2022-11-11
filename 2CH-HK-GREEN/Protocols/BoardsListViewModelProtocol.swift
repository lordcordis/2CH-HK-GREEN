//
//  boardsListViewModelProtocol.swift
//  2CH-HK-GREEN
//
//  Created by Wheatley on 06.11.2022.
//

import Foundation
protocol BoardsListViewModelProtocol {
    var boards: [(String, String)] {get}
    func generateBoardViewModel (indexPath: IndexPath, board: String, completion: @escaping (ThreadListViewModel)->())
}
