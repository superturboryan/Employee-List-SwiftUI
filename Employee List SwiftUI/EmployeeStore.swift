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
        self.fetchEmployeeList()
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
                    self.employeeList =  employeeResult.employees.map({ return EmployeeViewModel(using: $0)})
                }
            }
            catch {
                // Handle decoding error
            }
        }.resume()
    }
    
    func clearList() {
        self.employeeList = []
    }
}
