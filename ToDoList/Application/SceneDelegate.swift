//
//  SceneDelegate.swift
//  for ToDoList
//
//  Created by Iuliia Filimonova on 23.09.2024
//
    
import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    var window: UIWindow?
    var applicationCoordinator: ApplicationCoordinator?
    
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        if let windowScene = scene as? UIWindowScene {
            let navController = UINavigationController()
            applicationCoordinator = ApplicationCoordinator(navigationController: navController)
            applicationCoordinator?.start()
            
            window = UIWindow(windowScene: windowScene)
            window?.rootViewController = navController
            window?.makeKeyAndVisible()
        }
    }
    
    func sceneDidEnterBackground(_ scene: UIScene) {
        CoreDataManager.shared.saveContext()
    }    
}

