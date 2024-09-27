//
//  ApplicationCoordinator.swift
//  for ToDoList
//
//  Created by Iuliia Filimonova on 24.09.2024
//
    
import UIKit

protocol CoordinatorProtocol: AnyObject {
    var navigationController: UINavigationController { get set }
    
    func start()
    func openNewItemScreen()
}

final class ApplicationCoordinator: CoordinatorProtocol {
    var navigationController: UINavigationController
    
    private var itemListViewModel: ItemListViewModelProtocol?
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let itemListViewModel = ItemListViewModel(coordinator: self)
        self.itemListViewModel = itemListViewModel
        
        let itemListViewController = ItemListViewController(viewModel: itemListViewModel)
        navigationController.pushViewController(itemListViewController, animated: true)
    }
    
    func openNewItemScreen() {
        guard let itemListViewModel else { return }
        
        let vc = NewItemViewController(viewModel: itemListViewModel)
        navigationController.pushViewController(vc, animated: true)
    }
}

