//
//  TabBoxViewModel.swift
//  CookBookSwiftUI
//
//  Created by Papon Supamongkonchai on 20/11/2566 BE.
//

import SwiftUI

class TabBoxViewModel: ObservableObject {
    @Published var tabBox: TabBox.Style = .rejectRequest
    @Published var isShowTabBox: Bool = false
    var tabboxVMDisplay: TabBox.ViewModel?
    
    func assumeRequestAPI() {
        tabBox = .infoMoreRequest
        isShowTabBox = true
        
        let title = ""
        let detail = ""
        let labelButton = "ดูรายละเอียด"
        self.tabboxVMDisplay = TabBox.ViewModel(iconBox: "plus", title: "คำขอเข้าร่วมบ้าน", detail: "", labelButton: "ดูรายละเอียด", iconClose: "xmark", stateBox: .info, styleBox: tabBox)
    }
}
