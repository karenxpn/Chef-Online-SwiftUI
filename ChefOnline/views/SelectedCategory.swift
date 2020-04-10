//
//  SelectedCategory.swift
//  ChefOnline
//
//  Created by Karen Mirakyan on 4/2/20.
//  Copyright © 2020 Karen Mirakyan. All rights reserved.
//

import SwiftUI
import Firebase
import SDWebImageSwiftUI


struct SelectedCategory: View {
    
    var selectedCategoryTitle: String
    @ObservedObject var categoryVM: CategoryViewModel
    
    init( selectedCategory: String ) {
        self.selectedCategoryTitle = selectedCategory
        categoryVM = CategoryViewModel( category: self.selectedCategoryTitle )
    }
    
    var body: some View {
        
            List {
                ForEach(categoryVM.dishList) { singleDish in
                    
                    HStack {
                        
                        NavigationLink(destination: SingleDish(dishModel: singleDish)) {
                            WebImage(url: URL(string: singleDish.image) )
                                .resizable()
                                .cornerRadius(8)
                                .frame(width: 100, height: 100, alignment: .center)
                                .padding()
                            
                            VStack {
                                Text(singleDish.title)
                                    .font(.system(size: 22))
                                    .lineLimit(3)
                                    .foregroundColor(.gray)
                                
                                Text(singleDish.recipe)
                                    .font(.system(size: 14))
                                    .lineLimit(3)
                                    .multilineTextAlignment(.center)
                            }
                        }
                    }
                }
            }.navigationBarTitle(Text(selectedCategoryTitle))
    }
}


struct SelectedCategory_Previews: PreviewProvider {
    static var previews: some View {
        SelectedCategory(selectedCategory: "")
    }
}
