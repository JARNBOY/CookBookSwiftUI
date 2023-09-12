//
//  AppleBottomSheetView.swift
//  CookBookSwiftUI
//
//  Created by Papon Supamongkonchai on 4/9/2566 BE.
//

import SwiftUI

struct AppleBottomSheetView: View {
    @EnvironmentObject private var bindableObject: WindowSharedModel
    @Environment(\.sceneDelegate) private var sceneDelegate
    
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
        .onAppear {
            guard sceneDelegate?.tabWindow == nil else { return }
            sceneDelegate?.addTabBar(bindableObject)
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

//MARK: Custom Tab Bar
struct CustomBar: View {
    @EnvironmentObject private var windowShareModel : WindowSharedModel
    
    var body: some View {
        VStack(spacing: 0) {
            Divider()
            
            HStack(spacing: 0) {
                ForEach(Tab.allCases, id: \.rawValue) { tab in
                    Button {
                        windowShareModel.activeTab = tab
                    } label: {
                        VStack {
                            Image(systemName: tab.rawValue)
                                .font(.title2)
                            
                            Text(tab.title)
                                .font(.caption)
                        }//: VStack
                        .foregroundStyle(windowShareModel.activeTab == tab ? Color.accentColor : .gray)
                        .frame(minWidth: .infinity, maxWidth: .infinity)
                        .contentShape(Rectangle())
                    }

                }
            }//:HStack
            .frame(height: 55)
        }//: VStack
        .background(.regularMaterial)
        
        
    }
}

struct AppleBottomSheetView_Previews: PreviewProvider {
    static var previews: some View {
        AppleBottomSheetView()
    }
}
