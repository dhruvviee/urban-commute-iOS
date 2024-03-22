//
//  AuthViewModel.swift
//  UrbanCommute
//
//  Created by Dhruv Sharma on 18/03/24.
//

import Foundation
import Firebase
import FirebaseFirestoreSwift

class AuthViewModel: ObservableObject,Observable {
    @Published var userSession: FirebaseAuth.User?
    @Published var currentUser: User?
    
    init() {
        userSession = Auth.auth().currentUser
        fetchUser()
    }
    
    func signIn(withEmail email: String,password: String){
        Auth.auth().signIn(withEmail: email, password: password) { result, error in
            if let error = error{
                print("DEBUG: Failed to sign in with error\(error.localizedDescription)")
                return
            }
//
//            print("DEBUG: Sign user in succesfully")
//            print("DEBUG: User id \(result?.user.uid)")
            
            self.userSession = result?.user
        }
    }
    
    func registerUser(withEmail email: String, password: String, fullname: String){
        Auth.auth().createUser(withEmail: email, password: password) { result, error in
            if let error = error{
                print("DEBUG: Failed to sign up with error\(error.localizedDescription)")
                return
            }
            guard let firebaseUser = result?.user else {return}
            self.userSession = firebaseUser
            
            let user = User(fullName: fullname, email: email, uid: firebaseUser.uid)
            guard let encodedUser = try? Firestore.Encoder().encode(user) else{ return }
            
//            let data: [String: Any] = [
//                "fullname": fullname,
//                "email": email,
//                "uid": firebaseUser.uid
//            ]
            Firestore.firestore().collection("users").document(firebaseUser.uid).setData(encodedUser)
        }
    }
    
    func signOut() {
       
        do{
            try Auth.auth().signOut()
//            print("DEBUG: Did sign out with firebase")
            self.userSession = nil
        }
        catch let error{
            print("DEBUG: Failed to sign out with error: \(error.localizedDescription)")
        }
    }
    
    func fetchUser() {
        guard let uid = Auth.auth().currentUser?.uid else{ return }
        Firestore.firestore().collection("users").document(uid).getDocument { snapshot, _ in
            guard let data = snapshot?.data() else { return }
            // in the below statement i have added another ? after snapshot
            guard let user = try? snapshot?.data(as: User.self) else {return}
            
//            print("DEBUG: User is \(user.fullName)")
            self.currentUser = user
        }
    }
    
}
