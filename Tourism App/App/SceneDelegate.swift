//
//  SceneDelegate.swift
//  Tourism App
//
//  Created by Amin faruq on 02/11/20.
//

import UIKit
import SwiftUI
import RealmSwift

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    
    var window: UIWindow?
    
    
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        
        let homeUseCase = Injection.init().provideHome()
        let homePresenter = HomePresenter(homeUseCase: homeUseCase)
        
        let contentView = BaseView()
            .environmentObject(homePresenter)
                    
        
        // Use a UIHostingController as window root view controller.
        if let windowScene = scene as? UIWindowScene {
            let window = UIWindow(windowScene: windowScene)
            window.rootViewController = UIHostingController(rootView: contentView)
            self.window = window
            window.makeKeyAndVisible()
        }
    }
    
}

