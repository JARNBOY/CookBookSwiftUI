//
//  ScrollViewHeaderView.swift
//  CookBookSwiftUI
//
//  Created by Papon Supamongkonchai on 3/11/2566 BE.
//

import SwiftUI

struct ScrollViewHeaderView: View {
    
    @ObservedObject private var viewModel = TabBoxViewModel()
    
    var body: some View {
        ScrollView {
            ParallaxEffect()
            if viewModel.isShowTabBox {
                TabBoxView(display: viewModel.tabboxVMDisplay)
            }
            HoneymoonListView()
        }
        .onAppear(perform: {
            viewModel.assumeRequestAPI()
        })
        .ignoresSafeArea()
    }
}

struct ParallaxEffect: View {
    var body: some View {
        GeometryReader { geometry in
            let offsetY = geometry.frame(in: .global).minY
            let isScroll = offsetY > 0
            
            Spacer()
                .frame(height: isScroll ? 400 + offsetY : 400)
                .background {
                    ZStack {
                        Image("photo-paris-france")
                            .resizable()
                            .scaledToFill()
                            .offset(y: isScroll ? -offsetY : 0)
                            .blur(radius: isScroll ? offsetY / 20 : 0)
                        
                        VStack {
                            
                            Text("Test")
                                .font(.title2)
                                .fontWeight(.black)
                                .foregroundColor(.white)
                            
                            HStack {
                                Text("Content Test")
                                    .font(.title2)
                                    .fontWeight(.black)
                                    .foregroundColor(.white)
                                
                                Text("Content Test")
                                    .font(.title2)
                                    .fontWeight(.black)
                                    .foregroundColor(.white)
                            }
                        }
                        
                    }
                    
                }
            
        }
        .frame(height: 400)
    }
}

struct HoneymoonListView: View {
    let places: [Destination] = honeymoonData
    
    var body: some View {
        VStack(alignment: .leading, content: {
            ForEach(places, id: \.self) { place in
                HStack(spacing: 16, content: {
                    
                    Image(place.image)
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 300, height: 150, alignment: .center)
                        .cornerRadius(15)
                        .shadow(color: .black.opacity(0.25), radius: 8, x: 5, y: 10)
                        .overlay {
                            
                            PlaceNameView(place)
                        }
                    
                })
                .cornerRadius(8)
            }
        })
        .padding(.horizontal, 16)
        
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

//#Preview {
//    ScrollViewHeaderView()
//}
