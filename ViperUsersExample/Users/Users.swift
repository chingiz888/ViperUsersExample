//
//  Users.swift
//  ViperUsersExample
//
//  Created by mac_pro14 on 22.10.2024.
//

import Foundation

// начинаем с модели
struct User: Decodable {
    // предположим это обязательные поля
    let id: String
    let name: String
    var username: String {
       ""
    }
    var email: String {
        ""
    }
    // остальные поля опциональны
}
