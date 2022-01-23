//
//  User.swift
//  RandomUserMe API
//
//  Created by Karol Korzeń on 19/01/2022.
//

import Foundation

struct RawServiceResponse: Codable {
    let results: [User]?
}

struct User: Codable {
    let name: ResponseName?
    let email: String?
    let phone: String?
    let gender: String?
    let nat: String?
    let picture: ResponsePicture?
    let location: ResponseLocation?
}

struct ResponseName: Codable {
    let first: String?
    let last: String?
}

struct ResponsePicture: Codable {
    let large: String?
}

struct ResponseLocation: Codable {
    let coordinates: Coordinates?
}

struct Coordinates: Codable {
    let latitude: String?
    let longitude: String?
}
