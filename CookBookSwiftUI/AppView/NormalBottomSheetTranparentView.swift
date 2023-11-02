//
//  NormalBottomSheetTranparentView.swift
//  CookBookSwiftUI
//
//  Created by Papon Supamongkonchai on 1/11/2566 BE.
//

import SwiftUI

struct NormalBottomSheetTranparentView: View {
    @State private var isFullScreen = false
    
    @State private var backgroundOpacity: Double = 0.0
    @State private var isShowBottomSheet = false
    @State private var isShowBottomSheetClearBackground = false

    var body: some View {
        ZStack {
            Color.white
                .edgesIgnoringSafeArea(.all)

            VStack {
                

                Button(action: {
                    isShowBottomSheet.toggle()
                }) {
                    Text("Toggle Bottom Sheet Full Screen")
                        .padding()
                        .background(Color.white)
                        .foregroundColor(.blue)
                        .cornerRadius(10)
                }
                
                Button(action: {
                    isShowBottomSheetClearBackground.toggle()
                }) {
                    Text("Toggle Bottom Sheet Full Screen and clear background")
                        .padding()
                        .background(Color.white)
                        .foregroundColor(.blue)
                        .cornerRadius(10)
                }
            }
        }
        .fullScreenCover(isPresented: $isShowBottomSheet) {
            accountBottomSheetView()
        }
        .overlay {
            if isShowBottomSheetClearBackground {
                ZStack {
                    Color.black
                        .opacity(backgroundOpacity)
                    
                    anotherBottomSheetView()
                }
                .ignoresSafeArea(.all)
               
            }
        }
    }
    
    @ViewBuilder
    private func accountBottomSheetView() -> some View {
        VStack{
            Spacer()
            BottomSheetView(title: "NAmeeeeee",
                            isOpen: $isShowBottomSheet,
                            maxHeight: 240,
                            content: {
                VStack {
                    Button(action: {
                        isShowBottomSheet = false
                    }) {
                        Text("logout")
                            .foregroundColor(.white)
                        .padding()
                    }
                    .frame(maxWidth: .infinity)
                    .frame(height: 50)
                    .cornerRadius(20)
                    
                    
                    Button(action: {
                        isShowBottomSheet = false
                    }) {
                        Text("delete_account")
                            .foregroundColor(Color.gray)
                            .padding()
                    }
                    .frame(height: 50)
                }
                .padding(EdgeInsets(top: 30, leading: 16, bottom: 30, trailing: 16))
            })
        }
        .background(
            Color.black
            .opacity(backgroundOpacity)
            .ignoresSafeArea()
            .transition(.opacity)
        )
        .ignoresSafeArea()
        .transition(.move(edge: .trailing))
        .onDisappear() {
            backgroundOpacity = 0.0
        }
        .onAppear() {
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                withAnimation(.easeOut) {
                    backgroundOpacity = 0.3
                }
            }
        }
    }
    
    @ViewBuilder
    private func anotherBottomSheetView() -> some View {
        VStack{
            Spacer()
            BottomSheetView(title: "NAmeeeeee",
                            isOpen: $isShowBottomSheetClearBackground,
                            maxHeight: 240,
                            content: {
                VStack {
                    Button(action: {
                        isShowBottomSheetClearBackground = false
                    }) {
                        Text("logout")
                            .foregroundColor(.white)
                        .padding()
                    }
                    .frame(maxWidth: .infinity)
                    .frame(height: 50)
                    .cornerRadius(20)
                    
                    
                    Button(action: {
                        isShowBottomSheetClearBackground = false
                    }) {
                        Text("delete_account")
                            .foregroundColor(Color.gray)
                            .padding()
                    }
                    .frame(height: 50)
                }
                .padding(EdgeInsets(top: 30, leading: 16, bottom: 30, trailing: 16))
            })
        }
        .ignoresSafeArea()
        .transition(.move(edge: .trailing))
        .onDisappear() {
            withAnimation(.easeIn) {
                backgroundOpacity = 0.0
            }
        }
        .onAppear() {
            withAnimation(.easeOut) {
                backgroundOpacity = 0.3
            }
        }
    }

}

struct BottomSheetView<Content: View>: View {
    @Binding var isOpen: Bool

    let title: String
    let maxHeight: CGFloat
    let minHeight: CGFloat
    let content: Content

    init(title: String, isOpen: Binding<Bool>, maxHeight: CGFloat, @ViewBuilder content: () -> Content) {
        self.title = title
        self.minHeight = maxHeight
        self.maxHeight = maxHeight
        self.content = content()
        self._isOpen = isOpen
    }
    
    private var offset: CGFloat {
        isOpen ? 0 : maxHeight - minHeight
    }

    private var indicator: some View {
        VStack(spacing: 16){
            Color.gray
                .frame(width: 36, height: 5)
                .cornerRadius(2.5)
            
            HStack {
                Text(title)
                    .font(.system(size: 16))
                    .foregroundColor(.black)
                
                Spacer()
                
                Button(action: {
                    self.isOpen = false
                }, label: {
                    Image(systemName: "arrow.left.and.right.circle")
                })
            }
        }
        .frame(height: 50)
        .padding(EdgeInsets(top: 5, leading: 16, bottom: 12, trailing: 16))
        .background(
            RoundedRectangle(cornerRadius: 1)
                .fill(Color.green)
                .shadow(color: Color.gray,
                        radius: 1, x: 0, y: 0.5)
        )
    }
    
    @GestureState private var translation: CGFloat = 0

    var body: some View {
        if isOpen {
            GeometryReader { geometry in
                VStack(spacing: 0) {
                    self.indicator
                    self.content
                }
                .frame(width: geometry.size.width, height: self.maxHeight, alignment: .top)
                .background(Color.white)
                .cornerRadius(20)
                .frame(height: geometry.size.height, alignment: .bottom)
                .offset(y: max(self.offset + self.translation, 0))
                .animation(.interactiveSpring(), value: translation)
                .gesture(
                    DragGesture().updating(self.$translation) { value, state, _ in
                        state = value.translation.height
                    }.onEnded { value in
                        let snapDistance = self.maxHeight * 0.1 // 0.1 of maxHeight for close
                        guard abs(value.translation.height) > snapDistance else {
                            return
                        }
                        self.isOpen = value.translation.height < 0
                    }
                )
            }
        }
    }
}

//#Preview {
//    NormalBottomSheetTranparent()
//}

