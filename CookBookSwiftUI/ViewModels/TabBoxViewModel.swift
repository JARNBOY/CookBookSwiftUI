//
//  TabBoxViewModel.swift
//  CookBookSwiftUI
//
//  Created by Papon Supamongkonchai on 20/11/2566 BE.
//

import SwiftUI

class TabBoxViewModel: ObservableObject {
    @Published var tabBox: TabBox.Style = .infoDisplayTitleNoDetail
    @Published var isShowTabBox: Bool = false
    var tabboxVMDisplay: TabBox.ViewModel?
    
    func assumeRequestAPI() {
        tabBox = .infoDisplayTitleMoreDetail
        isShowTabBox = true
        
        let title = ""
        let detail = ""
        let labelButton = "ดูรายละเอียด"
        self.tabboxVMDisplay = TabBox.ViewModel(iconBox: "plus", title: "คำขอเข้าร่วมบ้าน", detail: "คำขอเข้าร่วมบ้านคำขอเข้าร่วมบ้านคำขอเข้าร่วมบ้านคำขอเข้าร่วมบ้าน", labelButton: "ดูรายละเอียด", iconClose: "xmark", stateBox: .info, styleBox: tabBox)
    }
}
