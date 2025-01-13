//
//  SearchTable.swift
//  Collage Maker
//
//  Created by Naveed Khalid on 13/01/2025.
//


import UIKit

class SearchTable: UITableViewCell {
    
    let cellLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 12, weight: .regular)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = UIColor(named: "subHead")
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.backgroundColor = .clear
        backgroundColor = .clear
        
        let selectedBackgroundView = UIView()
        selectedBackgroundView.backgroundColor = .clear
        self.selectedBackgroundView = selectedBackgroundView
        
        contentView.addSubview(cellLabel)
        NSLayoutConstraint.activate([
            cellLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            cellLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor)
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
