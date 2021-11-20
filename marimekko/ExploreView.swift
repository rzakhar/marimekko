//
//  ExploreView.swift
//  marimekko
//
//  Created by Roman Zakharov on 20.11.2021.
//

import SwiftUI

struct ExploreView: View {
    var body: some View {
        List {
            ExploreTile(title: "2021 tote bags", imageSet: "totebag")
            ExploreTile(title: "2021 tote bags", imageSet: "totebag")
            ExploreTile(title: "2021 tote bags", imageSet: "totebag")
        }
    }
}

struct ExploreView_Previews: PreviewProvider {
    static var previews: some View {
        ExploreView()
    }
}

struct ExploreTile: View {
    @State var title = "Explore"
    @State var imageSet = "totebag"

    var body: some View {
        VStack(alignment: .leading, spacing: 15) {
            Text(title)
                .font(.title2)
            HStack {
                ForEach((1 ... 3), id: \.self) { index in
                    Image("totebag\(index)")
                        .resizable()
                        .scaledToFill()
                        .frame(width: 80, height: 80)
                        .cornerRadius(10)
                }
                ZStack {
                    Color.accentColor
                        .cornerRadius(10)
                        .frame(width: 80, height: 80)
                    Color.white
                        .cornerRadius(9)
                        .frame(width: 77, height: 77)
                    Image(systemName: "chevron.right")
                        .foregroundColor(.accentColor)
                }
            }
        }
        .padding(.vertical, 10)
    }
}
