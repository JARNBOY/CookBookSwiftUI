//
//  ParallaxCarouselHScrollView.swift
//  CookBookSwiftUI
//
//  Created by Papon Supamongkonchai on 22/9/2566 BE.
//

import SwiftUI

struct ParallaxCarouselHScrollView: View {
    
    @State private var searchText: String = ""
    let places: [Destination] = honeymoonData
    
    var body: some View {
        ScrollView(.vertical) {
            VStack(spacing: 15) {
                
                //MARK: Search View
                HStack(spacing: 12) {
                    Button {} label: {
                        Image(systemName: "line.3.horizontal")
                            .font(.title)
                            .foregroundColor(.blue)
                    }//: Button
                    
                    HStack(spacing: 12) {
                        Image(systemName: "magnifyingglass")
                            .foregroundColor(.gray)
                        
                        TextField("Search", text: $searchText)
                    }//: HStack
                    .padding(.horizontal, 15)
                    .padding(.vertical, 10)
                    .background(.ultraThinMaterial, in: Capsule())
                }//: HStack
                
                Text("Where do you want to \ntravel?")
                    .font(.largeTitle.bold())
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.top, 10)
                
                //MARK: Parallax Carousel View
                GeometryReader { geometry in
                    let size = geometry.size
                    
                    ScrollView(.horizontal) {
                        HStack(spacing: 10) {
                            ///In order  to Move the Card in Reverse Direction (Parallax Effect)
                            ForEach(places, id: \.self) { place in
                                GeometryReader { proxy in
                                    let cardSize = proxy.size
                                    ///paprallax effect
                                    let minX = proxy.frame(in: .global).minX - 30.0
                                    
                                    Image(place.image)
                                        .resizable()
                                        .aspectRatio(contentMode: .fill)
                                        .scaleEffect(1.25)
                                        .offset(x: -minX)
                                        .frame(width: cardSize.width, height: cardSize.height, alignment: .center)
                                        .cornerRadius(15)
                                        .shadow(color: .black.opacity(0.25), radius: 8, x: 5, y: 10)
                                        .overlay {
                                            
                                            PlaceNameView(place)
//                                            Text("\(minX)")
//                                                .font(.largeTitle)
//                                                .foregroundStyle(.white)
                                        }
                                }
                                .frame(width: size.width - 60, height: size.height - 50)
                            }
                        }//: HStack
                        .padding(.horizontal, 30)
                        .frame(height: size.height, alignment: .top)
                    }//: ScrollView
                    .scrollIndicators(.hidden)
                }//: GeometryReader
                .frame(height: 500)
                .padding(.horizontal, -15)
                .padding(.top, 10)
                
            }//: VStack
            .padding(15)
            
        }//: ScrollView
        .scrollIndicators(.hidden)
    }
    
    @ViewBuilder
    func PlaceNameView(_ place: Destination) -> some View {
        ZStack(alignment: .bottomLeading) {
            LinearGradient(colors: [
                .clear,
                .clear,
                .clear,
                .clear,
                .clear,
                .black.opacity(0.1),
                .black.opacity(0.5),
                .black
            ], startPoint: .top, endPoint: .bottom)
            
            VStack(alignment: .leading, spacing: 4) {
                Text(place.country)
                    .font(.title2)
                    .fontWeight(.black)
                    .foregroundColor(.white)
                
                Text(place.place)
                    .font(.callout)
                    .foregroundStyle(.white.opacity(0.8))
            }
            .padding(20)
        }
        .cornerRadius(15)
    }
}

struct ParallaxCarouselHScrollView_Previews: PreviewProvider {
    static var previews: some View {
        ParallaxCarouselHScrollView()
    }
}
