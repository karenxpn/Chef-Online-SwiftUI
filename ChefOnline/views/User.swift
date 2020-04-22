//
//  User.swift
//  ChefOnline
//
//  Created by Karen Mirakyan on 4/21/20.
//  Copyright © 2020 Karen Mirakyan. All rights reserved.
//

import SwiftUI
import Firebase

struct User: View {
    
    @Binding var isPresented: Bool
    @EnvironmentObject var profileViewModel : ProfileViewModel
    
    var body: some View {
        ZStack {
            if Auth.auth().currentUser != nil {
                Profile( isPresented: self.$isPresented )
            } else if self.profileViewModel.userIsLoggedIn == true {
                Profile(isPresented: self.$isPresented)
            }else {
                Login()
            }
        }
    }
}

struct User_Previews: PreviewProvider {
    static var previews: some View {
        User(isPresented: .constant(false))
    }
}
