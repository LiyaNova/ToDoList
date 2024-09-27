//
//  ItemListViewController.swift
//  for ToDoList
//
//  Created by Iuliia Filimonova on 24.09.2024
//
    
import UIKit

protocol ItemListViewControllerProtocol { }

final class ItemListViewController: UIViewController, ItemListViewControllerProtocol {
    private let tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .plain)
        tableView.backgroundColor = .white
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.rowHeight = UITableView.automaticDimension
        tableView.register(ItemCell.self, forCellReuseIdentifier: ItemCell.id)

        return tableView
    } ()
    
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

        setupUI()
        setDelegates()
        setupConstraints()
        
        bindViewModel()
    }
    
    private func bindViewModel() {
        viewModel.$items.observe(self) { [unowned self] _ in
            tableView.reloadData()
        }
    }
    
    @objc private func addItem() {
        viewModel.addItem()
    }
    
    private func setupUI() {
        view.backgroundColor = .white
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Add", style: .plain, target: self, action: #selector(addItem))
    
        view.addSubview(tableView)
    }
    
    private func setDelegates() {
        tableView.dataSource = self
        tableView.delegate = self
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
    }
}

//MARK: - UITableViewDataSource, UITableViewDelegate
extension ItemListViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.itemsCount
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: ItemCell.id, for: indexPath) as? ItemCell else {
            
            return UITableViewCell()
        }
        
        let item = viewModel.getItem(for: indexPath.row)
        cell.configure(with: item)
        
        return cell
    }    
}
