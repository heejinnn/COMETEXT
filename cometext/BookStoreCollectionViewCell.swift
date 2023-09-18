//
//  BookStoreCollectionViewCell.swift
//  cometext
//
//  Created by 최희진 on 2023/09/15.
//

import UIKit

class BookStoreCollectionViewCell: UICollectionViewCell {

    
    @IBOutlet weak var bookStoreImg: UIImageView!
    
    @IBOutlet weak var bookStoreName: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        layer.cornerRadius = 10.0 // 원하는 둥근 정도 값으로 수정하세요.
        layer.borderWidth = 1.0 // 테두리 두께를 조절하려면 원하는 값으로 수정하세요.
        layer.borderColor = UIColor(named: "Gray1")?.cgColor
    }
    
    func configure(_ bookStore: BookStoreModel){
        bookStoreImg?.image = bookStore.imgName
        bookStoreName?.text = bookStore.storeName
    }

}
