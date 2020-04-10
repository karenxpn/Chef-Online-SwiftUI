//
//  DishModelFirebase.swift
//  ChefOnline
//
//  Created by Karen Mirakyan on 4/10/20.
//  Copyright © 2020 Karen Mirakyan. All rights reserved.
//

import Foundation
import SwiftUI

struct DishModelFirebase: Identifiable {
    var id = UUID()
    var title: String
    var recipe: String
    var image: UIImage?
}
