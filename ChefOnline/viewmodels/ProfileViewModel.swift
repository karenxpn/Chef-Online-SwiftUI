//
//  ProfileViewModel.swift
//  ChefOnline
//
//  Created by Karen Mirakyan on 4/10/20.
//  Copyright © 2020 Karen Mirakyan. All rights reserved.
//

import Foundation
import SwiftUI

class ProfileViewModel: ObservableObject {
    
    @Published var category: String = "Աղանդեր"
    @Published var dishTitle: String = ""
    @Published var dishRecipe: String = ""
    @Published var dishImage: UIImage?
        
    
    func saveDataToFirebase() {
        print("prepare to save data")
        let dishModel = DishModelFirebase(title: dishTitle, recipe: dishRecipe, image: dishImage)
        
        FirebaseService().postData(category: category, dish: dishModel)
    }
    
}
