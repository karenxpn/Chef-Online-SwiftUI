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
        
        VStack( alignment: .leading) {
            
            Text( "Email here" ).padding([.leading, .top, .trailing], 12)
            TextField("example@icloud.com", text: self.$profileViewModel.userEmail).padding()
            
            Text( "Password" ).padding([.leading, .top, .trailing], 12)
            TextField( "123456", text: self.$profileViewModel.userPassword ).padding()
            
            
            HStack {
                Spacer()
                Button(action: {
                    self.profileViewModel.loginUser()
                }) {
                    Text( "Sign In" ).font(.system(size: 20))
                }
                
                Spacer()
                Button(action: {
                    self.profileViewModel.registerUser()
                }) {
                    Text( "Sign Up" ).font(.system(size: 20))
                }
                Spacer()
            }
            
            Spacer()
            
            
        }
    }
}

struct Login_Previews: PreviewProvider {
    static var previews: some View {
        Login()
    }
}
