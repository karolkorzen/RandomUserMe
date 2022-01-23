//
//  MapSceneViewModel.swift
//  RandomUserMe API
//
//  Created by Karol Korzeń on 20/01/2022.
//

import Foundation

class MapSceneViewModel {
    
    //MARK: - Properties

    private let coordinates: (Double, Double)
    
    //MARK: - Lifecycle
    
    init(withCoordinates coordinates: (Double, Double)){
        self.coordinates = coordinates
    }
    
    //MARK: - Helpers
    
    func getCoordinates() -> (Double, Double) {
        return coordinates
    }
}
