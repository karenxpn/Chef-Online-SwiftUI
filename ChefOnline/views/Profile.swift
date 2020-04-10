//
//  Profile.swift
//  ChefOnline
//
//  Created by Karen Mirakyan on 4/5/20.
//  Copyright © 2020 Karen Mirakyan. All rights reserved.
//

import SwiftUI

struct Profile: View {
    
    @Binding var isPresented: Bool
    @ObservedObject var profileVM = ProfileViewModel()
    
    var body: some View {
        
        NavigationView {
            
            ScrollView {
            
                VStack {
                    Image( "selectimage" )
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 200, height: 200)
                    
                    Picker("", selection: self.$profileVM.category) {
                        ForEach( categoryList ) { i in
                            Text( i.title ).tag( i.title )
                        }
                    }.pickerStyle(WheelPickerStyle())
                    .labelsHidden()
                    
                    
                    TextField("Write title here", text: self.$profileVM.dishTitle)
                    .padding()
                    
                    TextField( "Write recipe here", text: self.$profileVM.dishRecipe)
                    
                        .padding().lineLimit(nil)
                }
                
                .navigationBarItems(trailing: Button(action: {
                    
                    print("\(self.$profileVM.category)")
                    print(self.$profileVM.dishTitle)
                    print(self.$profileVM.dishRecipe)
                    
                    self.isPresented = false
                }) {
                    Text( "Save" )
                        .fontWeight(.medium)
                })
            }
        }

    }
}

struct Profile_Previews: PreviewProvider {
    static var previews: some View {
        Profile(isPresented: .constant(false))
    }
}
