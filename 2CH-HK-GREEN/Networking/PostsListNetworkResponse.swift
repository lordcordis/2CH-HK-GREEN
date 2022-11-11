// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let postsListNetworkResponse = try? newJSONDecoder().decode(PostsListNetworkResponse.self, from: jsonData)

import Foundation

// MARK: - PostsListNetworkResponse
struct PostsListNetworkResponse: Codable {
    let posts: [Post]
    let result, uniquePosters: Int

    enum CodingKeys: String, CodingKey {
        case posts, result
        case uniquePosters = "unique_posters"
    }
}

// MARK: - Post
//struct Post: Codable {
//    let banned: Int
//    let board: Board
//    let closed: Int
//    let comment, date: String
//    let email: Email
//    let endless: Int
//    let files: [File]?
//    let lasthit: Int
//    let name: Name
//    let num, op, parent, sticky: Int
//    let subject: String
//    let tags: String?
//    let timestamp: Int
//    let trip: String
//    let views: Int
//}

//enum Board: String, Codable {
//    case b = "b"
//}

enum Email: String, Codable {
    case empty = ""
    case mailtoSage = "mailto:sage"
}

// MARK: - File
//struct File: Codable {
//    let displayname, fullname: String
//    let height: Int
//    let md5, name, path: String
//    let size: Int
//    let thumbnail: String
//    let tnHeight, tnWidth, type, width: Int
//    let duration: String?
//    let durationSecs: Int?
//
//    enum CodingKeys: String, CodingKey {
//        case displayname, fullname, height, md5, name, path, size, thumbnail
//        case tnHeight = "tn_height"
//        case tnWidth = "tn_width"
//        case type, width, duration
//        case durationSecs = "duration_secs"
//    }
//}

enum Name: String, Codable {
    case аноним = "Аноним"
}
