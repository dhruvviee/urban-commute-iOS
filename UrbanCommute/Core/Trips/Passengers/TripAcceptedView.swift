//
//  TripAcceptedView.swift
//  UrbanCommute
//
//  Created by Dhruv Sharma on 29/03/24.
//

import SwiftUI

struct TripAcceptedView: View {
    @EnvironmentObject var viewModel: HomeViewModel
    var body: some View {
        VStack{
            Capsule()
                .foregroundStyle(Color(.systemGray5))
                .frame(width: 48,height: 6)
                .padding(.top,8)
            
            if let trip = viewModel.trip{
                // pickup info view
            VStack{
                HStack {
                    VStack(alignment: .leading){
                        Text("Meet your driver at \(trip.pickupLocationName)")
                        Text(" for your trip to \(trip.dropOffLocationName)")
                    }
                        .font(.body)
                        .frame(height: 44)
                        .lineLimit(2)
                    .padding(.trailing)
                    
                    Spacer()
                    
                    VStack{
                        Text("\(trip.travelTimeToPassenger)")
                            .bold()
                        Text("min")
                            .bold()
                    }
                    .frame(width: 56,height: 56)
                    .foregroundStyle(.white)
                    .background(Color(.systemBlue))
                    .clipShape(RoundedRectangle(cornerRadius: 10))
                }
                .padding()
                
                Divider()
            }
            // Driver info view
            VStack{
                HStack{
                    Image("profilephoto")
                        .resizable()
                        .scaledToFill()
                        .frame(width: 80,height: 80)
                        .clipShape(Circle())
                    
                    VStack(alignment: .leading, spacing: 4){
                        Text(trip.driverName)
                            .fontWeight(.bold)
                        HStack{
                            Image(systemName: "star.fill")
                                .foregroundStyle(Color(.systemYellow))
                                .imageScale(.small)
                            Text("4.8")
                                .font(.footnote)
                                .foregroundStyle(.gray)
                        }
                    }
                    Spacer()
                    
                    // Driver Vehicle info
                    VStack(alignment: .center){
                        Image("pool2")
                            .resizable()
                            .scaledToFill()
                            .frame(width: 120,height: 64)
                        
                        HStack{
                            Text("Swift Dzire")
                                .font(.system(size: 14, weight: .semibold))
                                .foregroundStyle(.gray)
                            Text("PB 10 A 2394")
                                .font(.system(size: 14,weight: .semibold))
                            
                        }
                        .frame(width: 160)
                        .padding(.bottom)
                    }
                }
                
                Divider()
            }
            .padding()
            }
          
            
            Button(action: {
                print("DEBUG: cancel trip")
            }, label: {
                Text("cancel trip".uppercased())
                    .font(.headline)
                    .fontWeight(.bold)
                   // .background(Color.blue)
                    .foregroundStyle(.white)
                    .frame(width: UIScreen.main.bounds.width - 32, height: 50)
                    .background(Color.red)
                    .clipShape(RoundedRectangle(cornerRadius: 12))
            })
                
        }
        .padding(.bottom,24)
        .background(Color.theme.backgroundColor)
        .clipShape(RoundedRectangle(cornerRadius: 16))
        .shadow(color: Color.theme.secondaryBackgroundColor, radius: 20)
    }
}

#Preview {
    TripAcceptedView()
}
