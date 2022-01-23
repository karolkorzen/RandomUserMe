//
//  UserViewModel.swift.swift
//  RandomUserMe API
//
//  Created by Karol Korzeń on 19/01/2022.
//

import Foundation

class UserViewModel {
    
    //MARK: - Properties
    
    private let user: User
    
    //MARK: - Lifecycle
    
    init(withUser user: User){
        self.user = user
    }
    
    //MARK: - Helpers
    
    var nameLabelText: String {
        return "\(user.name?.first ?? "") \(user.name?.last ?? "")"
    }
    
    var imageURL: URL? {
        guard let link = user.picture?.large, let url = URL(string: link) else {return nil}
        return url
    }
    
    var phoneTitleLabelText: String {
        return "phone:"
    }
    
    var genderTitleLabelText: String {
        return "gender:"
    }
    
    var emailTitleLabelText: String {
        return "email:"
    }
    
    var nationalityTitleLabelText: String {
        return "nationality:"
    }
    
    var phoneLabelText: String {
        return user.phone ?? ""
    }
    
    var genderLabelText: String {
        return user.gender ?? ""
    }
    
    var emailLabelText: String {
        return user.email ?? ""
    }
    
    var nationalityLabelText: String {
        return user.nat ?? ""
    }
    
    var getCoordinates: (Double, Double)? {
//        guard let lat = user.location?.coordinates?.latitude, let long = user.location?.coordinates?.latitude else {return (nil, nil)}
        if let lat = user.location?.coordinates?.latitude, let long = user.location?.coordinates?.longitude, let latitude = Double(lat), let longitude = Double(long) {
            return (latitude, longitude)
        } else {
            return nil
        }
    }
}
