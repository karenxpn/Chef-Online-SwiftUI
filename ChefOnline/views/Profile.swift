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
    
    var body: some View {
        
        Button(action: {
            self.isPresented = false
        }) {
            Text( "Button" )
        }
    }
}

struct Profile_Previews: PreviewProvider {
    static var previews: some View {
        Profile(isPresented: .constant(false))
    }
}
