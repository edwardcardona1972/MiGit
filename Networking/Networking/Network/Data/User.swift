//
//  User.swift
//  Networking
//
//  Created by Eduard Alexis Cardona Grajales on 2/3/25.
//

import Foundation

// {
//"code":200,
//"meta":null,
//"data":{
//   "id":123,
//   "name":"Aatreya Agarwal",
//   "email":"agarwal_aatreya@simonis_aufderhar.name",
//  "gender":"MAle",
//  "status":"Inactive",
//  created_at":"2020-10-10T03:50:06.151+05:30",
//  "update_at":"2020-10-10T03:50:06.151+05:30"
//  }
//}

struct UserResponse: Decodable {
    let code: Int?
    let meta: Meta?
    let data: User?
    
}
struct User: Decodable {
    let id: Int?
    let name: String?
    let email: String?
    let gender: String?
    let status: String?
    let created_at: Date?
    let update_at: Date?
    
    enum CodingKeys: String, CodingKey {
        case id
        case name
        case email
        case gender
        case status
        case created_at = "created_at"
        case update_at = "update_at"
    }
    
}
struct Meta: Decodable {
    
}

