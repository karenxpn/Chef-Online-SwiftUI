//
//  CategoryViewModel.swift
//  ChefOnline
//
//  Created by Karen Mirakyan on 4/10/20.
//  Copyright © 2020 Karen Mirakyan. All rights reserved.
//

import Foundation
class CategoryViewModel : ObservableObject {
    
    @Published var dishList = [DishModel]()

    init(category: String) {

        FirebaseService().fetchData(category: category) { (dishArray) in
            self.dishList = dishArray
        }
    }
}
