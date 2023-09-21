//
//  ChatDataTableViewCell.swift
//  cometext
//
//  Created by 최희진 on 2023/09/18.
//

import UIKit

class ChatDataTableViewCell: UITableViewCell {
    
    @IBOutlet weak var chatTitleLabel: UILabel!
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        
    }
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    
    func configure(withTitle title: String) {
        chatTitleLabel.text = title
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()

        contentView.frame = contentView.frame.inset(by: UIEdgeInsets(top: 5, left: 10, bottom: 5, right: 10))
        contentView.layer.cornerRadius = 10
        
    }
    
}
