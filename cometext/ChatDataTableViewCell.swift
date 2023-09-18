//
//  ChatDataTableViewCell.swift
//  cometext
//
//  Created by 최희진 on 2023/09/18.
//

import UIKit

class ChatDataTableViewCell: UITableViewCell {
    
    @IBOutlet weak var chatTitleLabel: UILabel!
    
    func configure(withTitle title: String) {
        chatTitleLabel.text = title
    }
}
