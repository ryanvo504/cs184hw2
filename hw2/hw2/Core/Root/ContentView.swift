//
//  ContentView.swift
//  hw2
//
//  Created by Ryan Vo on 10/23/24.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var viewModel: AuthviewModel
    var body: some View {
        Group {
            if viewModel.userSession != nil {
                ProfileView()
            } else {
                LogInView()
            }
        }
    }
}

#Preview {
    ContentView()
}
