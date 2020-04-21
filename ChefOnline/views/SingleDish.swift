//
//  SingleDish.swift
//  ChefOnline
//
//  Created by Karen Mirakyan on 4/3/20.
//  Copyright © 2020 Karen Mirakyan. All rights reserved.
//

import SwiftUI
import SDWebImageSwiftUI

struct SingleDish: View {
    
    var dishModel: DishModel
    
    var body: some View {
        
        ScrollView {
            VStack {
            
                WebImage(url: URL( string: dishModel.image ))
                    .resizable()
                .cornerRadius(16)
                    .frame(width: 200, height: 200, alignment: .center)
                
                Text(dishModel.title)
                    .font(.title)
                    .foregroundColor(.gray)
                    .multilineTextAlignment(.center)
                    .padding()
                
                Text ( dishModel.recipe.replacingOccurrences(of: "  ", with: "\n\n") )
                    .multilineTextAlignment(.leading)
                    .padding()
                    
            }
        }
    }
}

struct SingleDish_Previews: PreviewProvider {
    static var previews: some View {
        SingleDish(dishModel: DishModel(title: "", recipe: "", image: ""))
    }
}
