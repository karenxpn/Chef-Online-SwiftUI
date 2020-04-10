//
//  ContentView.swift
//  ChefOnline
//
//  Created by Karen Mirakyan on 4/2/20.
//  Copyright © 2020 Karen Mirakyan. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    @State private var show: Bool = false
    
    var body: some View {
        
        NavigationView {
            CategoryList()
                .navigationBarItems(trailing: Button( action: showProfile ){
                    Image( systemName: "person.circle.fill")
                        .font(Font.system(.largeTitle))
                        .padding([.top], 10)
                })
                .sheet(isPresented: self.$show) {
                    Profile(isPresented: self.$show)
                }
        }
    }
    
    private func showProfile() {
        self.show = true
    }
}

struct CategoryList: View {
    
    var body: some View {
        
        List {
            ForEach(categoryList) { singleCategory in
                HStack {
                                        
                    NavigationLink(destination: SelectedCategory(selectedCategory: singleCategory.title)) {
                        Image( singleCategory.image )
                            .resizable()
                            .cornerRadius(18)
                            .frame(width: 190, height: 130, alignment: .center)
                            .aspectRatio(contentMode: .fill)

                        
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
