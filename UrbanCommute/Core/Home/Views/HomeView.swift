//
//  HomeView.swift
//  UrbanCommuteClone
//
//  Created by Dhruv Sharma on 14/01/24.
//

import SwiftUI

struct HomeView: View {
    
    @State private var mapState = MapViewState.noInput
    @State private var showSideMenu = false
    @EnvironmentObject var locationViewModel: LocationSearchViewModel
    @EnvironmentObject var authViewModel: AuthViewModel
    var body: some View {
        Group {
            if authViewModel.userSession == nil {
                LoginView()
            }
            else if let user = authViewModel.currentUser{
                NavigationStack {
                    ZStack{
                        if showSideMenu{
                            SideMenuView(user: user)
                             
                        }
                        
                        mapView
                            .offset(x: showSideMenu ? 316 : 0)
                            .shadow(color: showSideMenu ? .black : .clear,
                                    radius: 10)
                    } .onAppear(perform: {
                        showSideMenu = false
                    })
                }
               
               
         }
            
        }
    }
}

extension HomeView{
    var mapView: some View{
        ZStack(alignment: .bottom) {
            ZStack(alignment: .top){
                UrbanCommuteMapViewRepresentable(mapState: $mapState)
                    .ignoresSafeArea()
                
                if mapState == .searchingForLocation {
                    LocationSearchView()
                    
                } else if mapState == .noInput {
                    LocationSearchActivationView()
                        .padding(.top , 80)
                        .onTapGesture {
                            withAnimation(.spring()){
                                mapState = .searchingForLocation
                            }
                            
                        }
                }
                
                MapViewActionButton(mapState: $mapState,showSideMenu: $showSideMenu)
                        .padding(.leading)
                        .padding(.top,4)
                
            }
            if mapState == .locationSelected || mapState == .polylineAdded {
               RideRequestView()
                    .transition(.move(edge: .bottom))
            }
        }
        .ignoresSafeArea(edges: .bottom)
        .onReceive(LocationManager.shared.$userLocation) { location in
            if let location = location{
                locationViewModel.userLocation = location
            }
        }
        .onReceive(locationViewModel.$selectedUrbanCommuteLocation){ location in
            if location != nil{
                self.mapState = .locationSelected
            }
        }
    }
}



#Preview {
    HomeView()
        .environment(AuthViewModel())
    
}
