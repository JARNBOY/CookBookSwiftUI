//
//  TabBoxModel.swift
//  CookBookSwiftUI
//
//  Created by Papon Supamongkonchai on 20/11/2566 BE.
//

import SwiftUI

enum TabBox {
    
    enum State {
        case info
        case rejected
    }
    
    enum Style {
        case infoOneRequest
        case infoMoreRequest
        case rejectRequest
    }
    
    struct ViewModel {
        var iconBox: String
        var title: String
        var detail: String
        var labelButton: String
        var iconClose: String
        var stateBox: TabBox.State
        var styleBox: TabBox.Style
        
    }
    
}

#Preview {
    TabBoxView(display: TabBox.ViewModel(iconBox: "plus", title: "คำขอเข้าร่วมบ้าน", detail: "คำขอเข้าร่วมบ้าน คำขอเข้าร่วมบ้าน คำขอเข้าร่วมบ้าน", labelButton: "ดูรายละเอียด", iconClose: "xmark", stateBox: .info, styleBox: .infoMoreRequest))
}

struct TabBoxView: View {
    
    var display: TabBox.ViewModel?
    
    var body: some View {
        
        let colorBackground = display?.stateBox == .rejected ? Color.red : Color.accentColor
        
        HStack(alignment: .top, spacing: 8) {
            Image(systemName: display?.iconBox ?? "")
                .font(.title2)
                .background(.background, in: Circle())
                .padding(.all, 8)
            
            VStack {
                Text(display?.title ?? "")
                    .padding(8)
                if display?.styleBox == .infoMoreRequest {
                    Text(display?.detail ?? "")
                        .padding(8)
                }
            }
            
            
            Text(display?.labelButton ?? "")
                .underline(true)
                .frame(width: 98)
                .padding(8)
            
            Image(systemName: display?.iconClose ?? "")
                .font(.title2)
                .background(.background, in: Circle())
                .padding(.all, 8)
            
        }
        .frame(minHeight: 56)
        .background(
            RoundedRectangle(cornerRadius: 16).fill(colorBackground.opacity(0.3))
        )
        .padding(.all, 16)
    }
}
