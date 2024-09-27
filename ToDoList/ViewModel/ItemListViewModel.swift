//
//  ItemListViewModel.swift
//  for ToDoList
//
//  Created by Iuliia Filimonova on 24.09.2024
//
    
import Foundation

protocol ItemListViewModelProtocol {
    var itemsCount: Int { get }
    
    func addItem()
    func getItem(for index: Int) -> Item
}

final class ItemListViewModel: ItemListViewModelProtocol {
    weak var coordinator: CoordinatorProtocol?
    
    var itemsCount: Int {
        items.count
    }
    
    @StateObservable private(set) var items: [Item]
    private let dataStorage = CoreDataManager.shared
    
    init(coordinator: CoordinatorProtocol) {
        self.coordinator = coordinator
        items = dataStorage.read(Item.self)
    }
    
    func getItem(for index: Int) -> Item {
        items[index]
    }
    
    func addItem() {
        coordinator?.openNewItemScreen()
    }
    
}
