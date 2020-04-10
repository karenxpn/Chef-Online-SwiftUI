//
//  FirebaseService.swift
//  ChefOnline
//
//  Created by Karen Mirakyan on 4/10/20.
//  Copyright © 2020 Karen Mirakyan. All rights reserved.
//

import Foundation
import Firebase

class FirebaseService: ObservableObject {
    

    func fetchData( category: String, completion: @escaping ([DishModel]) -> () ) {
        let firestoreDatabase = Firestore.firestore()
        firestoreDatabase.collection(category).addSnapshotListener { (snapshot, error) in
            if error != nil {
                DispatchQueue.main.async {
                    fatalError("Something went wrong")
                }
            } else {
                
                if snapshot?.isEmpty != true {
                    var dishes = [DishModel]()
                    
                    for document in snapshot!.documents {
                        if let image = document.get( "image" ) as? String {
                            if let title = document.get("title") as? String {
                                if let recipe = document.get("recipe") as? String {
                                    dishes.append(DishModel(title: title, recipe: recipe.replacingOccurrences(of: "  ", with: "\n"), image: image))
                                }
                            }
                        }
                    }
                    
                    DispatchQueue.main.async {
                        completion( dishes )
                    }
                }
            }
        }
    }
}
