//
//  PassDataRouter.swift
//  CookBookSwiftUI
//
//  Created by Papon Supamongkonchai on 22/11/2566 BE.
//

import SwiftUI

protocol PassDataRouterProtocol: AnyObject {
    func navigateToSomeSheetView() -> AnyView
}
class PassDataRouter: ObservableObject {
    @ObservedObject private var viewModel: PassDataViewModel
    private let navigationController: UINavigationController
    
    init(viewModel: PassDataViewModel,
         navigationController: UINavigationController) {
        self.viewModel = viewModel
        self.navigationController = navigationController
    }
    
    func navigateToSomeSheetView() -> AnyView {
        return AnyView(PageToSheetView(viewModel: viewModel))
    }
}


struct PageToSheetView: View {
    
    @ObservedObject var viewModel: PassDataViewModel
    
    var body: some View {
        Button(action: {
            viewModel.isSheetPresented = false
        }, label: {
            Text("dissmiss")
        })
    }
}
