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
                ScrollView(.horizontal) {
                    
                }
                
            }//: VStack
            .padding(15)
            
        }//: ScrollView
        .scrollIndicators(.hidden)
    }
}

struct ParallaxCarouselHScrollView_Previews: PreviewProvider {
    static var previews: some View {
        ParallaxCarouselHScrollView()
    }
}
