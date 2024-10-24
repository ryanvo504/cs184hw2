//
//  ProfileView.swift
//  hw2
//
//  Created by Ryan Vo on 10/23/24.
//

import SwiftUI

struct ProfileView: View {
    @EnvironmentObject var viewModel: AuthviewModel
    var body: some View {
        if let user = viewModel.currentUser{
            List {
                Section {
                    HStack {
                        Text(user.initials)
                            .font(.title)
                            .fontWeight(.semibold)
                            .foregroundColor(.white)
                            .frame(width: 72, height: 72)
                            .background(Color(.systemGray3))
                            .clipShape(Circle())
                        
                        VStack {
                            Text(user.fullname).fontWeight(.semibold)
                                .padding(.top, 4)
                            Text(user.email)
                                .font(.footnote)
                                .foregroundColor(.gray)
                        }
                    }
                }
                
                Section("General") {
                    HStack {
                        SettingsRowView(imageName: "gear", title: "Version", tintColor: Color(.systemGray))
                        
                        Spacer()
                        
                        Text("1.0.0")
                            .font(.subheadline)
                            .foregroundColor(.gray)
                    }
                    NavigationLink {
                        helloWorldView()
                    } label: {
                        HStack(spacing:3) {
                            Text("Say hello world!").fontWeight(.bold)
                        }
                        .font(.system(size: 14))
                    }
                                         

                }
                
                Section("Account") {
                    Button {
                        viewModel.signOut()
                    } label: {
                        SettingsRowView(imageName: "arrow.left.circle.fill", title: "Sign Out", tintColor: .red)
                    }
                    
                    Button {
                        print("Delete account..")
                    } label: {
                        SettingsRowView(imageName: "arrow.left.circle.fill", title: "Delete Account", tintColor: .red)
                    }
                }
            }

        }
            }
}

#Preview {
    ProfileView()
}
