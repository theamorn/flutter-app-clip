//
//  AppClipViewModel.swift
//  appclip
//
//  Created by Amorn Apichattanakul on 19/6/21.
//

import Foundation
import SwiftUI
import StoreKit

class AppClipViewModel: ObservableObject {
    @Published var id: String?
    @AppStorage("id", store: UserDefaults(suiteName: "group.com.amorn"))
    var saveID: String = String()
    
    func setProfile(id: String) {
        self.id = id
        
        guard let sharedUserDefaults = UserDefaults(suiteName: "group.com.amorn") else {
            return
        }
        sharedUserDefaults.set(id, forKey: "id")
    }
    
    func openAppStore() -> SKOverlay.Configuration {
        let appStoreID = "1496532821"
        return SKOverlay.AppConfiguration(appIdentifier: appStoreID, position: .bottom)
    }
    
}

