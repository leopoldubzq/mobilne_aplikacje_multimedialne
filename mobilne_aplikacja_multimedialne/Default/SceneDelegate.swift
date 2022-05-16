//
//  SceneDelegate.swift
//  mobilne_aplikacja_multimedialne
//
//  Created by Leopold Romanowski on 16/05/2022.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?
    var coordinator: CoordinatorProtocol? {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
            print("The coordinator did not initialize in AppDelegate")
            return nil
        }
        return appDelegate.coordinator
    }

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        window = UIWindow(windowScene: windowScene)
        window?.rootViewController = coordinator?.navigationController
        window?.makeKeyAndVisible()
        coordinator?.showMainScreen()
        
    }
}

