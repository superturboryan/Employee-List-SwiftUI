//
//  ContentView.swift
//  Employee List SwiftUI
//
//  Created by Ryan David Forsyth on 2020-06-24.
//  Copyright © 2020 Ryan David Forsyth. All rights reserved.
//

import SwiftUI

struct EmployeeListView: View {
    
    @ObservedObject var employeeStore = EmployeesStore()
    
    var body: some View {
        NavigationView{
            List {
                ForEach(employeeStore.employeeList, id: \.nameLabel) {viewModel in
                    NavigationLink(destination: EmployeeDetailView(viewModel: viewModel)) {
                        EmployeeCell(viewModel: viewModel)
                    }
                }
                if employeeStore.employeeList.count != 0 {
                    HStack {
                        Spacer()
                        Text("\(employeeStore.employeeList.count) employees")
                            .font(.subheadline)
                        Spacer()
                    }
                }
                EmptyView()
            }
            .navigationBarTitle("Employee Directory")
            .navigationBarItems(
                leading: Button(action: {
                self.employeeStore.addExampleEmployee()
            }, label: {
                Text("Add")
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
            
            ImageViewWidget(imageUrl: viewModel.smallUrl)
                .frame(width: 50, height: 50)
            
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



//MARK: Preview
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        EmployeeListView()
    }
}
