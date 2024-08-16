//
//  NetworkData.swift
//  Test
//
//  Created by Oleg Lesnoy on 16.08.2024.
//
//
import Foundation
struct NetworkData: Decodable {
    var record: Record
}

struct Record: Decodable {
    var data: UserData
}

struct UserData: Decodable {
    var users: Users?
}

struct User: Decodable {
    var id: String?
    var firstName: String?
    var patronymic: String?
    var lastName: String?
    var genderLabel: String?
    var ratings: Ratings?
    var textChatPrice: Int?
    var videoChatPrice: Int?
    var hospitalPrice: Int?
    var avatar: String?
    var scientificDegreeLabel: String?
    var categoryLabel: String?
    var isFavorite: Bool?
    
    enum CodingKeys: String, CodingKey {
        case id, patronymic, avatar, ratings
        case firstName = "first_name"
        case lastName = "last_name"
        case genderLabel = "gender_label"
        case textChatPrice = "text_chat_price"
        case videoChatPrice = "video_chat_price"
        case hospitalPrice = "hospital_price"
        case scientificDegreeLabel = "scientific_degree_label"
        case categoryLabel = "category_label"
        case isFavorite = "is_favorite"
    }
}


struct Rating: Decodable {
    var id: Int?
    var name: String?
    var value: Double?
}

typealias Users = [User]
typealias Ratings = [Rating]
