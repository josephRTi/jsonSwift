//
//  customCell.swift
//  Network_Layer
//
//  Created by Егор Уваров on 27.03.2021.
//

import UIKit

class customCell: UITableViewCell {
    
    static var reuseId = "personCell"
    var name = "Johny"{
        didSet{
            label.text = name
        }
    }
    private var label: UILabel = {
       var label = UILabel()
        label.textColor = .systemBlue
        label.font = .systemFont(ofSize: 16, weight: .light)
        label.translatesAutoresizingMaskIntoConstraints = false
       return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addSubview(label)
        label.text = name
        NSLayoutConstraint.activate([
            //label.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            label.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 15),
            label.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 15),
            //label.centerYAnchor.constraint(equalTo: contentView.centerYAnchor)
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
