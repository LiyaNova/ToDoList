//
//  ItemListViewController.swift
//  for ToDoList
//
//  Created by Iuliia Filimonova on 24.09.2024
//
    
import UIKit

protocol ItemListViewControllerProtocol {
    
}

class ItemListViewController: UIViewController, ItemListViewControllerProtocol {
    
    private let viewModel: ItemListViewModel
    
    init(viewModel: ItemListViewModel) {
        self.viewModel = viewModel
        
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

       
    }

}
