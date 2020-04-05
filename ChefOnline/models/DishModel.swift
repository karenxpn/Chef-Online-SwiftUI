//
//  DishModel.swift
//  ChefOnline
//
//  Created by Karen Mirakyan on 4/2/20.
//  Copyright © 2020 Karen Mirakyan. All rights reserved.
//

import Foundation

struct DishModel: Identifiable {
    var id = UUID()
    var title: String
    var recipe: String
    var image: String
}
