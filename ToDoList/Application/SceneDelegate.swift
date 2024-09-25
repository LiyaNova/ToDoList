//
//  SceneDelegate.swift
//  for ToDoList
//
//  Created by Iuliia Filimonova on 23.09.2024
//
    
import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    var applicationCoordinator: ApplicationCoordinator?
    
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        if let windowScene = scene as? UIWindowScene {
            let window = UIWindow(windowScene: windowScene)
            applicationCoordinator = ApplicationCoordinator(window: window)
            applicationCoordinator?.start()
        }
    }
    
    func sceneDidEnterBackground(_ scene: UIScene) {
        CoreDataManager.shared.saveContext()
    }    
}

