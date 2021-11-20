//
//  PostsView.swift
//  marimekko
//
//  Created by Roman Zakharov on 20.11.2021.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        ScrollView(showsIndicators: false) {
            VStack(spacing: 20) {
                PostView(name: "Silkkikuikka mekko",
                         imageName: "Silkki",
                         patternIndex: 0,
                         year: 1977,
                         size: "S",
                         style: "Vintage",
                         price: 90)
                Divider()
                PostView(name: "Tarha mekko",
                         imageName: "Tarha",
                         patternIndex: 2,
                         year: 1981,
                         size: "M",
                         style: "Vintage",
                         price: 320)
                Divider()
                PostView(name: "Pivo mekko",
                         imageName: "Pivo",
                         patternIndex: 4,
                         year: 1995,
                         size: "S",
                         style: "Vintage",
                         price: 320)
            }
        }
        .frame(width: UIScreen.main.bounds.width - 30)
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}

struct PostView: View {
    @State var patterns = ["Verkko", "Lokki", "Nadja", "Nasti", "Pallo", "Piccolo"]

    @State var name = "Product"
    @State var imageName = "Silkki"
    @State var patternIndex = 0
    @State var liked = false
    @State var year = 1999
    @State var size = "M"
    @State var style = "Vintage"
    @State var price = 100

    var body: some View {
        VStack(alignment: .leading) {
            Text(name)
                .font(.title2)
            ZStack(alignment: .bottom) {
                ZStack {
                    Image(patterns[patternIndex])
                        .fitToAspectRatio(.threeToFour)
                        .cornerRadius(10)
                        .frame(width: UIScreen.main.bounds.width - 30)
                    Image(imageName)
                        .fitToAspectRatio(.threeToFour)
                        .frame(width: UIScreen.main.bounds.width - 30)
                }
                .onTapGesture {
                    patternIndex += 1
                    if patternIndex == patterns.count {
                        patternIndex = 0
                    }
                }
                HStack {
                    ActionButton(imageName: liked ? "heart.fill" : "heart")
                    ActionButton(imageName: "bubble.right")
                    Spacer()
//                    ZStack {
//                        Color.white
//                            .cornerRadius(10)
//                        Text(patterns[patternIndex])
//                            .foregroundColor(.black)
//                    }
//                    .frame(width: 100, height: 30)
                }
                .padding(.all, 10)
            }
            HStack {
                InfoPill(title: "\(year)", subtitle: "year")
                InfoPill(title: size, subtitle: "size")
                InfoPill(title: style, subtitle: "style")
                InfoPill(title: "\(price)€", subtitle: "price")
            }
        }
    }
}

struct ActionButton: View {
    @State var imageName = "heart"

    var body: some View {
        ZStack {
            Color.black
                .opacity(0.5)
                .cornerRadius(10)
                .frame(width: 50, height: 50)
            Image(systemName: imageName)
                .resizable()
                .frame(width: 30, height: 27)
                .foregroundColor(.white)
        }
    }
}

struct InfoPill: View {
    @State var title = "XXX"
    @State var subtitle = "Property"

    var body: some View {
        ZStack {
            Color.gray
                .cornerRadius(10)
                .opacity(0.2)
            VStack {
                Text(title)
                    .font(.title2)
                Text(subtitle)
                    .font(.subheadline)
            }
        }
        .frame(height: 50)
    }
}
