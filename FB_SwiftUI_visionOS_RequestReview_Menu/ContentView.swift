//
//  Created by Axel Le Pennec on 26/02/2024.
//  Copyright © 2024 Axel Le Pennec. All rights reserved.
// 

import StoreKit
import SwiftUI

struct ContentView: View {
    @Environment(\.requestReview) private var requestReview
    @Environment(\.scenePhase) private var scenePhase
    
    var body: some View {
        let _ = Self._printChanges()
        
        ContentSubView()
            .onChange(of: scenePhase) {
                if scenePhase == .active {
                    requestReview()
                }
            }
    }
}

struct ContentSubView: View {
    var body: some View {
        let _ = Self._printChanges()
        
        VStack {
            // If there is a Menu in the SubView, the requestReview is called whenever I tap on a Button within the Menu.
            // Thus the ContentSubView is init again
            Menu("Open Menu") {
                Button("Tap Me!") {
                    print("Hello, World!")
                }
            }
            
            // Having the Button alone does not trigger the requestReview
            Button("Tap Me!") {
                print("Hello, World!")
            }
        }
    }
}

#Preview {
    ContentView()
}
