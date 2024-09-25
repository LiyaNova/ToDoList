//
//  ApplicationCoordinator.swift
//  for ToDoList
//
//  Created by Iuliia Filimonova on 24.09.2024
//
    
import UIKit

final class ApplicationCoordinator: CoordinatorProtocol {
    private let window: UIWindow
    private var itemListViewController: ItemListViewController?
    private var itemListViewModel: ItemListViewModelProtocol?
    
    init(window: UIWindow) {
        self.window = window
    }
    
    func start() {
        let itemListViewModel = ItemListViewModel()
        self.itemListViewModel = itemListViewModel
        itemListViewController = ItemListViewController(viewModel: itemListViewModel)
        
        window.rootViewController = itemListViewController
        window.makeKeyAndVisible()
        
        bindNavigationEvents()
    }
    
    private func bindNavigationEvents() {
        //TODO
    }
}

