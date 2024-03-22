//
//  SettingsView.swift
//  UrbanCommute
//
//  Created by Dhruv Sharma on 22/03/24.
//

import SwiftUI

struct SettingsView: View {
    @EnvironmentObject var viewModel: AuthViewModel
    private let user: User
    
    init(user: User) {
        self.user = user
    }
    
    var body: some View {
        VStack{
            List{
                Section{
                    // user info header
                    HStack{
                       Image("profilephoto")
                            .resizable()
                            .scaledToFill()
                            .clipShape(Circle())
                            .frame(width: 64,height: 64)
                        
                        VStack(alignment:.leading,spacing: 8){
                            Text(user.fullName)
                                .font(.system(size: 16,weight: .semibold))
                            Text(user.email)
                                .font(.system(size: 14))
                                .tint(Color.theme.primaryTextColor)
                                .opacity(0.77)
                        }
                        Spacer()
                        
                        Image(systemName: "chevron.right")
                            .imageScale(.small)
                            .font(.title2)
                            .foregroundStyle(.gray)
                    } .padding(8)
                }
                
                Section("Favorites") {
                    ForEach(SavedLocationViewModel.allCases) { viewModel in
                        NavigationLink{
                            SavedLocationSearchView()
                        }
                    label: {
                        SavedLocationRowView(viewModel: viewModel)
                    }
                }
                    
                    
                }
                
                Section("Settings") {
                    SettingsRowView(imageName: "bell.circle.fill", title: "Notifications", tintColor: Color(.systemPurple))
                    SettingsRowView(imageName: "creditcard.circle.fill", title: "Payments", tintColor: Color(.systemBlue))
                }
                
                Section("Account") {
                    SettingsRowView(imageName: "dollarsign.circle.fill", title: "Make money driving", tintColor: Color(.systemGreen))
                    SettingsRowView(imageName: "arrow.left.circle.fill", title: "Sign Out", tintColor: Color(.systemRed))
                        .onTapGesture {
                            viewModel.signOut()
                        }
                }
            }
        }
        .navigationTitle("Settings")
        .navigationBarTitleDisplayMode(.large)
    }
}

#Preview {
    NavigationStack{
        SettingsView(user: User(fullName: "John Doe", email: "johndoe@gmail.com", uid: "123456"))
    }
}
