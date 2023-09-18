//
//  BookStoreModel.swift
//  cometext
//
//  Created by 최희진 on 2023/09/15.
//

import UIKit

struct BookStoreModel{
    let id: Int
    let storeName: String
    let imgName: UIImage
    
}
extension BookStoreModel{
    static let list: [BookStoreModel] = [
        BookStoreModel(id: 1, storeName: "인터파크", imgName: UIImage(named: "chat")!),
        BookStoreModel(id: 2, storeName: "예스 24", imgName: UIImage(named: "chat")!),
        BookStoreModel(id: 3, storeName: "알라딘", imgName: UIImage(named: "chat")!),
        BookStoreModel(id: 4, storeName: "교보문고", imgName: UIImage(named: "chat")!),
        BookStoreModel(id: 5, storeName: "영풍문고", imgName: UIImage(named: "chat")!)
    ]
}



