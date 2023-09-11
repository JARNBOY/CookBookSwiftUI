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
                    //Showing Some Sample Mock Devices
                    DeviceRowView("iphone", "Papon's iPhone", "Home")
                    DeviceRowView("ipad", "Papon's iPad", "Home")
                    DeviceRowView("applewatch", "Papon's Apple Watch", "Home")
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
    
    //MARK: Device Row View
    @ViewBuilder
    func DeviceRowView(_ image: String, _ title: String, _ subTitle: String) -> some View {
        HStack(spacing: 12) {
            Image(systemName: image)
                .font(.title2)
                .padding(12)
                .background(.background, in: Circle())
            
            VStack(alignment: .leading, spacing: 4) {
                Text(title)
                    .fontWeight(.bold)
                
                Text(subTitle)
                    .font(.caption)
                    .foregroundColor(.gray)
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            
            Text("0 km")
                .font(.callout)
                .foregroundColor(.gray)
        }
    }
}

struct AppleBottomSheetView_Previews: PreviewProvider {
    static var previews: some View {
        AppleBottomSheetView()
    }
}
