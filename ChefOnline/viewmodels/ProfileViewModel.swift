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
    @Published var dishRecipe: String = "Your recipe here"
    @Published var dishImage: UIImage?
    @Published var userIsLoggedIn: Bool = false
    @Published var userEmail: String = ""
    @Published var userPassword: String = ""
        
    
    func saveDataToFirebase() {
        
        let dishModel = DishModelFirebase(title: dishTitle, recipe: dishRecipe, image: dishImage)
        FirebaseService().postData(category: category, dish: dishModel)
    }
    
    func loginUser() {
        FirebaseService().loginUser(email: userEmail, password: userPassword) { (result) in
            self.userIsLoggedIn = result
        }
    }
    
    func registerUser() {
        FirebaseService().signUp(email: userEmail, password: userPassword) { (result) in
            self.userIsLoggedIn = result
        }
    }
    
}
