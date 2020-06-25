//
//  ImageViewWidget.swift
//  Employee List SwiftUI
//
//  Created by Ryan David Forsyth on 2020-06-24.
//  Copyright © 2020 Ryan David Forsyth. All rights reserved.
//

import SwiftUI

struct ImageViewWidget: View {
    
    init(imageUrl: String?) {
        self.imageLoader = ImageLoader(imageUrl: imageUrl)
    }
    
    @ObservedObject var imageLoader: ImageLoader
    
    var body: some View {
        
        Image(uiImage: imageLoader.image!)
            .resizable()
            .scaledToFit()
            .imageScale(.large)
            .aspectRatio(contentMode: .fit)
            .foregroundColor(.squareBlue())
            .cornerRadius(25)
            .font(.system(size: 200))
    }
}


class ImageLoader: ObservableObject {
    
    @Published var image = UIImage(systemName: "person.circle.fill")
    
    init(imageUrl: String?) {
        
        guard let imageUrl = imageUrl, let url = URL(string: imageUrl) else { return }
        
        URLSession.shared.dataTask(with: url) { (data,resp,err) in
            //Check error
            guard let imageData = data else { return }
            DispatchQueue.main.async {
                self.image = UIImage(data: imageData)
            }
        }.resume()
    }
    
}

