//
//  LocationSearchView.swift
//  UrbanCommuteClone
//
//  Created by Dhruv Sharma on 16/02/24.
//

import SwiftUI

struct LocationSearchView: View {
    @State private var startLocationText = ""
    
    @EnvironmentObject var viewModel: LocationSearchViewModel
    
    var body: some View {
        VStack{
            //Header View
            HStack{
                VStack{
                    Circle()
                        .fill(Color(.systemGray3))
                        .frame(width: 6, height: 6)
                    
                    Rectangle()
                        .fill(Color(.systemGray3))
                        .frame(width: 1, height: 24)
                    
                    Rectangle()
                        .fill(.black)
                        .frame(width: 6, height: 6)
                } .padding(.top,60)
                VStack{
                    TextField("Current Location" , text: $startLocationText)
                        .frame(height: 32)
                        .background(Color(.systemGroupedBackground))
                        .padding(.trailing)
                        .padding(.top,60)
                    
                    TextField("Where To" , text: $viewModel.queryFragment)
                        .frame(height: 32)
                        .background(Color(.systemGray4))
                        .padding(.trailing)
                    
                }

            }
            .padding(.horizontal,17)
                .padding()
            
                        
            // List View
            
            LocationSearchResultsView(viewModel: viewModel, config: .ride)
            
        } 
        .background(Color.theme.backgroundColor)
        .background(.white)
            
    }
}

#Preview {
    LocationSearchView()
}


