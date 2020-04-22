//
//  FirebaseService.swift
//  ChefOnline
//
//  Created by Karen Mirakyan on 4/10/20.
//  Copyright © 2020 Karen Mirakyan. All rights reserved.
//

import Foundation
import Firebase

class FirebaseService {
    
    func postData( category: String, dish: DishModelFirebase) {
        
        //------------Storage----------
        
        
        let storage = Storage.storage()
        let storageReference = storage.reference()
        
        let mediaFolder = storageReference.child("uploaded")

        
        if let data = dish.image?.jpegData(compressionQuality: 0.6) {
            let uuid = UUID().uuidString
                        
            let imageReference = mediaFolder.child("\(uuid).jpg")
            imageReference.putData(data, metadata: nil) { ( metadata, error ) in
                if error != nil {
                    print(error?.localizedDescription ?? "Error")
                } else {
                    
                    imageReference.downloadURL { (url, error) in
                        if error == nil {
                            let imageUrl = url?.absoluteString

                            let dictionary = ["image": imageUrl,
                                              "title": dish.title,
                                              "recipe": dish.recipe] as [String : Any]
                            
                            //Firestore
                            let firebaseDatabse = Firestore.firestore()
                            
                            firebaseDatabse.collection(category).addDocument(data: dictionary , completion: { error in
                                if error != nil {
                                    print(error?.localizedDescription ?? "Error" )
                                }
                            })
                        }
                    }
                }
            }
            
        }

        
        

    }

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
    
    func loginUser(email: String, password: String, completion: @escaping( Response? ) -> () ) {
        
        Auth.auth().signIn(withEmail: email, password: password) { (result, error) in
            if error != nil {
                DispatchQueue.main.async {
                    completion( Response(error: true, errorMessage: error?.localizedDescription ?? "Error") )
                }
                return
            }
            
            else {
                DispatchQueue.main.async {
                    completion( Response(error: false, errorMessage: "") )
                }
            }
        }
    }
    
    func signUp( email: String, password: String, completion: @escaping( Response? ) -> () ) {
        Auth.auth().createUser(withEmail: email, password: password) { (result, error) in
            if error != nil {
                DispatchQueue.main.async {
                    completion( Response(error: true, errorMessage: error?.localizedDescription ?? "Error") )
                }
                return
            }
            
            else {
                DispatchQueue.main.async {
                    completion( Response(error: false, errorMessage: "") )
                }
            }
        }
    }
}
