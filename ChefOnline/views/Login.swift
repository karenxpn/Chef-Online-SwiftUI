//
//  Login.swift
//  ChefOnline
//
//  Created by Karen Mirakyan on 4/21/20.
//  Copyright © 2020 Karen Mirakyan. All rights reserved.
//

import SwiftUI

struct Login: View {
    
    @EnvironmentObject var profileViewModel: ProfileViewModel
    
    var body: some View {
        
        NavigationView {
            VStack( alignment: .leading) {
                
                Group{
                    Section(header: Text( "Էլեկտրոնային Հասցե" )) {
                        TextField("example@icloud.com", text: self.$profileViewModel.userEmail)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                            .padding([.leading, .trailing], 12)
                    }
                    
                    Section(header: Text( "Գաղտնաբառ" )) {
                        TextField( "123456", text: self.$profileViewModel.userPassword )
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                            .padding([.leading, .trailing], 12)
                    }
                }
                
                
                HStack {
                    Spacer()
                    Button(action: {
                        self.profileViewModel.loginUser()
                    }) {
                        Text( "Sign In" ).font(.system(size: 20))
                    }.alert(isPresented: self.$profileViewModel.response.error) {
                        Alert(title: Text( "Error occured" ), message: Text( self.profileViewModel.response.errorMessage), dismissButton: .default(Text( "OK")))
                    }
                    
                    Spacer()
                    Button(action: {
                        self.profileViewModel.registerUser()
                    }) {
                        Text( "Sign Up" ).font(.system(size: 20))
                    }.alert(isPresented: self.$profileViewModel.response.error) {
                        Alert(title: Text( "Error occured" ), message: Text( self.profileViewModel.response.errorMessage), dismissButton: .default(Text( "OK")))
                    }
                    
                    Spacer()
                }.padding()
                
                Spacer()
                
            }.padding()
                .navigationBarTitle(Text( "Բարի գալուստ"), displayMode: .inline)
        }
    }
}

struct Login_Previews: PreviewProvider {
    static var previews: some View {
        Login()
    }
}
