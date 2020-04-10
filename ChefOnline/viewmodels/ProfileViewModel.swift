//
//  ProfileViewModel.swift
//  ChefOnline
//
//  Created by Karen Mirakyan on 4/10/20.
//  Copyright © 2020 Karen Mirakyan. All rights reserved.
//

import Foundation

class ProfileViewModel: ObservableObject {
    
    @Published var category: String = "Աղանդեր"
    @Published var dishTitle: String = ""
    @Published var dishRecipe: String = ""
    
    
}
