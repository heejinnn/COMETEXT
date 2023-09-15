//
//  ChatVC.swift
//  cometext
//
//  Created by 최희진 on 2023/09/16.
//

import UIKit
import PanModal

class ChatVC: UIViewController{
    
    @IBOutlet weak var inputChatTextField: UITextField!
    @IBOutlet weak var bookFilteringBtn: UIButton!
    @IBOutlet weak var inputChatSendBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initStyle()
        
        bookFilteringBtn.addTarget(self, action: #selector(showModal), for: .touchUpInside)
        
    }
    
    private func initStyle(){
        inputChatTextField.layer.cornerRadius = 17.0 // 원하는 둥근 정도를 설정
        inputChatTextField.layer.masksToBounds = true // 둥근 모양을 적용
        inputChatTextField.layer.borderWidth = 1.5
        inputChatTextField.layer.borderColor = UIColor(named: "Gray1")?.cgColor
        
        bookFilteringBtn.layer.cornerRadius = 17.0
        bookFilteringBtn.layer.masksToBounds = true
        bookFilteringBtn.layer.borderWidth = 1.5
        bookFilteringBtn.layer.borderColor = UIColor(named: "Gray1")?.cgColor
        
        inputChatSendBtn.layer.cornerRadius = 17.0
        inputChatSendBtn.layer.masksToBounds = true
        inputChatSendBtn.layer.borderWidth = 1.5
        inputChatSendBtn.layer.borderColor = UIColor(named: "Gray1")?.cgColor
    }
    
    @objc func showModal() {
       let filtermodalVC = FilterModalVC()
          self.presentPanModal(filtermodalVC)
   }
    
}


