//
//  RideRequestView.swift
//  UrbanCommute
//
//  Created by Dhruv Sharma on 27/02/24.
//

import SwiftUI

struct RideRequestView: View {
    @State private var selectedRideType: RideType = .ucAuto
    @EnvironmentObject var locationViewModel: LocationSearchViewModel
    var body: some View {
        VStack{
            Capsule()
                .foregroundStyle(Color(.systemGray5))
                .frame(width: 48,height: 6)
                .padding(.bottom,20)
                .padding(.top,8)
            
            // trip info view
            HStack {
                VStack{
                    Circle()
                        .fill(Color(.systemGray3))
                        .frame(width: 8, height: 8)
                    
                    Rectangle()
                        .fill(Color(.systemGray3))
                        .frame(width: 1, height: 32)
                    
                    Rectangle()
                        .fill(.black)
                        .frame(width: 8, height: 8)
                }.padding(.leading)
                
                VStack(spacing:20){
                    HStack{
                        Text("Current Location")
                            .font(.system(size: 16,weight: .semibold))
                            .foregroundStyle(.gray)
                        Spacer()
                        
                        Text(locationViewModel.pickUpTime ?? " ")
                            .font(.system(size: 14,weight: .semibold))
                            .foregroundStyle(.gray)
                        
                    }
                    .padding(.horizontal)
                    .padding(.bottom,10)
                    
                    HStack{
                        if let location = locationViewModel.selectedUrbanCommuteLocation{
                            Text(location.title)
                                .font(.system(size: 16,weight: .semibold))
                        }
                            
                        Spacer()
                        
                        Text(locationViewModel.dropUpTime ?? "")
                            .font(.system(size: 14,weight: .semibold))
                            .foregroundStyle(.gray)
                            
                        
                    }
                    .padding(.horizontal)
                    
                    
                }
            } .padding(2)
            
            Divider()
            
            // ride type selection view
            
            Text("suggested rides".uppercased())
                .font(.subheadline)
                .fontWeight(.semibold)
                .padding()
                .foregroundStyle(.gray)
                .frame(maxWidth: .infinity,alignment: .leading)
            
            ScrollView(.horizontal){
                HStack(spacing:12){
                    ForEach(RideType.allCases) { type in
                        VStack(alignment:.leading){
                            Image(type.imageName)
                                .resizable()
                                .scaledToFit()
                                .padding(.top,9)
                            
                            VStack(alignment: .leading,spacing: 4){
                                Text(type.description)
                                    .font(.system(size: 14,weight: .bold))
                                
                                Text(locationViewModel.computeRidePrice(forType: type).toCurrency())
                                    .font(.system(size: 14,weight: .bold))
                            } .padding()
                            
                        }
                        .frame(width: 112,height: 140)
                        .foregroundStyle(type == selectedRideType ? Color.white : Color.theme.primaryTextColor)
//                        .background(Color(type == selectedRideType ? .systemBlue : .systemGroupedBackground))
//                        .background(Color(type == selectedRideType ? Color.blue.opacity(0.9) : Color(UIColor.systemGroupedBackground)))
                        .background(type == selectedRideType ? .blue : Color.theme.secondaryBackgroundColor)
                        .scaleEffect(type == selectedRideType ? 1.1 : 1.0)
                        .clipShape(RoundedRectangle(cornerRadius: 10))
//                        .cornerRadius(10)
                        .onTapGesture {
                            withAnimation(.spring()) {
                               selectedRideType = type
                            }
                        }
                       //RoundedRectangle(cornerRadius: 10)
                            
                    }
                }
            } .padding(.horizontal)
            
            Divider()
                .padding(.vertical,8)
            // payment option view
            
            HStack(spacing: 12){
    
                Text("Cash")
                    .font(.headline)
                    .fontWeight(.bold)
                    .padding(6)
                    .foregroundStyle(.white)
                    .frame(width: 70,height: 45)
                    .background(Color.blue)
                    .clipShape(RoundedRectangle(cornerRadius: 9))
                    .padding(.horizontal,15)
                    
                Spacer()
               Image(systemName: "chevron.right")
                    .imageScale(.medium)
                    .padding()
                
            } .frame(height: 50)
                .background(Color.theme.secondaryBackgroundColor)
                .clipShape(RoundedRectangle(cornerRadius: 18))
                .padding(.bottom,8)
               
            
            // request ride button
            Button(action: {
                
            }, label: {
                Text("confirm ride".uppercased())
                    .font(.headline)
                    .fontWeight(.bold)
                   // .background(Color.blue)
                    .foregroundStyle(.white)
                    .frame(width: UIScreen.main.bounds.width - 32, height: 50)
                    .background(Color.blue)
                    .clipShape(RoundedRectangle(cornerRadius: 12))
            })
            
                
            
            
            
            
            
        }
        .padding(.bottom, 24)
        .background(Color.theme.backgroundColor)
        .clipShape(RoundedRectangle(cornerRadius: 16))
    }
}

#Preview {
    RideRequestView()
}
