//
//  ContentView.swift
//  20201215-MengjiaoYang-NYCSchools
//
//  Created by mengjiao on 12/16/20.
//

import SwiftUI

struct SchoolListView: View {
    // search text for search bar
    @State private var searchText = ""
    
    // view model
    @ObservedObject var viewModel = SchoolListViewModel()
    
    var body: some View {
        NavigationView {
            ZStack {
                VStack {
                    // search bar view
                    SearchBar(text: $searchText)
                        .padding(.top)
                    
                    // school list, filtered by searchText
                    let filteredList = viewModel.schools.filter({ searchText.isEmpty ? true : $0.schoolName.contains(searchText)})
                    
                    List(filteredList, id: \.self) { school in
                        VStack(alignment: .leading) {
                            // navigation to school detail view
                            NavigationLink(destination: SchoolDetailView(school: school)) {
                    
                                Text(school.schoolName)
                            }
                        }
                    }
                    
                }
                // show indicator while loading data.hide indicator when finished
                ActivityIndicator(shouldAnimate: viewModel.shouldShowIndicator)
            }
            .navigationBarTitle(Constant.NavigationTitle.schoolList, displayMode: .inline)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        SchoolListView()
    }
}

