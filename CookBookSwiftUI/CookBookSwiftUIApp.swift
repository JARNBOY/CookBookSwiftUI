//
//  CookBookSwiftUIApp.swift
//  CookBookSwiftUI
//
//  Created by Papon Supamongkonchai on 4/9/2566 BE.
//

import SwiftUI

@main
struct CookBookSwiftUIApp: App {
    
    @UIApplicationDelegateAdaptor(AppDelegate.self) private var delegate
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}


//MARK: AppDelegate
class AppDelegate: NSObject, UIApplicationDelegate {
    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        let config = UISceneConfiguration(name: nil, sessionRole: connectingSceneSession.role)
        return config
    }
}

//MARK: SceneDelegate
class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    weak var windowScene: UIWindowScene?
    var tabWindow: UIWindow?
    
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        windowScene = scene as? UIWindowScene
        // Set the sceneDelegate property in the environment
        if let windowScene = scene as? UIWindowScene {
            let contentView = ContentView()
                .environment(\.sceneDelegate, self) // Set the SceneDelegate in the environment
            
//            // Your other window setup code here
//
//            // Assign contentView as the root view controller
//            self.tabWindow?.rootViewController = UIHostingController(rootView: contentView)
        }
    }
    
    // Adding Tab Bar as another Window
    func addTabBar(_ windowShareModel: WindowSharedModel) {
        guard let scene = windowScene else {
            return
        }
        
        let tabBarViewController = UIHostingController(rootView:
            CustomBar()
                .environmentObject(windowShareModel)
        )
        tabBarViewController.view.backgroundColor = .red
        
        //Window
        let tabWindow = UIWindow(windowScene: scene)
        tabWindow.rootViewController = tabBarViewController
        tabWindow.isHidden = false
        //Storing ToWindow Reference, For Future Use
        self.tabWindow = tabWindow
        
    }
}

//Create a custom environment key and define it in your SceneDelegate.
struct SceneDelegateKey: EnvironmentKey {
    static let defaultValue: SceneDelegate? = nil
}

extension EnvironmentValues {
    var sceneDelegate: SceneDelegate? {
        get { self[SceneDelegateKey.self] }
        set { self[SceneDelegateKey.self] = newValue }
    }
}
