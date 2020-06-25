//
//  EmployeeStore.swift
//  Employee List SwiftUI
//
//  Created by Ryan David Forsyth on 2020-06-24.
//  Copyright © 2020 Ryan David Forsyth. All rights reserved.
//

import SwiftUI

class EmployeesStore: ObservableObject {
    
    @Published var employeeList = [EmployeeViewModel]()
    
    init() {
//        self.fetchEmployeeList()
    }
    
    func fetchEmployeeList() {
        
        let apiURL = "https://s3.amazonaws.com/sq-mobile-interview/employees.json"
        guard let url = URL(string: apiURL) else { return }
        
        URLSession.shared.dataTask(with: url) { (data,resp,err) in
            //Check error
            guard let data = data else { return }
            do {
                let employeeResult = try JSONDecoder().decode(EmployeeResult.self, from: data)
                DispatchQueue.main.async {
                    self.employeeList =  employeeResult.employees
                        .map({ return EmployeeViewModel(using: $0)})
                        .sorted(by: { (a, b) -> Bool in
                            a.nameLabel.compare(b.nameLabel) == .orderedAscending
                        })
                }
            }
            catch {
                // Handle decoding error
            }
        }.resume()
    }
    
    func addExampleEmployee() {
        self.employeeList.append(EmployeeViewModel(using: Employee(id: UUID(), fullName: "Ryan Forsyth", phoneNumber: "514 707 7230", emailAddress: "forsyth.r@gmail.com", biography: "SwiftUI Developer", photoUrlSmall: nil, photoUrlLarge: nil, team: "Development", type: .FULL_TIME)))
    }
}
