//
//  MenuButtonView.swift
//  CookBookSwiftUI
//
//  Created by Papon Supamongkonchai on 14/11/2566 BE.
//

import SwiftUI

struct MenuButtonView: View {
    var body: some View {
        VStack {
            
            HStack {
                Menu {
                    Button {
                        print("click")
                    } label: {
                        Text("A")
                    }
                    
                    Button {
                        print("click")
                    } label: {
                        HStack(spacing: 8) {
                            Text("BBBBBBBB")
                            
                            Spacer()
                            
                            Image("photo-paris-france")
                                .resizable()
                                .frame(width: 20, height: 20)
                        }
                        
                    }
                    
                    Button {
                        print("click")
                    } label: {
                        Text("CCC")
                    }

                } label: {
                    Text("MenuLeft")
                }
                .frame(width: .infinity, height: 100, alignment: .leading)
                .background(
                    Color.gray
                )
                
                Spacer()
                
                Menu {
                    Button {
                        print("click")
                    } label: {
                        Text("A")
                    }
                    
                    Button {
                        print("click")
                    } label: {
                        HStack(spacing: 8) {
                            Text("BBBBBBBB")
                            
                            Spacer()
                            
                            Image("photo-paris-france")
                                .resizable()
                                .frame(width: 20, height: 20)
                        }
                        
                    }
                    
                    Button {
                        print("click")
                    } label: {
                        Text("CCC")
                    }

                } label: {
                    Text("MenuLeft")
                }
                .frame(width: .infinity, height: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, alignment: .leading)
                .background(
                    Color.green
                )
                
                Spacer()
                
                Menu {
                    Button {
                        print("click")
                    } label: {
                        Text("A")
                    }
                    
                    Button {
                        print("click")
                    } label: {
                        HStack(spacing: 8) {
                            Text("BBBBBBBB")
                            
                            Spacer()
                            
                            Image("photo-paris-france")
                                .resizable()
                                .frame(width: 20, height: 20)
                        }
                        
                    }
                    
                    Button {
                        print("click")
                    } label: {
                        Text("CCC")
                    }

                } label: {
                    Text("MenuLeft")
                }
                .frame(width: .infinity, height: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, alignment: .leading)
                .background(
                    Color.black
                )
            }
            .background(
                Color.orange
            )
            
            
            Spacer()
            
            

        }
    }
}

#Preview {
    MenuButtonView()
}
