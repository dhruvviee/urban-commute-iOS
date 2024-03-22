//
//  SavedLocationRowView.swift
//  UrbanCommute
//
//  Created by Dhruv Sharma on 22/03/24.
//

import SwiftUI

struct SavedLocationRowView: View {
    let viewModel: SavedLocationViewModel
    var body: some View {
        HStack(spacing:12){
            Image(systemName: viewModel.imageName)
                .imageScale(.medium)
                .font(.title)
                .foregroundStyle(Color(.systemBlue))
        
            VStack(alignment: .leading, spacing: 4){
                Text(viewModel.title)
                    .font(.system(size: 15,weight: .semibold))
                    .foregroundStyle(Color.theme.primaryTextColor)
                
                Text(viewModel.subtitle)
                    .font(.system(size: 14))
                    .foregroundStyle(.gray)
            }
        }

    }
}

#Preview {
    SavedLocationRowView(viewModel: .home)
}
