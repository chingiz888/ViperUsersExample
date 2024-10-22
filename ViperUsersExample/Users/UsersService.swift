//
//  UsersService.swift
//  ViperUsersExample
//
//  Created by mac_pro14 on 22.10.2024.
//

import Foundation

enum UserServiceError: Error {
    case genaral
    case jsonDecoding
}

enum ApiEndpoints {
    case users
    var url: URL {
        switch self {
        case .users:
            return URL(string: "https://6716bdc03fcb11b265d37bfe.mockapi.io/api/v1/users")!  // https://example.com/users
        }
    }
}

// URLSession и Decoder должны создаваться на уровне выше
// и просовываться в UserService через инициализатор
final class UserService: IUsersService {
    private let session: URLSession
    private let decoder: JSONDecoder

    init(session: URLSession = URLSession.shared, decoder: JSONDecoder = JSONDecoder()) {
        self.session = session
        self.decoder = decoder
    }
    
    func fetchUsers(completion: @escaping (Result<[User], Error>) -> Void ) {
        
        let request = URLRequest(url: ApiEndpoints.users.url, cachePolicy: .useProtocolCachePolicy)
        
        let task = session.dataTask(with: request) { [weak self] data, response, error in
            
            guard let self = self else {
                completion(.failure(UserServiceError.genaral))
                return
            }
            
            if let error = error {
                completion(.failure(UserServiceError.genaral))
                return
            }
            
            guard let data = data else {
                completion(.failure(UserServiceError.genaral))
                return
            }
            
            do {
                let users = try self.decoder.decode([User].self, from: data)
                completion(.success(users))
            } catch {
                completion(.failure(UserServiceError.jsonDecoding))
            }
        }
        
        task.resume()
    }
}
