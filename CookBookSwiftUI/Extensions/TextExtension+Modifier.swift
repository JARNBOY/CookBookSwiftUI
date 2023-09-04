//
//  ViewExtension+Modifier.swift
//  CookBookSwiftUI
//
//  Created by Papon Supamongkonchai on 4/9/2566 BE.
//

import SwiftUI

//Custom View Modifiers
struct TextMenuItemModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.title)
            .fontWeight(.medium)
            .foregroundColor(.white)
            
    }
}
