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
        BookStoreModel(id: 1, storeName: "인터파크", imgName: UIImage(named: "interpark")!),
        BookStoreModel(id: 2, storeName: "예스 24", imgName: UIImage(named: "yes24")!),
        BookStoreModel(id: 3, storeName: "알라딘", imgName: UIImage(named: "aladdin")!),
        BookStoreModel(id: 4, storeName: "교보문고", imgName: UIImage(named: "kyobo")!),
        BookStoreModel(id: 5, storeName: "영풍문고", imgName: UIImage(named: "yeongpung")!)
    ]
}

struct newBookInfo {
    let id: Int
    let imgName: UIImage
}

extension newBookInfo{
    static let list: [newBookInfo] = [
        newBookInfo(id: 1, imgName: UIImage(named: "book1")!),
        newBookInfo(id: 2, imgName: UIImage(named: "book2")!),
        newBookInfo(id: 3, imgName: UIImage(named: "book3")!),
        newBookInfo(id: 4, imgName: UIImage(named: "book4")!),
        newBookInfo(id: 5, imgName: UIImage(named: "book5")!)
    ]
}

