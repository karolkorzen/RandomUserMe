//
//  Tests_MapSceneViewModel.swift
//  RandomUserMe Tests
//
//  Created by Karol Korzeń on 23/01/2022.
//

@testable import RandomUserMe_API
import XCTest


class Tests_MapSceneViewModel: XCTestCase {
    
    var mapSceneViewModel: MapSceneViewModel!
    var mapSceneViewModel1: MapSceneViewModel!
    
    override func setUp() {
        super.setUp()
        mapSceneViewModel = MapSceneViewModel(withCoordinates: (0.0,0.0))
        mapSceneViewModel1 = MapSceneViewModel(withCoordinates: (3123.00,123.0))
    }
    
    override func tearDown() {
        mapSceneViewModel = nil
        mapSceneViewModel1 = nil
        super.tearDown()
    }
    
    func testGetCoordinates() throws {
        XCTAssertEqual(self.mapSceneViewModel.getCoordinates().0, 0.0)
        XCTAssertEqual(self.mapSceneViewModel.getCoordinates().1, 0.0)
        XCTAssertEqual(self.mapSceneViewModel1.getCoordinates().0, 3123.00)
        XCTAssertEqual(self.mapSceneViewModel1.getCoordinates().1, 123.0)
    }
}
