//
//  SavedLocationSearchView.swift
//  UrbanCommute
//
//  Created by Dhruv Sharma on 22/03/24.
//

import SwiftUI

struct SavedLocationSearchView: View {
    @State private var text = ""
    @StateObject var viewModel = LocationSearchViewModel()
    var body: some View {
        VStack{
            HStack(spacing: 16){
                Image(systemName: "arrow.left")
                    .font(.title2)
                    .imageScale(.medium)
                    .padding(.leading)
                
                TextField("Search for a location..", text: $viewModel.queryFragment)
                    .frame(height: 32)
                    .padding(.leading)
                    .background(Color(.systemGray5))
                    .padding(.trailing)
            }
            .padding(.top)
            Spacer()
            
            LocationSearchResultsView(viewModel: viewModel, config: .saveLocation)
        }
        .navigationTitle("Add Home")
    }
}

#Preview {
    NavigationStack{
        SavedLocationSearchView()
    }
}
