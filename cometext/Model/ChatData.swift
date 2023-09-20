//
//  ChatData.swift
//  cometext
//
//  Created by 최희진 on 2023/09/17.
//

import Foundation

class ChatData {
    var id : Int
    var date : String
    var title : String
    
    init (id : Int, date : String, title: String){
        self.id = id
        self.date = date
        self.title = title
    }
}
