// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let threadList = try? newJSONDecoder().decode(ThreadListNetworkResponse.self, from: jsonData)

import Foundation

// MARK: - ThreadList
struct ThreadListNetworkResponse: Codable {
    let advertBottomImage, advertBottomLink, advertTopImage, advertTopLink: String
    let board: Board
    let boardBannerImage, boardBannerLink: String
    let boardSpeed, currentPage, currentThread: Int
    let isBoard, isIndex: Bool
    let pages: [Int]
    let threads: [Thread]

    enum CodingKeys: String, CodingKey {
        case advertBottomImage = "advert_bottom_image"
        case advertBottomLink = "advert_bottom_link"
        case advertTopImage = "advert_top_image"
        case advertTopLink = "advert_top_link"
        case board
        case boardBannerImage = "board_banner_image"
        case boardBannerLink = "board_banner_link"
        case boardSpeed = "board_speed"
        case currentPage = "current_page"
        case currentThread = "current_thread"
        case isBoard = "is_board"
        case isIndex = "is_index"
        case pages, threads
    }
}

// MARK: - Board
struct Board: Codable {
    let bumpLimit: Int
    let category: String
    let defaultName: Name
    let enableDices, enableFlags, enableIcons, enableLikes: Bool
    let enableNames, enableOekaki, enablePosting, enableSage: Bool
    let enableShield, enableSubject, enableThreadTags, enableTrips: Bool
    let fileTypes: [String]
    let id: ID
    let info, infoOuter: String
    let maxComment, maxFilesSize, maxPages: Int
    let name: String
    let threadsPerPage: Int

    enum CodingKeys: String, CodingKey {
        case bumpLimit = "bump_limit"
        case category
        case defaultName = "default_name"
        case enableDices = "enable_dices"
        case enableFlags = "enable_flags"
        case enableIcons = "enable_icons"
        case enableLikes = "enable_likes"
        case enableNames = "enable_names"
        case enableOekaki = "enable_oekaki"
        case enablePosting = "enable_posting"
        case enableSage = "enable_sage"
        case enableShield = "enable_shield"
        case enableSubject = "enable_subject"
        case enableThreadTags = "enable_thread_tags"
        case enableTrips = "enable_trips"
        case fileTypes = "file_types"
        case id, info
        case infoOuter = "info_outer"
        case maxComment = "max_comment"
        case maxFilesSize = "max_files_size"
        case maxPages = "max_pages"
        case name
        case threadsPerPage = "threads_per_page"
    }
}

//enum Name: String, Codable {
//    case аноним = "Аноним"
//}

enum ID: String, Codable {
    case b = "b"
}

// MARK: - Thread
struct Thread: Codable {
    let filesCount: Int
    let posts: [Post]
    let postsCount, threadNum: Int

    enum CodingKeys: String, CodingKey {
        case filesCount = "files_count"
        case posts
        case postsCount = "posts_count"
        case threadNum = "thread_num"
    }
}

// MARK: - Post
struct Post: Codable {
    let banned: Int
    let board: ID
    let closed: Int
    let comment, date, email: String
    let endless: Int
    let files: [File]?
    let filesCount: Int?
    let lasthit: Int
    let name: Name
    let num, op, parent: Int
    let postsCount: Int?
    let sticky: Int
    let subject: String
    let tags: String?
    let timestamp: Int
    let trip: String
    let views: Int

    enum CodingKeys: String, CodingKey {
        case banned, board, closed, comment, date, email, endless, files
        case filesCount = "files_count"
        case lasthit, name, num, op, parent
        case postsCount = "posts_count"
        case sticky, subject, tags, timestamp, trip, views
    }
}

// MARK: - File
struct File: Codable {
    let displayname, fullname: String
    let height: Int
    let md5, name, path: String
    let size: Int
    let thumbnail: String
    let tnHeight, tnWidth, type, width: Int
    let duration: String?
    let durationSecs: Int?

    enum CodingKeys: String, CodingKey {
        case displayname, fullname, height, md5, name, path, size, thumbnail
        case tnHeight = "tn_height"
        case tnWidth = "tn_width"
        case type, width, duration
        case durationSecs = "duration_secs"
    }
}
