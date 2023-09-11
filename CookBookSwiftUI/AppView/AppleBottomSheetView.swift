//
//  AppleBottomSheetView.swift
//  CookBookSwiftUI
//
//  Created by Papon Supamongkonchai on 4/9/2566 BE.
//

import SwiftUI

struct AppleBottomSheetView: View {
    
    @StateObject var bindableObject = WindowSharedModel()
    
    var body: some View {
        
        TabView(selection: $bindableObject.activeTab) {
            
            NavigationStack {
                Text("People")
            }
            .tag(Tab.people)
            .hideNativeBar()
            
            NavigationStack {
                Text("Devices")
            }
            .tag(Tab.devices)
            .hideNativeBar()
            
            NavigationStack {
                Text("Items")
            }
            .tag(Tab.items)
            .hideNativeBar()
            
            NavigationStack {
                Text("Me")
            }
            .tag(Tab.me)
            .hideNativeBar()
        }
        .tabSheet(initialHeight: 100, sheetCornerRadius: 15) {
            NavigationStack {
                ScrollView {
                    
                }
                .scrollIndicators(.hidden)
                .toolbar {
                    //Leading Title
                    ToolbarItem(placement: .navigationBarLeading) {
                        Text(bindableObject.activeTab.title)
                            .font(.title3.bold())
                    }
                    
                    //Show Plus Button for only Devices
                    if bindableObject.activeTab == .devices {
                        ToolbarItem(placement: .navigationBarTrailing) {
                            Button {
                                print("click plus")
                            } label: {
                                Image(systemName: "plus")
                            }
                        }
                    }
                }
            }
        }
    }
}

struct AppleBottomSheetView_Previews: PreviewProvider {
    static var previews: some View {
        AppleBottomSheetView()
    }
}
