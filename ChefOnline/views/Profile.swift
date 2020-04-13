//
//  Profile.swift
//  ChefOnline
//
//  Created by Karen Mirakyan on 4/5/20.
//  Copyright © 2020 Karen Mirakyan. All rights reserved.
//

import SwiftUI
import Combine

struct Profile: View {
    
    //Keyboard
    @State var value: CGFloat = 0
    
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
                        .aspectRatio(contentMode: .fill)
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
                    
                    TextView(text: self.$profileVM.dishRecipe )
                        .frame(minWidth: 0, maxWidth: .infinity, minHeight: 500, maxHeight: .infinity)
                    
                                        
                }.offset( y: -self.value)
                    .animation(.spring())
                    .onAppear {
                        self.keyboardNotification()
                }
                    
                
                .navigationBarItems(trailing: Button(action: {
                    self.profileVM.dishImage = self.image
                    self.profileVM.saveDataToFirebase()
                    self.isPresented = false
                }) {
                    Text( "Save" )
                        .fontWeight(.medium)
                })
                
            }
            .onTapGesture {
                UIApplication.shared.endEditing()
            }
            .sheet(isPresented: self.$shown) {
                ImagePicker(shown: self.$shown, selectedImage: self.$image)
            }
        }
    }
    
    func keyboardNotification() {
        NotificationCenter.default.addObserver(forName: UIResponder.keyboardWillShowNotification, object: nil, queue: .main) { (notification) in
               
               let value = notification.userInfo![UIResponder.keyboardFrameEndUserInfoKey] as! CGRect
               let height = value.height
               
               self.value = height
           }
           
           NotificationCenter.default.addObserver(forName: UIResponder.keyboardWillHideNotification, object: nil, queue: .main) { (notification) in
               
               self.value = 0
           }
    }
}

struct Profile_Previews: PreviewProvider {
    static var previews: some View {
        Profile(isPresented: .constant(false))
    }
}

extension UIApplication {
    func endEditing() {
        sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}

