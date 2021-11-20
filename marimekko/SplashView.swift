//
//  SplashView.swift
//  marimekko
//
//  Created by Roman Zakharov on 20.11.2021.
//

import SwiftUI

struct SplashView: View {
    @State var isActive = false
    @State var showFlower = false
    @State var showLoved = false

    var body: some View {
        VStack {
            if self.isActive {
                ContentView()
            } else {
                ZStack {
                    if self.showFlower {
                        Image("flower")
                            .offset(x: -140, y: -230)
                    }
                    Image("marimekko")
                    if self.showLoved {
                        Image("preloved")
                            .offset(x: 40, y: 30)
                    }
                }
            }
        }
        .onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
                withAnimation {
                    self.showFlower = true
                }
            }
            DispatchQueue.main.asyncAfter(deadline: .now() + 1.75) {
                withAnimation {
                    self.showLoved = true
                }
            }
            DispatchQueue.main.asyncAfter(deadline: .now() + 2.5) {
                withAnimation {
                    self.isActive = true
                }
            }
        }
    }
}

struct SplashView_Previews: PreviewProvider {
    static var previews: some View {
        SplashView()
    }
}
