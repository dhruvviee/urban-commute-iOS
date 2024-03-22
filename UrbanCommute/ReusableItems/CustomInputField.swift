//
//  CustomInputField.swift
//  UrbanCommute
//
//  Created by Dhruv Sharma on 18/03/24.
//

import SwiftUI

struct CustomInputField: View {
    @Binding var text: String
    let title: String
    let placeholder: String
    var isSecureField = false
    
    var body: some View {
        VStack(alignment: .leading,spacing: 12){
            // title
            Text(title)
                .foregroundStyle(.white)
                .fontWeight(.semibold)
                .font(.footnote)
            // text field
            if isSecureField{
                SecureField(placeholder, text: $text)
                    .foregroundStyle(.white)
            }
            else{
                TextField(placeholder, text: $text)
                    .foregroundStyle(.white)
            }
           
            
            // divider
            Rectangle()
                .foregroundStyle(Color(UIColor(white: 1, alpha: 0.3)))
                .frame(width: UIScreen.main.bounds.width-32,height: 0.7)
        }    }
}

#Preview {
    CustomInputField(text: .constant(""), title: "Email", placeholder: "name@example.com")
}
