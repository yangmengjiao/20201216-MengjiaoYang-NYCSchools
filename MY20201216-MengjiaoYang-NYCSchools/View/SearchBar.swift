//
//  SearchBar.swift
//  ToDoList
//
//  Created by Simon Ng on 15/4/2020.
//  Copyright © 2020 AppCoda. All rights reserved.
//

import SwiftUI

///Swiftui does  not have UISearchBar,
/// So customized a UISearchBar
struct SearchBar: View {
    @Binding var text: String

    @State private var isEditing = false
        
    var body: some View {
        HStack {
            
            TextField(Constant.hint, text: $text)
                .padding(Constant.padding)
                .padding(.horizontal, Constant.textFieldPading)
                .background(Color(.systemGray6))
                .cornerRadius(Constant.cornerRadius)
                .overlay(
                    HStack {
                        Image(systemName: Constant.ImageName.magnifyingGlass)
                            .foregroundColor(.gray)
                            .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                            .padding(.leading, Constant.padding)
                        
                        if isEditing {
                            Button(action: {
                                self.text = ""
                                
                            }) {
                                Image(systemName: Constant.ImageName.multiply)
                                    .foregroundColor(.gray)
                                    .padding(.trailing, Constant.padding)
                            }
                        }
                    }
                )
                .padding(.horizontal, Constant.padding)
                .onTapGesture {
                    self.isEditing = true
                }
            
            if isEditing {
                Button(action: {
                    self.isEditing = false
                    self.text = ""
                    
                    // Dismiss the keyboard
                    UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
                }) {
                    Text(Constant.cancel)
                }
                .padding(.trailing, Constant.padding)
                .transition(.move(edge: .trailing))
                .animation(.default)
            }
        }
    }
    
    struct Constant {
        static let hint = "Search ..."
        static let cancel = "Cancel"
        static let textFieldPading: CGFloat = 25
        static let padding: CGFloat = 10
        static let cornerRadius: CGFloat = 8
        
        struct ImageName {
            static let magnifyingGlass = "magnifyingglass"
            static let multiply = "multiply.circle.fill"
        }
        
        
    }
}

struct SearchBar_Previews: PreviewProvider {
    static var previews: some View {
        SearchBar(text: .constant(""))
    }
}
