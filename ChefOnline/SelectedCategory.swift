//
//  SelectedCategory.swift
//  ChefOnline
//
//  Created by Karen Mirakyan on 4/2/20.
//  Copyright © 2020 Karen Mirakyan. All rights reserved.
//

import SwiftUI
import Firebase
import SDWebImage

struct SelectedCategory: View {
    
    var selectedCategoryTitle: String
    @ObservedObject var categoryVM: CategoryViewModel
    

    var body: some View {
        List {
            ForEach(categoryVM.dishList) { singleDish in
                
                HStack {
                    
                    Image("cookies")
                        .resizable()
                        .frame(width: 100, height: 100, alignment: .center)
                        .aspectRatio(contentMode: .fit)
                        .padding()
                    
                    VStack {
                        Text(singleDish.title)
                            .font(.system(size: 22))
                            .lineLimit(3)
                            .foregroundColor(.gray)
                        
                        Text(singleDish.recipe)
                            .font(.system(size: 14))
                            .lineLimit(3)
                    }
                }
            }
        }.navigationBarTitle(Text(selectedCategoryTitle))
    }
}

class CategoryViewModel : ObservableObject {
    
    @Published var dishList = [DishModel]()

    init(category: String) {

        let firestoreDatabase = Firestore.firestore()
        firestoreDatabase.collection(category).addSnapshotListener { (snapshot, error) in
            if error != nil {
                print("Error occured")
            } else {
                
                if snapshot?.isEmpty != true {
                    for document in snapshot!.documents {
                        if let image = document.get( "image" ) as? String {
                            if let title = document.get("title") as? String {
                                if let recipe = document.get("recipe") as? String {
                                    self.dishList.append(DishModel(title: title, recipe: recipe.replacingOccurrences(of: "  ", with: "\n"), image: image))
                                }
                            }
                        }
                    }
                }
            }
        }
    }
}


struct SelectedCategory_Previews: PreviewProvider {
    static var previews: some View {
        SelectedCategory(selectedCategoryTitle: "", categoryVM: CategoryViewModel(category: "karen"))
    }
}
