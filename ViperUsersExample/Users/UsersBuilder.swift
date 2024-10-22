//
//  UsersBuilder.swift
//  ViperUsersExample
//
//  Created by mac_pro14 on 22.10.2024.
//

import UIKit

// Builder / Configurator
final class UsersModuleBuilder {
    static func createUsers() -> UIViewController {
    
        // настраиваем сервисы
        // созддаем интерактор, роутер
        // затем создаем презентер
        // затем создаем въю
        let urlSession = URLSession.shared
        let decoder = JSONDecoder()
        let service = UserService(session: urlSession, decoder: decoder)
        let interactor = UsersInteractor(usersService: UserService())
        let router = UsersRouter()
        let presenter = UsersPresenter(interactor: interactor, router: router)
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let viewController = storyboard.instantiateViewController(withIdentifier: "Main") as! UsersViewController
        
        
        viewController.presenter = presenter
        presenter.view = viewController
        interactor.presenter = presenter
        router.presenter = presenter

        return viewController as! UIViewController

    }

}
