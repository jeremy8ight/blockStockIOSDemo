//
//  TitleView.swift
//  blockStocks
//
//  Created by Jeremy Barnes-Smith on 5/6/25.
//

import SwiftUI

struct TitleView: View {
    @State private var textOne = ""
    @State private var textTwo = ""
    var body: some View {
        NavigationStack {
            VStack {
                Text("Block Stocks").font(.largeTitle)
                TextField("Username", text: $textOne)
                    .border(.bar, width: 2)
                TextField("Password", text: $textTwo)
                    .border(.bar, width: 2)
                NavigationLink {
                    ContentView()
                        .navigationBarBackButtonHidden(true)
                } label: {
                    Text("Sign In")
                }

            }
            .padding(.horizontal, 50)
            .onDisappear {
                textOne = ""
                textTwo = ""
            }
        }
    }
}

#Preview {
    TitleView()
}
