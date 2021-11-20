//
//  RewardsView.swift
//  marimekko
//
//  Created by Roman Zakharov on 19.11.2021.
//

import SwiftUI

struct RewardsView: View {
    var body: some View {
        List {
            RewardView(current: 2, goal: 3, imageName: "totebag1", cta: "Invite 3 friends", color: .teal)
            RewardView(current: 4, goal: 5, imageName: "totebag2", cta: "Buy 5 goods", color: .cyan)
            RewardView(current: 3, goal: 3, imageName: "totebag3", cta: "Sell 3 goods", color: .accentColor)
        }
    }
}

struct RewardsView_Previews: PreviewProvider {
    static var previews: some View {
        RewardsView()
    }
}

struct RewardView: View {
    @State var current = 0
    @State var goal = 5
    @State var imageName = "totebag"
    @State var cta = "Do stuff, get reward!"
    @State var color = Color.black

    var body: some View {
        HStack(spacing: 25) {
            Image(imageName)
                .resizable()
                .scaledToFill()
                .frame(width: 100, height: 100)
                .cornerRadius(10)
                .saturation(current == goal ? 1.0 : 0.0)
            VStack(alignment: .leading, spacing: 20) {
                Text(cta)
                    .font(.title2)
                Text(current == goal ? "Claim you reward" : "Only \(goal - current) to go!")
                HStack {
                    ForEach((0 ..< goal), id: \.self) { index in
                        Rectangle()
                            .foregroundColor(index < current ? color : .gray)
                            .cornerRadius(3)
                    }
                }
                .frame(height: 10)
            }
        }
        .frame(height: 130)
        .onTapGesture {
            current += 1
            current %= goal + 1
        }
    }
}
