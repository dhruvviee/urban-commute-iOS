//
//  MapViewActionButton.swift
//  UrbanCommuteClone
//
//  Created by Dhruv Sharma on 16/02/24.
//

import SwiftUI

struct MapViewActionButton: View {
    @Binding var mapState: MapViewState
    @Binding var showSideMenu: Bool
    @EnvironmentObject var viewModel: LocationSearchViewModel
    @EnvironmentObject var authViewModel: AuthViewModel
    //.c@State private var
    var body: some View {
        Button {
            withAnimation(.spring()){
               actionForState(mapState)
            }
        } label: {
            Image(systemName: imageNameForState(mapState))
                .font(.title2)
                .foregroundStyle(.black)
                .padding()
                .background(.white)
                .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
                .shadow(color: .black, radius: 6)
        }
        .frame(maxWidth: .infinity , alignment: .leading)
        .padding(3)

    }
    
    func actionForState(_ state: MapViewState) {
        switch state{
        case .noInput:
            showSideMenu.toggle()
//            authViewModel.signOut()
            
        case .searchingForLocation:
            mapState = .noInput
            
        case .locationSelected, .polylineAdded:
            mapState = .noInput
            viewModel.selectedUrbanCommuteLocation = nil
        }
    }
    
    func imageNameForState(_ state: MapViewState) -> String{
        switch state{
        case .noInput:
            return "line.3.horizontal"
            
        case .searchingForLocation, .locationSelected, .polylineAdded:
            return "arrow.left"
        
//        default:
//            return "line.3.horizontal"
        }
    }
}

#Preview {
    MapViewActionButton(mapState: .constant(.noInput), showSideMenu: .constant(false) )
}
