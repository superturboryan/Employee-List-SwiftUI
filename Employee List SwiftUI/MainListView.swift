//
//  ContentView.swift
//  Employee List SwiftUI
//
//  Created by Ryan David Forsyth on 2020-06-24.
//  Copyright © 2020 Ryan David Forsyth. All rights reserved.
//

import SwiftUI

struct MainListView: View {
    
    @ObservedObject var employeeStore = EmployeesStore()
    
    var body: some View {
        NavigationView{
            List {
                ForEach(employeeStore.employeeList, id: \.nameLabel) {viewModel in
                    EmployeeCell(viewModel: viewModel)
                }
            }.navigationBarTitle("Employee Directory")
                .navigationBarItems(
                    leading: Button(action: {
                    self.employeeStore.clearList()
                }, label: {
                    Text("Clear")
                }),
                    trailing: Button(action: {
                self.employeeStore.fetchEmployeeList()
            }, label: {
                Text("Fetch List")
            }))

        }
    }
}

struct EmployeeCell: View {
    
    var viewModel: EmployeeViewModel
    
    var body: some View {
        
        HStack(spacing: 10) {
            
            Image(systemName: "person.circle.fill")
                .resizable()
                .frame(width: 50, height: 50, alignment: .center)
                .aspectRatio(contentMode: .fill)
                .foregroundColor(Color.squareBlue())

            
            VStack(alignment: .leading) {
                
                Text(viewModel.nameLabel)
                    .font(.system(size:16, weight:.bold))
                Text(viewModel.emailLabel)
                    .foregroundColor(.gray)
                    .font(.system(size:14, weight:.light))
                Text(viewModel.teamLabel)
                    .foregroundColor(.gray)
                    .font(.system(size:14))
            }
        }
        .padding(.vertical, 3.0)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        MainListView()
    }
}
