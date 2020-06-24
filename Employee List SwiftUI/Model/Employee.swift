//
//  Employee.swift
//  Employee Directory
//
//  Created by Ryan David Forsyth on 2020-06-16.
//  Copyright © 2020 Ryan David Forsyth. All rights reserved.
//

import Foundation

enum EmployeeType: String, Codable, CodingKey {
    case FULL_TIME
    case PART_TIME
    case CONTRACTOR
}

struct Employee: Decodable, Identifiable {
    
    let id: UUID // Specify UUID type to prevent invalid UUID's
    let fullName: String
    let phoneNumber: String? // Use optionals for non-required values
    let emailAddress: String
    let biography: String?
    let photoUrlSmall: String?
    let photoUrlLarge: String?
    let team: String
    let type: EmployeeType
    
    private enum CodingKeys: String, CodingKey { // JSON keys that are identical to properties default to raw string from case
        case id = "uuid"
        case fullName = "full_name"
        case phoneNumber = "phone_number"
        case emailAddress = "email_address"
        case biography
        case photoUrlSmall = "photo_url_small"
        case photoUrlLarge = "photo_url_large"
        case team
        case type = "employee_type"
    }
}

struct EmployeeResult: Decodable {
    let employees: [Employee]
    
    private enum CodingKeys: String, CodingKey {
        case employees
    }
}
