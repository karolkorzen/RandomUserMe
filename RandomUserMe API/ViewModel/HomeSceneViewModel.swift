//
//  HomeSceneViewModel.swift
//  RandomUserMe API
//
//  Created by Karol Korzeń on 19/01/2022.
//

import Foundation

class HomeSceneViewModel {
    
    //MARK: - Properties

    var users: [User] = []
    
    //MARK: - Lifecycle
    
    //MARK: - API
    
    func fetchUsers(completion: @escaping()->Void) {
        UsersService.shared.fetchUsers() { users in
            self.users = users
            dump(users)
            completion()
        }
    }
    
    
    //MARK: - Helpers
    
    var numberOfUsers: Int{
        return users.count
    }
}
