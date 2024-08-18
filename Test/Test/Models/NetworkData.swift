//
//  NetworkData.swift
//  Test
//
//  Created by Oleg Lesnoy on 16.08.2024.
//
//
import Foundation

typealias Users = [User]

struct NetworkData: Decodable {
    var record: Record
}

struct Record: Decodable {
    var data: UserData
}

struct UserData: Decodable {
    var users: Users?
}

struct User: Identifiable {
    var id: String?
    var firstName: String?
    var patronymic: String?
    var lastName: String?
    var textChatPrice: Int?
    var videoChatPrice: Int?
    var homePrice: Int?
    var hospitalPrice: Int?
    var avatar: String?
    var isFavorite: Bool?
    var ratingsRating: Double?
    var seniority: Int?
    var category: Int?
    var educationTypeLabel: Education?
    var freeReceptionTime: [FreeReceptionTime]
    var workExpirience: [WorkExpirience]
}

struct Education: Decodable {
    var name: String?
}

struct FreeReceptionTime: Decodable {
    var time: Int?
}

struct WorkExpirience: Decodable {
    var organization:String?
}
extension User: Decodable {
    enum CodingKeys: String, CodingKey {
        case id, patronymic, avatar, seniority, category
        case homePrice = "home_price"
        case firstName = "first_name"
        case lastName = "last_name"
        case textChatPrice = "text_chat_price"
        case videoChatPrice = "video_chat_price"
        case hospitalPrice = "hospital_price"
        case isFavorite = "is_favorite"
        case ratingsRating = "ratings_rating"
        case educationTypeLabel = "education_type_label"
        case freeReceptionTime = "free_reception_time"
        case workExpirience = "work_expirience"
    }
}
