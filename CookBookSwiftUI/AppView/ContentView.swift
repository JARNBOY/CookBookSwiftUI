//
//  ContentView.swift
//  CookBookSwiftUI
//
//  Created by Papon Supamongkonchai on 4/9/2566 BE.
//

import SwiftUI

struct ContentView: View {
    
    @State private var path = NavigationPath()
    
    var body: some View {
        NavigationStack(path: $path) {
            ScrollView(showsIndicators: false) {
                LazyVStack(spacing: 16) {
                    ForEach(listMenuCookBook, id: \.self) { menuItem in
                        
                        NavigationLink(value: menuItem) {
                            MenuItemView(menuItem: menuItem)
                                .frame(height: 80)
                        }
                    }
                }
            }
            .navigationDestination(for: String.self) { textValue in
                switch textValue {
                case MenuType.scrollHeaderParallax.rawValue:
                    ScrollViewHeaderView()
                    
                case MenuType.normal_bottomSheet_fullScreen.rawValue:
                    NormalBottomSheetTranparentView()
                    
                case MenuType.bottomSheet.rawValue:
                    AppleBottomSheetView()
                        .environmentObject(WindowSharedModel())
                case MenuType.parallaxCarousel.rawValue:
                    ParallaxCarouselHScrollView()
                default:
                    Text("This Page need set router direction view")
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
