//
//  PassDataViewModel.swift
//  CookBookSwiftUI
//
//  Created by Papon Supamongkonchai on 22/11/2566 BE.
//

import SwiftUI

class PassDataViewModel: ObservableObject {
    @Published var isSheetPresented: Bool = false
    
    init(isSheetPresented: Bool) {
        self.isSheetPresented = isSheetPresented
    }
}
