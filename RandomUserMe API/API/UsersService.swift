//
//  UsersService.swift
//  RandomUserMe API
//
//  Created by Karol Korzeń on 19/01/2022.
//

import Foundation

class UsersService {
    static let shared = UsersService()
    private var dataTask: URLSessionDataTask?
    
    /// function returns set of users
    /// - Parameters:
    ///   - completion: array of users
    func fetchUsers(completion: @escaping(([User]) -> Void)){
        
        let fetchLink = "https://randomuser.me/api/?results=10"
        print("DEBUG: fetchLink -> \(fetchLink)")
        guard let url = URL(string: fetchLink) else {return}
        
        dataTask = URLSession.shared.dataTask(with: url) { (data, response, error) in
            
            if let error = error {
                print("DEBUG: DataTask error: \(error.localizedDescription)")
                return
            }
            
            guard let response = response as? HTTPURLResponse else {
                print("DEBUG: Empty Response")
                return
            }
            print("DEBUG: Response status code: \(response.statusCode)")
            
            guard let data = data else {
                print("DEBUG: Empty Data")
                return
            }
            
            do {
                let decoder = JSONDecoder()
                let jsonData = try decoder.decode(RawServiceResponse.self, from: data)
                guard let users = jsonData.results else {return}
                print("DEBUG: SUCCESS - FETCH | results -> \(users.count)")
                DispatchQueue.main.async {
                    completion(users)
                }
            } catch let error {
                print("DEBUG: ERROR - FETCH")
                print(error)
            }
            
        }
        dataTask?.resume()
    }
}
