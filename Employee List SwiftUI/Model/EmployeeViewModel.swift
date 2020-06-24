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
    var imageId: String?
    
    init(using model: Employee) {
        nameLabel = model.fullName
        emailLabel = model.emailAddress
        teamLabel = model.team
        if let url = model.photoUrlSmall {
            imageId = EmployeeViewModel.parseImageIdFromUrl(url)
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
