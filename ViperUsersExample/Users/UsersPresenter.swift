//
//  UsersPresenter.swift
//  ViperUsersExample
//
//  Created by mac_pro14 on 22.10.2024.
//

import Foundation

// PRESENTER
final class UsersPresenter {
    weak var view: UsersViewInput?
    var interactor: UsersInteractorInput
    var router: IUsersRouter
    
    init(interactor: UsersInteractorInput, router: IUsersRouter) {
        self.interactor = interactor
        self.router = router
    }
}
extension UsersPresenter: UsersViewOutput {
    func viewDidLoad() {
        interactor.loadUsers()
    }
}
extension UsersPresenter: UsersInteractorOutput {
    func didLoadUsers(users: [User]) {
        print("данные готовы к показу на view")
        // переводим из User -> UserViewModel
        // оповещаем View
        let viewUsers = users.map{  UserViewModel(id: $0.id, name: $0.name, username: $0.username, email: $0.email, isLiked: false) }
        DispatchQueue.main.async {
            self.view?.showUsers(users: viewUsers)
        }
    }
}
