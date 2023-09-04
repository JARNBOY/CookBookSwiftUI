//
//  TabViewExtension+Modifier.swift
//  CookBookSwiftUI
//
//  Created by Papon Supamongkonchai on 4/9/2566 BE.
//

import SwiftUI

//Custom View Modifiers
extension TabView {
    @ViewBuilder
    func tabSheet<SheetContent: View>(
        initialHeight: CGFloat = 100,
        sheetCornerRadius: CGFloat = 15,
        @ViewBuilder content: @escaping () -> SheetContent) -> some View {
       self
            .modifier(BottomSheetModifier(initialHeight: initialHeight, sheetCornerRadius: sheetCornerRadius, sheetView: content()))
    }
}

//Helpers View Modifier
fileprivate struct BottomSheetModifier<SheetContent: View>: ViewModifier {
    var initialHeight: CGFloat
    var sheetCornerRadius: CGFloat
    var sheetView: SheetContent
    //View Property
    @State private var showSheet: Bool = true
    
    func body(content: Content) -> some View {
        content
            .sheet(isPresented: $showSheet) {
                sheetView
                    .presentationDetents([.height(initialHeight), .medium, .large])
                    .presentationCornerRadius(sheetCornerRadius)
                    .presentationBackgroundInteraction(.enabled(upThrough: .medium))
                    .interactiveDismissDisabled()
            }
    }
    
}
