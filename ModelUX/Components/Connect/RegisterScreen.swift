//
//  RegisterScreen.swift
//  ModelUX
//
//  Created by Yasas Hansaka Thenuwara on 2024-12-22.
//
import SwiftUI

struct RegisterScreen: View {
    @State private var email: String = ""
    @State private var name: String = ""
    @State private var password: String = ""
    @State private var confirmPassword: String = ""
    @State private var errorMessage: String?
    @State private var isLoading: Bool = false
    
    func register() {
        isLoading = true
        guard !email.isEmpty, !password.isEmpty else {
            errorMessage = "Please enter email and password."
            isLoading = false
            return
        }

        isLoading = false
        errorMessage = nil
        
        // Todo - implement the logic
    }
    

      var body: some View {
          VStack {
              Spacer()
              HStack {
                  VStack(alignment: .leading) {
                      Text("Register")
                          .font(.title)
                      Text ("Sign up for a new account")
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
              
              TextField("Name", text: $name)
                  .padding()
                  .background(Color.gray.opacity(0.2))
                  .cornerRadius(8)

              SecureField("Password", text: $password)
                  .padding()
                  .background(Color.gray.opacity(0.2))
                  .cornerRadius(8)

              SecureField("Confirm Password", text: $confirmPassword)
                    .padding()
                    .background(Color.gray.opacity(0.2))
                    .cornerRadius(8)
              

              Button(action: register) {
                  if isLoading {
                      ProgressView()
                  } else {
                      Text("Register")
                          .frame(maxWidth: .infinity)
                          .padding()
                          .background(Color.blue)
                          .foregroundColor(.white)
                          .cornerRadius(8)
                  }
              }
              .padding(.top)
              
              HStack {
                  Text("Already have an Account?")
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
    RegisterScreen()
}

