//
//  AcceptTripView.swift
//  UrbanCommute
//
//  Created by Dhruv Sharma on 26/03/24.
//

import SwiftUI
import MapKit

struct AcceptTripView: View {
    @State private var region: MKCoordinateRegion
    let trip: Trip
    let annotationItem: UrbanCommuteLocation
    @EnvironmentObject var viewModel: HomeViewModel
    
    init(trip: Trip) {
        let center = CLLocationCoordinate2D(latitude: trip.pickupLocation.latitude, longitude: trip.pickupLocation.longitude)
        let span = MKCoordinateSpan(latitudeDelta: 0.025, longitudeDelta: 0.025)
        self.region = MKCoordinateRegion(center: center, span: span)
        self.trip = trip
        self.annotationItem = UrbanCommuteLocation(title: trip.pickupLocationName, coordinate: trip.pickupLocation.toCoordinate())
    }
    var body: some View {
        VStack{
            Capsule()
                .foregroundStyle(Color(.systemGray5))
                .frame(width: 48,height: 6)
               // .padding(.bottom,20)
                .padding(.top,8)
            // would you like to pickup view
            VStack{
                HStack{
                    Text("Would you like to pickup?")
                        .font(.headline)
                        .fontWeight(.semibold)
                        .lineLimit(2)
                        .multilineTextAlignment(.leading)
                        .frame(height: 44)
                    
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
            
            // user info view
            VStack{
                HStack{
                    Image("profilephoto")
                        .resizable()
                        .scaledToFill()
                        .frame(width: 80,height: 80)
                        .clipShape(Circle())
                    
                    VStack(alignment: .leading, spacing: 4){
                        Text(trip.passengerName)
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
                    
                    VStack(spacing: 6){
                        Text("Earnings")
                        
                        Text(trip.tripCost.toCurrency())
                            .font(.system(size: 24,weight: .semibold))
                    }
                }
                
                Divider()
            }
            .padding()
            // pickup location info view
            VStack{
                // trip loaction info
                HStack{
                    // address info
                    VStack(alignment: .leading,spacing: 6){
                        Text(trip.pickupLocationName)
                            .font(.headline)
                        Text(trip.pickupLocationAddress)
                            .font(.subheadline)
                            .foregroundStyle(.gray)
                    }
                    
                    Spacer()
                    // distance
                    VStack{
                        Text(trip.distanceToPassenger.distanceinKMString())
                            .font(.headline)
                            .fontWeight(.semibold)
                        
                        Text("km")
                            .font(.subheadline)
                            .foregroundStyle(.gray)

                    }
                }
                .padding(.horizontal)
                
                // map
                Map(coordinateRegion: $region, annotationItems: [annotationItem]) { item in
                    MapMarker(coordinate: item.coordinate)
                }
                    .frame(height: 220)
                    .clipShape(RoundedRectangle(cornerRadius: 10))
                    .shadow(color: .black.opacity(0.6), radius: 10)
                    .padding()
                
                // divider
                
                Divider()
            }
            
            // action buttons
            
            HStack{
                Button(action: {
                    viewModel.rejectTrip()
                }, label: {
                    Text("Reject")
                        .font(.headline)
                        .fontWeight(.bold)
                        .padding()
                        .frame(width: (UIScreen.main.bounds.width / 2) - 32, height: 56)
                        .background(Color(.systemRed))
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                        .foregroundStyle(.white)
                })
               
                Spacer()
                Button(action: {
                    viewModel.acceptTrip()
                }, label: {
                    Text("Accept")
                        .font(.headline)
                        .fontWeight(.bold)
                        .padding()
                        .frame(width: (UIScreen.main.bounds.width / 2) - 32, height: 56)
                        .background(Color(.systemBlue))
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                        .foregroundStyle(.white)
                })
            }
            .padding(.top)
            .padding(.horizontal)
            .padding(.bottom, 24)
        }
        .background(Color.theme.backgroundColor)
        .clipShape(RoundedRectangle(cornerRadius: 16))
        .shadow(color: Color.theme.secondaryBackgroundColor, radius: 20)
    }
}

