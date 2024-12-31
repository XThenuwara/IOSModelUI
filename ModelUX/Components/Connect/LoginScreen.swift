//
//  LoginScreen.swift
//  ModelUX
//
//  Created by Yasas Hansaka Thenuwara on 2024-12-22.
//
import SwiftUI


struct LoginScreen: View {
    @State private var email: String = ""
    @State private var password: String = ""
    @State private var errorMessage: String?
    @State private var isLoading: Bool = false
    
    func login() {
        isLoading = true
        guard !email.isEmpty, !password.isEmpty else {
            errorMessage = "Please enter email and password."
            isLoading = false
            return
        }

        isLoading = false
        errorMessage = nil
        
        // TODO - Implement the logic
    }
    

      var body: some View {
          VStack {
              Spacer()
              HStack {
                  VStack(alignment: .leading) {
                      Text("Login")
                          .font(.title)
                      Text ("Sign in to your account")
                          .foregroundColor(Color.gray)
                  }
                  Spacer()
              }
             
              
              TextField("Email", text: $email)
                  .keyboardType(.emailAddress)
                  .autocapitalization(.none)
                  .padding()
                  .background(Color.gray.opacity(0.2))
                  .cornerRadius(8)

              SecureField("Password", text: $password)
                  .padding()
                  .background(Color.gray.opacity(0.2))
                  .cornerRadius(8)


              Button(action: login) {
                  if isLoading {
                      ProgressView()
                  } else {
                      Text("Login")
                          .frame(maxWidth: .infinity)
                          .padding()
                          .background(Color.black.opacity(0.8))
                          .foregroundColor(.white)
                          .cornerRadius(8)
                  }
              }
              .padding(.top)
              
              HStack {
                  Text("Dont have an Account? ")
                      .foregroundColor(Color.blue)
                      .font(.footnote)
                      .padding()
              }

              Spacer()
          }
          .padding()
      }
}


#Preview {
    LoginScreen()
}
