//
//  SettingsRowView.swift
//  UrbanCommute
//
//  Created by Dhruv Sharma on 22/03/24.
//

import SwiftUI

struct SettingsRowView: View {
    let imageName: String
    let title: String
    let tintColor: Color
    var body: some View {
        HStack(spacing:12){
            Image(systemName: imageName)
                .imageScale(.medium)
                .font(.title)
                .foregroundStyle(tintColor)
        
           
                Text(title)
                .font(.system(size: 15,weight: .medium))
                    .foregroundStyle(Color.theme.primaryTextColor)
           
        } .padding(4)
    }
}

#Preview {
    SettingsRowView(imageName: "bell.circle.fill", title: "Notifications", tintColor: Color(.systemPurple))
}
