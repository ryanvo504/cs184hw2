//
//  LogInView.swift
//  hw2
//
//  Created by Ryan Vo on 10/23/24.
//

import SwiftUI

struct LogInView: View {
    @State private var email = ""
    @State private var password = ""
    @EnvironmentObject var viewModel: AuthviewModel
    
    var body: some View {
        NavigationStack {
            VStack(spacing: 24) {
                InputView(text: $email, title: "Email Address", placeholder: "name@example.com").autocapitalization(.none)
                InputView(text: $password, title: "Password", placeholder: "Enter your password",isSecureField: true)
            }
            .padding(.horizontal)
            .padding(.top,12)
            
            Button {
                Task {
                    try await viewModel.signIn(withEmail: email, password: password)
                }
                
            } label: {
                HStack {
                    Text("SIGN IN").fontWeight(.semibold)
                    Image(systemName: "arrow.right")
                }
                .foregroundStyle(.white)
                .frame(width: UIScreen.main.bounds.width - 32, height: 48)
            }
            .disabled(!formIsValid)
            .opacity(formIsValid ? 1.0 : 0.5)
            .background(Color(.systemBlue))
            .cornerRadius(10)
            .padding(.top, 24)
            
            NavigationLink {
                RegistrationView()
                    .navigationBarBackButtonHidden(true)
            } label: {
                HStack(spacing:3) {
                    Text("Don't have an account?")
                    Text("Sign up").fontWeight(.bold)
                }
                .font(.system(size: 14))
            }
        }
    }
}

extension LogInView: AuthenticationFormProtocol {
    var formIsValid: Bool {
        return !email.isEmpty
        && email.contains("@")
        && !password.isEmpty
        && password.count > 5
    }
}

#Preview {
    LogInView()
}
