//
//  UsersInteractor.swift
//  ViperUsersExample
//
//  Created by mac_pro14 on 22.10.2024.
//

import Foundation

// INTERACTOR
final class UsersInteractor {
    weak var presenter: UsersInteractorOutput?
    var usersService: IUsersService
    init(usersService: IUsersService) {
        self.usersService = usersService
    }
}
extension UsersInteractor: UsersInteractorInput {
    func loadUsers() {
        usersService.fetchUsers { [weak self] result in
            switch result {
                case let .success(users):
                self?.presenter?.didLoadUsers(users: users)
                case let .failure(error):
                print("error: \(error)")
                self?.presenter?.didLoadUsers(users: [])
            }
        }
    }
}
    
