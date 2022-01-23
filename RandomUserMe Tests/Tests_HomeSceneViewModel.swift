//
//  TestClass.swift
//  RandomUserMe Tests
//
//  Created by Karol Korzeń on 23/01/2022.
//

@testable import RandomUserMe_API
import XCTest


class Tests_HomeSceneViewModel: XCTestCase {
    
    var homeSceneViewModel: HomeSceneViewModel!
    var homeSceneViewModel1: HomeSceneViewModel!
    var homeSceneViewModel2: HomeSceneViewModel!
    
    override func setUp() {
        super.setUp()
        homeSceneViewModel = HomeSceneViewModel()
        homeSceneViewModel1 = HomeSceneViewModel()
        homeSceneViewModel2 = HomeSceneViewModel()
        homeSceneViewModel.fetchUsers(completion: {
            
        })
        homeSceneViewModel1.users = [User(name: ResponseName(first: nil, last: nil), email: nil, phone: nil, gender: nil, nat: nil, picture: nil, location: nil),User(name: ResponseName(first: nil, last: nil), email: nil, phone: nil, gender: nil, nat: nil, picture: nil, location: nil)]
        homeSceneViewModel2.users = []
    }
    
    override func tearDown() {
        homeSceneViewModel = nil
        homeSceneViewModel1 = nil
        homeSceneViewModel2 = nil
        super.tearDown()
    }
    
    func testFetchUsers() throws {
        homeSceneViewModel.fetchUsers {
            XCTAssertEqual(self.homeSceneViewModel.numberOfUsers, 10)
        }
    }
    
    func testNumberOfUsers() throws {
        XCTAssertEqual(self.homeSceneViewModel1.numberOfUsers, 2)
        XCTAssertEqual(self.homeSceneViewModel2.numberOfUsers, 0)
    }
}
