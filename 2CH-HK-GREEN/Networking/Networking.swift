//
//  Networking.swift
//  swapi-mvvm-2
//
//  Created by Wheatley on 19.05.2022.
//

import Foundation

extension Data {
    var html2AttributedString: NSAttributedString? {
        do {
            return try NSAttributedString(data: self, options: [.documentType: NSAttributedString.DocumentType.html, .characterEncoding: String.Encoding.utf8.rawValue], documentAttributes: nil)
        } catch {
            print("error:", error)
            return  nil
        }
    }
    var html2String: String { html2AttributedString?.string ?? "" }
}


extension StringProtocol {
    var html2AttributedString: NSAttributedString? {
        Data(utf8).html2AttributedString
    }
    var html2String: String {
        html2AttributedString?.string ?? ""
    }
}

struct Networking {
    
    enum keys: String {
        case boardsListURL = "https://2ch.hk/api/mobile/v2/boards"
        case threadInfoURL = "https://2ch.hk/api/mobile/v2/info/"
        case threadUrlAfter = "https://2ch.hk/api/mobile/v2/after/b/277245224/277245224"
    }
    
    func getThreadURLString(board: String, threadFirstPost: Int, threadLastPost: Int) -> String {
        return "https://2ch.hk/api/mobile/v2/after/\(board)/\(threadFirstPost)/\(threadLastPost)"
    }
    
    enum NetworkingError: Error{
        case badURL
        case badData
    }
    
    func getData(url: String, completion: @escaping (Result<Data, NetworkingError>) -> Void) {
        
        guard let url = URL(string: url) else { completion(.failure(NetworkingError.badURL))
            return
        }
        let session = URLSession.shared.dataTask(with: url) { data, response, error in
            
            guard let data = data else {
                completion(.failure(.badData))
                return
            }
            completion(.success(data))
        }
        session.resume()
    }
}
