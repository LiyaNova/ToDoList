//
//  ItemCell.swift
//  for ToDoList
//
//  Created by Iuliia Filimonova on 25.09.2024
//
    
import UIKit

final class ItemCell: UITableViewCell {
    static var id: String = UUID().uuidString
    
    private let textVStack: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.spacing = 5
        
        return stack
    }()
    
    private let cellHStack: UIStackView = {
        let stack = UIStackView()
        stack.spacing = 8
        
        return stack
    }()
    
    private let checkImage: UIImageView = {
        let img = UIImageView()
        
        return img
    }()
    
    private let titleLbl: UILabel = {
        let lbl = UILabel()
        lbl.font = UIFont.boldSystemFont(ofSize: 16)
        
        return lbl
    }()
    
    private let descriptionLbl: UILabel = {
        let lbl = UILabel()
        lbl.font = UIFont.systemFont(ofSize: 14)
        
        return lbl
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupUI()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(with item: Item) {
        titleLbl.text = item.title
        descriptionLbl.text = item.text
        checkImage.image = item.isDone ? UIImage(systemName: "checkmark.circle") : UIImage(systemName: "circle")
    }
    
    private func setupUI() {
        contentView.backgroundColor = .white
        
        contentView.addSubview(cellHStack)
        cellHStack.addArrangedSubview(checkImage)
        cellHStack.addArrangedSubview(textVStack)
        textVStack.addArrangedSubview(titleLbl)
        textVStack.addArrangedSubview(descriptionLbl)
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            checkImage.heightAnchor.constraint(equalToConstant: 40),
            checkImage.widthAnchor.constraint(equalToConstant: 40),
            cellHStack.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 5),
            cellHStack.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -5),
            cellHStack.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 8),
            cellHStack.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -8)
        ])
    }
    
}
