//
//  ContentView.swift
//  ChefOnline
//
//  Created by Karen Mirakyan on 4/2/20.
//  Copyright © 2020 Karen Mirakyan. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        
        NavigationView {
            CategoryList()
        }
    }
}

struct CategoryList: View {
    var body: some View {
        
        List {
            ForEach(categoryList) { singleCategory in
                HStack {
                    
                    NavigationLink(destination: SelectedCategory()) {
                        
                        Image( singleCategory.image )
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 190, height: 130, alignment: .center)
                            .cornerRadius(18)
                        
                        Text(singleCategory.title)
                            .font(.system(size: 20))
                            .foregroundColor(.gray)
                    }
                    
                }
            }
        }.navigationBarTitle(Text( "Chef Online" ))
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
