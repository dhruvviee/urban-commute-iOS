//
//  LocationSearchResultCell.swift
//  UrbanCommuteClone
//
//  Created by Dhruv Sharma on 16/02/24.
//

import SwiftUI

struct LocationSearchResultCell: View {
    let title: String
    let subtitle: String
    var body: some View {
        HStack{
            Image(systemName: "mappin.circle.fill")
                .resizable()
                .foregroundStyle(.blue)
                .accentColor(.white)
                .frame(width: 40,height: 40)
            
            VStack(alignment: .leading, spacing: 4){
                Text(title)
                    .font(.body)
                    .fontWeight(.semibold)
                Text(subtitle)
                    .font(.system(size: 13))
                    .foregroundStyle(.gray)
                   
                Divider()
            }
            .padding(.leading, 8)
            .padding(.vertical, 2.5)
            
        }
        .padding(.leading)
    }
}

#Preview {
    LocationSearchResultCell(title: "Starbucks", subtitle: "Shop Number 5F,Ground Floor,Malhar Road,Sarabha Nagar,Ludhiana - 141001")
}
