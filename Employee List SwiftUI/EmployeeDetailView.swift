//
//  EmployeeDetail.swift
//  Employee List SwiftUI
//
//  Created by Ryan David Forsyth on 2020-06-24.
//  Copyright © 2020 Ryan David Forsyth. All rights reserved.
//

import SwiftUI

struct EmployeeDetailView: View {
    
    var viewModel: EmployeeViewModel
    
    var body: some View {
        VStack(spacing: 10) {
            Spacer()
            ImageViewWidget(imageUrl: viewModel.largeUrl)
                .frame(width: 200, height: 200)
            
            Spacer()
            Text(viewModel.emailLabel)
            Text(viewModel.phoneNumber ?? "" )
            Text(viewModel.teamLabel)
            Text(viewModel.typeLabel)
            Text(viewModel.biography ?? "")
                .multilineTextAlignment(.center)
            Spacer(minLength:200)
                .navigationBarTitle(viewModel.nameLabel)
            
        }
        
    }
}

//MARK: Preview
struct EmployeeDetailView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            EmployeeDetailView(viewModel: EmployeeViewModel(using: Employee(id: UUID(), fullName: "Ryan Forsyth", phoneNumber: "514 707 7230", emailAddress: "forsyth.r@gmail.com", biography: "SwiftUI Developer", photoUrlSmall: nil, photoUrlLarge: nil, team: "Development", type: .FULL_TIME)))
                .navigationBarItems(leading: Button(action: {
                }, label: { Text("Back to list") }))
        }
    }
}
