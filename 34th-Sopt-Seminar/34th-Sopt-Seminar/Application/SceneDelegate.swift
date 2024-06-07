//
//  SceneDelegate.swift
//  34th-Sopt-Seminar
//
//  Created by 조혜린 on 3/30/24.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    
    var window: UIWindow?
    
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        

        guard let windowScene = (scene as? UIWindowScene) else { return }

        self.window = UIWindow(windowScene: windowScene)
        
        let viewController = LoginViewController_SnapKit()

        let navigationController = UINavigationController(rootViewController: viewController)
        self.window?.rootViewController = navigationController

        self.window?.makeKeyAndVisible()
    }
}
