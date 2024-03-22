//
//  RegistrationView.swift
//  UrbanCommute
//
//  Created by Dhruv Sharma on 18/03/24.
//

import SwiftUI

struct RegistrationView: View {
    @State private var fullname = ""
    @State private var email = ""
    @State private var password = ""
    @Environment (\.dismiss) private var dismiss
    @EnvironmentObject var viewModel: AuthViewModel
    var body: some View {
        ZStack{
            Color.black
                .ignoresSafeArea()
            
            VStack(alignment: .leading,spacing: 20){
                Button(action: {
                    dismiss()
                }, label: {
                    Image(systemName: "arrow.left")
                        .font(.title)
                        .imageScale(.medium)
                        .padding()
                       
                })
                Text("Create new account")
                    .font(.system(size: 40))
                    .fontWeight(.semibold)
                    .multilineTextAlignment(.leading)
                    .frame(width: 250)
                
                Spacer()
                VStack{
                    VStack(spacing: 56){
                        CustomInputField(text: $fullname, title: "Full Name", placeholder: "Enter your name")
                        CustomInputField(text: $email, title: "Email Address", placeholder: "name@example.com")
                        CustomInputField(text: $password, title: "Password", placeholder: "Enter your password", isSecureField: true)
                    }
                    .padding(.leading)
                    Spacer()
                    Button(action: {
                        viewModel.registerUser(withEmail: email, password: password,fullname: fullname)
                    }, label: {
                        HStack{
                            Text("SIGN UP")
                                .foregroundStyle(.black)
                            Image(systemName: "arrow.right")
                                .foregroundStyle(.black)
                        } .frame(width: UIScreen.main.bounds.width-32,height: 50)
                    })
                   
                    .background(.white)
                    .clipShape(RoundedRectangle(cornerRadius: 10))
                    
                    Spacer()
                }
                
                
            } .foregroundStyle(.white)
        }
    }
}

#Preview {
    RegistrationView()
}
