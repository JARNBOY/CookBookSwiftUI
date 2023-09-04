//
//  MenuItemView.swift
//  CookBookSwiftUI
//
//  Created by Papon Supamongkonchai on 4/9/2566 BE.
//

import SwiftUI

struct MenuItemView: View {
    
    var menuItem: String
    
    var body: some View {
        HStack {
            Spacer()
            Text(menuItem)
                .modifier(TextMenuItemModifier())
            Spacer()
        }
        .background(.blue)
        .cornerRadius(defaultCornerRadiusValue)
        .padding()
    }
}

struct MenuItemView_Previews: PreviewProvider {
    static var previews: some View {
        MenuItemView(menuItem: listMenuCookBook[0])
            
    }
}
