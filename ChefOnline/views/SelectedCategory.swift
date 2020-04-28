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
    @State private var search: String = ""
    
    init( selectedCategory: String ) {
        self.selectedCategoryTitle = selectedCategory
        categoryVM = CategoryViewModel( category: self.selectedCategoryTitle )
    }
    
    var body: some View {
        
        VStack {
            SearchBar(text: self.$search)
            List {
                
                
                ForEach(categoryVM.dishList
                    .filter{
                        self.search.isEmpty ? true : $0.title.localizedCaseInsensitiveContains(self.search)
                }) { singleDish in
                    
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
            }
        }
        .gesture(DragGesture().onChanged{_ in
            UIApplication.shared.endEditing()
        })
        .navigationBarTitle(Text(selectedCategoryTitle))
    }
}


struct SelectedCategory_Previews: PreviewProvider {
    static var previews: some View {
        SelectedCategory(selectedCategory: "")
    }
}
