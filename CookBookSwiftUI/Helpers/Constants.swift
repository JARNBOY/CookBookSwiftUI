//
//  Constants.swift
//  CookBookSwiftUI
//
//  Created by Papon Supamongkonchai on 4/9/2566 BE.
//

import Foundation

enum MenuType: String {
    case normal_bottomSheet_fullScreen
    case bottomSheet
    case parallaxCarousel
}
//MARK: DATA
let listMenuCookBook: [String] = [
    MenuType.normal_bottomSheet_fullScreen.rawValue,
    MenuType.bottomSheet.rawValue,
    MenuType.parallaxCarousel.rawValue,
    "Add more?"
]

//MARK: View Common Property
let defaultCornerRadiusValue: CGFloat = 8
