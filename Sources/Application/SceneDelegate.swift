//
//  SceneDelegate.swift
//  App
//
//  Created by Yujin Kim on 2024-02-29.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    var window: UIWindow?
    var scene: UIScene?

    func scene(
        _ scene: UIScene,
        willConnectTo session: UISceneSession,
        options connectionOptions: UIScene.ConnectionOptions
    ) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        
        self.setRootViewController(rootViewController: MainViewController())
    }

    func sceneDidDisconnect(_ scene: UIScene) {}

    func sceneDidBecomeActive(_ scene: UIScene) {}

    func sceneWillResignActive(_ scene: UIScene) {}

    func sceneWillEnterForeground(_ scene: UIScene) {}

    func sceneDidEnterBackground(_ scene: UIScene) {}
}

extension SceneDelegate {
    private func setRootViewController(rootViewController: UIViewController) {
        if let scene = (self.scene as? UIWindowScene) {
            self.window = UIWindow(frame: scene.coordinateSpace.bounds)
            self.window?.windowScene = scene
            self.window?.rootViewController = rootViewController
            self.window?.makeKeyAndVisible()
            
            debugPrint("\(#function) -- Scene connection succeeded.")
        } else {
            debugPrint("\(#function) -- Scene connection failed.")
        }
    }
}
