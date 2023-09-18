//
//  ChatVC.swift
//  cometext
//
//  Created by 최희진 on 2023/09/16.
//

import UIKit
import PanModal
import SnapKit

class ChatVC: UIViewController{
    
    let placeholderLabel = UILabel()
    let chatGuideLabel = UILabel()
    let labelContainer = UIView()
    
    
    @IBOutlet weak var progressView: ProgressBarView!
    @IBOutlet weak var inputChatTextView: UITextView!
    @IBOutlet weak var bookFilteringBtn: UIButton!
    @IBOutlet weak var inputChatSendBtn: UIButton!
    @IBOutlet weak var chatDataScrollView: UIScrollView!
 
    
    struct receiveData{
        let name : String
        let author : String
        let summary : String
        
    }
    // 첫 번째 데이터 소스
    let receive: [receiveData] = [
        receiveData(name: "dd", author: "esds", summary: "dsfsdfsfsfssfs")
    ]
    
    override func viewDidLoad() {
         super.viewDidLoad()
         initStyle()
         
         inputChatTextView.delegate = self
         
         bookFilteringBtn.addTarget(self, action: #selector(showModal), for: .touchUpInside)
         inputChatSendBtn.addTarget(self, action: #selector(addChatData), for: .touchUpInside)
        
         // chatGuideLabel을 초기에 표시합니다.
         chatGuideLabel.isHidden = false
     }
     
     private func initStyle() {
         inputChatTextView.layer.cornerRadius = 17.0 // 원하는 둥근 정도를 설정
         inputChatTextView.isScrollEnabled = true // 텍스트 뷰 내에서 스크롤 가능하도록 설정
         inputChatTextView.textContainerInset = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10) // 여백 설정
         inputChatTextView.layer.borderWidth = 1.5
         inputChatTextView.layer.borderColor = UIColor(named: "Gray1")?.cgColor
         
         bookFilteringBtn.layer.cornerRadius = 17.0
         bookFilteringBtn.layer.masksToBounds = true
         bookFilteringBtn.layer.borderWidth = 1.5
         bookFilteringBtn.layer.borderColor = UIColor(named: "Gray1")?.cgColor
         
         inputChatSendBtn.layer.cornerRadius = 17.0
         inputChatSendBtn.layer.masksToBounds = true
         inputChatSendBtn.layer.borderWidth = 1.5
         inputChatSendBtn.layer.borderColor = UIColor(named: "Gray1")?.cgColor
         
         labelContainer.backgroundColor = .white
         labelContainer.layer.cornerRadius = 10
         
         chatGuideLabel.text = "안녕! 도서 문장을 입력해보세요 :)"
         chatGuideLabel.font = UIFont.systemFont(ofSize: 16)
         
         labelContainer.addSubview(chatGuideLabel)
         view.addSubview(labelContainer)
         
         labelContainer.snp.makeConstraints { make in
             make.leading.equalTo(view.snp.leading).offset(20) // 왼쪽 여백 추가
             make.top.equalTo(chatDataScrollView.snp.bottom).offset(-80)
             make.width.equalTo(250) // 여백 추가
             make.height.equalTo(60) // 여백 추가
         }
         
         chatGuideLabel.snp.makeConstraints { make in
             make.edges.equalToSuperview().inset(UIEdgeInsets(top: 10, left: 20, bottom: 10, right: 10))
         }
         
         placeholderLabel.text = "채팅을 입력하세요."
         placeholderLabel.textColor = UIColor.lightGray
         placeholderLabel.font = UIFont.systemFont(ofSize: 13)
         view.addSubview(placeholderLabel)
         
         placeholderLabel.snp.makeConstraints { make in
             make.leading.equalTo(inputChatTextView.snp.leading).offset(15)
             make.centerY.equalTo(inputChatTextView.snp.centerY)
         }
     }
     
     @objc func showModal() {
         let filtermodalVC = FilterModalVC()
         self.presentPanModal(filtermodalVC)
     }
     
     @objc func addChatData() {
         progressView.fillProgressBar(duration: 2.0)
         // UITextView에서 입력된 데이터 가져오기
         if let text = inputChatTextView.text, !text.isEmpty {
             
             // 새로운 UIView 생성 및 설정
             let messageContainer = UIView()
             messageContainer.backgroundColor = UIColor(named: "Primary")
             messageContainer.layer.cornerRadius = 10

             // UILabel을 messageContainer 위에 추가
             let sendMessage = UILabel()
             sendMessage.text = text
             sendMessage.numberOfLines = 0 // 여러 줄 허용
             sendMessage.lineBreakMode = .byWordWrapping // 단어 단위로 줄 바꿈

             // 텍스트의 크기를 계산하여 label의 width를 설정
             let labelMaxWidth = chatDataScrollView.bounds.width - 115 // 최대 허용 너비
             let textRect = text.boundingRect(with: CGSize(width: labelMaxWidth, height: .greatestFiniteMagnitude),
                                              options: .usesLineFragmentOrigin,
                                              attributes: [NSAttributedString.Key.font: sendMessage.font!],
                                              context: nil)
             let labelWidth = textRect.width // 텍스트의 실제 너비
             let labelheight = textRect.height

             // UILabel을 messageContainer에 추가
             messageContainer.addSubview(sendMessage)

             // messageContainer를 UIScrollView에 추가
             chatDataScrollView.addSubview(messageContainer)

             // SnapKit을 사용하여 레이아웃 설정
             messageContainer.snp.makeConstraints { make in
                 make.trailing.equalTo(view.snp.trailing).offset(-20) // 왼쪽 여백 추가
                 make.top.equalTo(chatDataScrollView.contentSize.height + 20)
                 make.width.equalTo(labelWidth + 20) // 여백 추가
                 make.height.equalTo(textRect.height + 20) // 여백 추가
             }

             sendMessage.snp.makeConstraints { make in
                 make.edges.equalToSuperview().inset(UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10))
             }

             // UIScrollView의 contentSize 업데이트
             chatDataScrollView.contentSize.height += messageContainer.frame.height + labelheight + 30 // 여백 추가
         }
     }

}

extension ChatVC: UITextViewDelegate {
    func textViewDidChange(_ textView: UITextView) {
        // UITextView의 내용이 변경될 때 placeholderLabel을 숨기거나 표시
        placeholderLabel.isHidden = !inputChatTextView.text.isEmpty
        labelContainer.isHidden = !inputChatTextView.text.isEmpty
        labelContainer.isHidden = true
    }
}







