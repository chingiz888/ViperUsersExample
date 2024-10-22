//
//  UsersProtocols.swift
//  ViperUsersExample
//
//  Created by mac_pro14 on 22.10.2024.
//

import Foundation


protocol UsersViewInput: AnyObject {
    func showUsers(users: [UserViewModel])
}

protocol UsersViewOutput: AnyObject  {
    func viewDidLoad()
}

protocol UsersInteractorInput: AnyObject  {
    func loadUsers()
}

protocol UsersInteractorOutput: AnyObject  {
        func didLoadUsers(users: [User])
}

protocol IUsersRouter: AnyObject  {
    var presenter: UsersViewOutput? { get set } 
}

protocol IUsersService {
    func fetchUsers(completion: @escaping (Result<[User], Error>) -> Void )
}
