//
//  EmployeeViewModel.swift
//  Employee Directory
//
//  Created by Ryan David Forsyth on 2020-06-16.
//  Copyright © 2020 Ryan David Forsyth. All rights reserved.
//

import Foundation

struct EmployeeViewModel {
    
    var nameLabel: String
    var emailLabel: String
    var teamLabel: String
    var biography: String?
    var smallUrl: String?
    var largeUrl: String?
    var phoneNumber: String?
    var typeLabel: String
    
    init(using model: Employee) {
        nameLabel = model.fullName
        emailLabel = model.emailAddress
        teamLabel = model.team
        typeLabel = String(model.type.rawValue.capitalized).replacingOccurrences(of: "_", with: " ")
        
        if let sUrl = model.photoUrlSmall {
            smallUrl = sUrl
        }
        if let lUrl = model.photoUrlLarge {
            largeUrl = lUrl
        }
        if let bio = model.biography {
            biography = bio
        }
        if let phone = model.phoneNumber {
            phoneNumber = phone
        }
    }
    
    static func parseImageIdFromUrl(_ url: String) -> String? {
        
        guard let urlObj = URL(string: url)
            else { return nil }
        
        let components = urlObj.pathComponents
        return components[(components.count) - 2] // Return 2nd to last path component
        // Ex: https://s3.amazonaws.com/sq-mobile-interview/photos/16c00560-6dd3-4af4-97a6-d4754e7f2394/small.jpg
    }
}
