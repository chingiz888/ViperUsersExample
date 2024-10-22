//
//  UsersViewModel.swift
//  ViperUsersExample
//
//  Created by mac_pro14 on 22.10.2024.
//

import Foundation


struct UserViewModel {
    let id: String
    let name: String
    let username: String
    let email: String

    let isLiked: Bool

    func create(from model: User) -> UserViewModel {
        return UserViewModel(id: model.id, name: model.name, username: model.username, email: model.email, isLiked: false)
    }

    func isLikeChanged(like: Bool) -> UserViewModel {
        return UserViewModel(id: self.id, name: self.name, username: self.username, email: self.email, isLiked: like)
    }

}
