//
//  Utilities.swift
//  RandomUserMe API
//
//  Created by Karol Korzeń on 19/01/2022.
//

import Foundation

import UIKit

enum ViewFactory {
    /// func creates  standar label of default size 14 and default weight .back
    /// - Parameters:
    ///   - size: font size
    ///   - weight: weight
    ///   - color: color
    /// - Returns: UILabel
    static func standardLabel(withSize size: CGFloat = 14, withWeight weight: UIFont.Weight = .black, withColor color: UIColor = UIColor.rgb(red: 158, green: 158, blue: 158)) -> UILabel {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: size, weight: weight)
        label.textColor = color
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }
    
    static func profileImage() -> UIImageView {
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFill
        iv.translatesAutoresizingMaskIntoConstraints = false
        iv.clipsToBounds = true
        iv.setDimensions(width: 70, height: 70)
        iv.layer.cornerRadius = 5
        return iv
    }
}
