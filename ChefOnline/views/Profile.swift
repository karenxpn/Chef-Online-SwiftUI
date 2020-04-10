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
    @State var shown: Bool = false
    @State var image: UIImage = UIImage(named: "selectimage")!
    
    var body: some View {
        
        NavigationView {
            
            ScrollView {
            
                VStack {
                    Image(uiImage: self.image)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 200, height: 200)
                        .onTapGesture {
                            self.shown.toggle()
                        }
                    
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
                    self.profileVM.dishImage = self.image
                    self.profileVM.saveDataToFirebase()
                    self.isPresented = false
                }) {
                    Text( "Save" )
                        .fontWeight(.medium)
                })
            }.sheet(isPresented: self.$shown) {
                ImagePicker(shown: self.$shown, selectedImage: self.$image)
            }
        }

    }
}

struct Profile_Previews: PreviewProvider {
    static var previews: some View {
        Profile(isPresented: .constant(false))
    }
}
