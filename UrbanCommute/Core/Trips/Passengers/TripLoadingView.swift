//
//  TripLoadingView.swift
//  UrbanCommute
//
//  Created by Dhruv Sharma on 29/03/24.
//

import SwiftUI

struct TripLoadingView: View {
    var body: some View {
        VStack{
            Capsule()
                .foregroundStyle(Color(.systemGray5))
                .frame(width: 48,height: 6)
                .padding(.top,8)
            HStack {
                    Text("Connecting you to a driver")
                        .font(.headline)
               .padding()
                Spacer()
                
                Spinner(lineWidth: 6, height: 64, width: 64)
                    .padding()
            }
            
            .padding(.bottom,24)
        }
        .background(Color.theme.backgroundColor)
        .clipShape(RoundedRectangle(cornerRadius: 16))
        .shadow(color: Color.theme.secondaryBackgroundColor, radius: 20)
    }
}

#Preview {
    TripLoadingView()
}
