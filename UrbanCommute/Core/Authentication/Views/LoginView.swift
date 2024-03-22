//
//  LoginView.swift
//  UrbanCommute
//
//  Created by Dhruv Sharma on 18/03/24.
//

import SwiftUI

struct LoginView: View {
    @State var email = ""
    @State var password = ""
    @EnvironmentObject var viewModel: AuthViewModel
    
    var body: some View {
        NavigationStack {
            ZStack{
                Color.black
                    .ignoresSafeArea()
                
                VStack{
                    // image and title
                    
                    VStack{
                        // image
                        Image("ucfinal")
                            .resizable()
                            .frame(width: 200,height: 200)
                        
                        // text
                        Text("Urban Commute".uppercased())
                            .foregroundStyle(.white)
                            .font(.largeTitle)
                            .fontWeight(.semibold)
                            .padding(.bottom,25)
                    }
                    
                    // input fields
                    
                    VStack(spacing: 32){
                        // input field 1
                        
                        CustomInputField(text: $email, title: "Email Address", placeholder: "name@example.com")
                        //input field 2
                        CustomInputField(text: $password, title: "Password", placeholder: "Enter your password",isSecureField: true)
                        Button(action: {
                            
                        }, label: {
                            Text("Forgot Password?")
                                .font(.system(size: 13,weight: .semibold))
                                .foregroundStyle(.white)
                                .padding(.top)
                                
                        }) .frame(maxWidth: .infinity,alignment: .trailing)
                        
                    }
                    .padding(.horizontal)
                    .padding(.top,12)
                    
                    // social signin view
                    VStack{
                        // dividers + text
                        HStack(spacing:24){
                            Rectangle()
                                .frame(width: 76,height: 1)
                                .foregroundStyle(.white)
                                .opacity(0.5)
                            
                            Text("Sign in with Social")
                                .foregroundStyle(.white)
                                .fontWeight(.semibold)
                            
                            Rectangle()
                                .frame(width: 76,height: 1)
                                .foregroundStyle(.white)
                                .opacity(0.5)
                        }
                        // sign up buttons
                        HStack(spacing: 24){
                            Button(action: {
                                
                            }, label: {
                                Image("fbicon")
                                    .resizable()
                                    .frame(width: 44,height: 44)
                            })
                            Button(action: {
                                
                            }, label: {
                                Image("googleicon")
                                    .resizable()
                                    .frame(width: 44,height: 44)
                            })
                            
                        }
                    } .padding(.vertical)
                    
                    Spacer()
                    
                    // sign in button
                    Button(action: {
                        viewModel.signIn(withEmail: email, password: password)
                    }, label: {
                        HStack{
                            Text("SIGN IN")
                                .foregroundStyle(.black)
                            Image(systemName: "arrow.right")
                                .foregroundStyle(.black)
                        } .frame(width: UIScreen.main.bounds.width-32,height: 50)
                    })
                    
                    .background(.white)
                    .clipShape(RoundedRectangle(cornerRadius: 10))
                    
                    // signup button
                    Spacer()
                    
                    NavigationLink {
                        RegistrationView()
                            .navigationBarBackButtonHidden(true)
                    } label: {
                        HStack{
                            Text("Don't have an account?")
                                .font(.system(size: 14))
                            Text("Sign Up")
                                .font(.system(size: 14,weight: .semibold))
                        }
                        .foregroundStyle(.white)
                    }
                }
            }
        }
    }
}

#Preview {
    LoginView()
}
