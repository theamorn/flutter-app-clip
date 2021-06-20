//
//  ContentView.swift
//  appclip
//
//  Created by Amorn Apichattanakul on 19/6/21.
//

import SwiftUI
import StoreKit

struct ContentView: View {
    @State private var showRecommended = false
    @ObservedObject var viewModel: AppClipViewModel
    
    var body: some View {
        Text("ID from AppClip")
            .padding()
        Text(viewModel.id ?? "N/A")
            .padding()
        Button("Show Recommended App") {
            self.showRecommended.toggle()
        }.appStoreOverlay(isPresented: $showRecommended) {
            return viewModel.openAppStore()
        }.padding()
        Text("my save ID \(viewModel.saveID)")
            .padding()
    }
}
