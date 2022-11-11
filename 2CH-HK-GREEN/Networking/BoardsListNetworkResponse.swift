// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let boardsListNetworkResponse = try? newJSONDecoder().decode(BoardsListNetworkResponse.self, from: jsonData)

import Foundation

// MARK: - BoardsListNetworkResponseElement
struct BoardsListNetworkResponseElement: Codable {
    let bumpLimit: Int
    let category: Category
    let defaultName: String
    let enableDices, enableFlags, enableIcons, enableLikes: Bool
    let enableNames, enableOekaki, enablePosting, enableSage: Bool
    let enableShield, enableSubject, enableThreadTags, enableTrips: Bool
    let fileTypes: [FileType]
    let id, info, infoOuter: String
    let maxComment, maxFilesSize, maxPages: Int
    let name: String
    let threadsPerPage: Int
    let tags: [String]?
    let icons: [Icon]?

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
        case tags, icons
    }
}

enum Category: String, Codable {
    case empty = ""
    case взрослым = "Взрослым"
    case игры = "Игры"
    case политика = "Политика"
    case пользовательские = "Пользовательские"
    case разное = "Разное"
    case творчество = "Творчество"
    case тематика = "Тематика"
    case техникаИСофт = "Техника и софт"
    case японскаяКультура = "Японская культура"
}

enum FileType: String, Codable {
    case apng = "apng"
    case gif = "gif"
    case jpg = "jpg"
    case mp3 = "mp3"
    case mp4 = "mp4"
    case pdf = "pdf"
    case png = "png"
    case sticker = "sticker"
    case webm = "webm"
    case youtube = "youtube"
}

// MARK: - Icon
struct Icon: Codable {
    let name: String
    let num: Int
    let url: String
}

typealias BoardsListNetworkResponse = [BoardsListNetworkResponseElement]
 
