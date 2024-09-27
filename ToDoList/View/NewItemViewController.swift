//
//  NewItemViewController.swift
//  for ToDoList
//
//  Created by Iuliia Filimonova on 26.09.2024
//
    
import UIKit

protocol NewItemViewControllerProtocol { }

final class NewItemViewController: UIViewController, NewItemViewControllerProtocol {
    
    private let viewModel: ItemListViewModelProtocol
    
    init(viewModel: ItemListViewModelProtocol) {
        self.viewModel = viewModel
        
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
    }
    
    @objc private func saveItem() {
        //TODO
    }
    
    private func setupUI() {
        view.backgroundColor = .white
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Save", style: .plain, target: self, action: #selector(saveItem))
    }
    
}
