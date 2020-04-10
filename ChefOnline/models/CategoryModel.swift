//
//  CategoryModel.swift
//  ChefOnline
//
//  Created by Karen Mirakyan on 4/2/20.
//  Copyright © 2020 Karen Mirakyan. All rights reserved.
//

import Foundation
import SwiftUI

struct CategoryModel: Identifiable {
    var id = UUID()
    var title: String
    var image: String
}


let categoryList = [CategoryModel(title: "Աղանդեր", image: "desserts"),
                    CategoryModel(title: "Թխվածքներ", image: "cookies"),
                    CategoryModel(title: "Աղցաններ", image: "salads"),
                    CategoryModel(title: "Ուտեստներ", image: "dishes"),
                    CategoryModel(title: "Ապուրներ", image: "soups")]
