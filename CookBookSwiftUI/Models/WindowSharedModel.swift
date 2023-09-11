//
//  WindowSharedModel.swift
//  CookBookSwiftUI
//
//  Created by Papon Supamongkonchai on 4/9/2566 BE.
//

import SwiftUI

class WindowSharedModel: ObservableObject {
    @Published var activeTab: Tab = .devices
}
