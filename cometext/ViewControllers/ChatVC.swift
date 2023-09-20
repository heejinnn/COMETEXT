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
    let sendLabelContainer = UIView()
    
    @IBOutlet weak var progressView: ProgressBarView!
    @IBOutlet weak var inputChatTextView: UITextView!
    @IBOutlet weak var bookFilteringBtn: UIButton!
    @IBOutlet weak var inputChatSendBtn: UIButton!
    @IBOutlet weak var chatDataScrollView: UIScrollView!
 
    
    let receiveData : [ReceiveData] = ReceiveData.list
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationController?.setNavigationBarHidden(false, animated: true)
        
        // 이미지를 설정합니다.
        let imageView = UIImageView(image: UIImage(named: "chat_title"))
        imageView.contentMode = .center // 이미지의 콘텐츠 모드를 조절합니다.

        navigationItem.titleView = imageView
    
        imageView.snp.makeConstraints{make in
            make.width.equalTo(90)
            make.height.equalTo(40)
        }
     
       initStyle()
     
       inputChatTextView.delegate = self
      
       bookFilteringBtn.addTarget(self, action: #selector(showModal), for: .touchUpInside)
       inputChatSendBtn.addTarget(self, action: #selector(addChatData), for: .touchUpInside)
    
       // chatGuideLabel을 초기에 표시합니다.
       chatGuideLabel.isHidden = false
    }
     
     private func initStyle() {
         inputChatTextView.layer.cornerRadius = 20.0 // 원하는 둥근 정도를 설정
         inputChatTextView.isScrollEnabled = true // 텍스트 뷰 내에서 스크롤 가능하도록 설정
         inputChatTextView.textContainerInset = UIEdgeInsets(top: 15, left: 10, bottom: 10, right: 10) // 여백 설정
         inputChatTextView.layer.borderWidth = 1.5
         inputChatTextView.layer.borderColor = UIColor(named: "Gray1")?.cgColor
         
         bookFilteringBtn.layer.cornerRadius = 20.0
         bookFilteringBtn.layer.masksToBounds = true
         bookFilteringBtn.layer.borderWidth = 1.5
         bookFilteringBtn.layer.borderColor = UIColor(named: "Gray1")?.cgColor
         
         inputChatSendBtn.layer.cornerRadius = 20.0
         inputChatSendBtn.layer.masksToBounds = true
         inputChatSendBtn.layer.borderWidth = 1.5
         inputChatSendBtn.layer.borderColor = UIColor(named: "Gray1")?.cgColor
         
         sendLabelContainer.backgroundColor = .white
         sendLabelContainer.layer.cornerRadius = 10
         
         chatGuideLabel.text = "안녕! 도서 문장을 입력해보세요 :)"
         chatGuideLabel.font = UIFont.systemFont(ofSize: 16)
         
         sendLabelContainer.addSubview(chatGuideLabel)
         view.addSubview(sendLabelContainer)
         
         sendLabelContainer.snp.makeConstraints { make in
             make.leading.equalTo(view.snp.leading).offset(20) // 왼쪽 여백 추가
             make.top.equalTo(chatDataScrollView.snp.bottom).offset(-80)
             make.width.equalTo(250) // 여백 추가
             make.height.equalTo(60) // 여백 추가
         }
         
         placeholderLabel.text = "채팅을 입력하세요."
         placeholderLabel.textColor = UIColor.lightGray
         placeholderLabel.font = UIFont.systemFont(ofSize: 13)
         view.addSubview(placeholderLabel)
         
         placeholderLabel.snp.makeConstraints { make in
             make.leading.equalTo(inputChatTextView.snp.leading).offset(15)
             make.centerY.equalTo(inputChatTextView.snp.centerY)
         }
         
         chatGuideLabel.snp.makeConstraints { make in
             make.edges.equalToSuperview().inset(UIEdgeInsets(top: 10, left: 20, bottom: 10, right: 10))
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
                 make.edges.equalToSuperview().inset(UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 0))
             }

             // UIScrollView의 contentSize 업데이트
             chatDataScrollView.contentSize.height += messageContainer.frame.height + labelheight + 30 // 여백 추가
             
             
             DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
                 // 2초 뒤에 실행될 코드
                 self.receiveDataLayout()
             }
         }
     }
    
    func receiveDataLayout(){
        let receiveLabelContainer = UIView()
        receiveLabelContainer.backgroundColor = UIColor(named: "Gray2")
        receiveLabelContainer.layer.cornerRadius = 10
        
        let bookStackView = UIStackView()
        bookStackView.backgroundColor = UIColor(named: "Gray2")
        bookStackView.axis = .vertical // 수직 정렬로 설정
        bookStackView.spacing = 10 // 각 뷰 사이의 간격 설정
        bookStackView.alignment = .leading // 정렬 방식 설정
       
        // 레이블 생성 및 설정
        let bookSectionLabel = UILabel()
        bookSectionLabel.text = "도서 정보"
        bookSectionLabel.font = UIFont.boldSystemFont(ofSize: 20)
        
        let name = UILabel()
        name.text = "제목: \(receiveData[0].name)"
        name.numberOfLines = 0
        name.lineBreakMode = .byWordWrapping
       
        let author = UILabel()
        author.text = "저자: \(receiveData[0].author)"
        author.numberOfLines = 0
        author.lineBreakMode = .byWordWrapping
       
        let summary = UILabel()
        summary.text = "줄거리: \(receiveData[0].summary)"
        summary.numberOfLines = 0
        summary.lineBreakMode = .byWordWrapping
       
        // 스택뷰에 레이블 추가
        bookStackView.addArrangedSubview(bookSectionLabel)
        bookStackView.addArrangedSubview(name)
        bookStackView.addArrangedSubview(author)
        bookStackView.addArrangedSubview(summary)
        
        receiveLabelContainer.addSubview(bookStackView)
        chatDataScrollView.addSubview(receiveLabelContainer)
        
        receiveLabelContainer.snp.makeConstraints { make in
            make.leading.equalTo(view.snp.leading).offset(20) // 왼쪽 여백 추가
            make.top.equalTo(chatDataScrollView.contentSize.height + 40)
            make.trailing.equalTo(view.snp.trailing).offset(-70)
        }

        bookStackView.snp.makeConstraints { make in
            make.edges.equalToSuperview().inset(UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10))
        }
        
        let receiveSentenceContainer = UIView()
        receiveSentenceContainer.backgroundColor = UIColor(named: "Gray2")
        receiveSentenceContainer.layer.cornerRadius = 10
        
        let sentenceStackView = UIStackView()
        sentenceStackView.backgroundColor = UIColor(named: "Gray2")
        sentenceStackView.axis = .vertical // 수직 정렬로 설정
        sentenceStackView.spacing = 10 // 각 뷰 사이의 간격 설정
        sentenceStackView.alignment = .leading // 정렬 방식 설정
        sentenceStackView.distribution = .fill

        let sentenceSectionLabel = UILabel()
        sentenceSectionLabel.text = "유사 문장"
        sentenceSectionLabel.font = UIFont.boldSystemFont(ofSize: 20)

        let sentence = UILabel()
        sentence.text = receiveData[0].similarSentence
        sentence.numberOfLines = 0
        sentence.lineBreakMode = .byWordWrapping

        let seeMoreContainer = UIView() // 버튼을 감싸는 컨테이너 뷰 추가
        let seeMoreBtn = UIButton()
        seeMoreBtn.setTitle("더보기", for: .normal)
        seeMoreBtn.titleLabel?.font = UIFont.systemFont(ofSize: 13)
        seeMoreBtn.setTitleColor(.black, for: .normal)
        seeMoreBtn.backgroundColor = UIColor(named: "Gray1")
        seeMoreBtn.layer.cornerRadius = 15
        seeMoreContainer.addSubview(seeMoreBtn) // 버튼을 컨테이너 뷰에 추가
        
        seeMoreBtn.addTarget(self, action: #selector(showSentenceModal), for: .touchUpInside)

        sentenceStackView.addArrangedSubview(sentenceSectionLabel)
        sentenceStackView.addArrangedSubview(sentence)
        sentenceStackView.addArrangedSubview(seeMoreContainer) // 컨테이너 뷰를 stackview에 추가

        seeMoreBtn.snp.makeConstraints{make in
            make.width.equalTo(50)
            make.height.equalTo(20)
            make.trailing.equalTo(sentenceStackView.snp.trailing)
        }
        
        // 컨테이너 뷰의 오른쪽 정렬 제약 조건 추가
        seeMoreContainer.snp.makeConstraints { make in
            make.trailing.equalTo(sentenceStackView.snp.trailing).offset(-10) // stackview의 오른쪽에 정렬
            make.height.equalTo(20)
        }
        
        receiveSentenceContainer.addSubview(sentenceStackView)
        chatDataScrollView.addSubview(receiveSentenceContainer)
        
        receiveSentenceContainer.snp.makeConstraints { make in
            make.leading.equalTo(view.snp.leading).offset(20) // 왼쪽 여백 추가
            make.top.equalTo(chatDataScrollView.contentSize.height + receiveLabelContainer.systemLayoutSizeFitting(UIView.layoutFittingCompressedSize).height + 60)
            make.trailing.equalTo(view.snp.trailing).offset(-70)
        }

        sentenceStackView.snp.makeConstraints { make in
            make.edges.equalToSuperview().inset(UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10))
        }
        
        chatDataScrollView.contentSize.height += receiveLabelContainer.systemLayoutSizeFitting(UIView.layoutFittingCompressedSize).height + receiveSentenceContainer.systemLayoutSizeFitting(UIView.layoutFittingCompressedSize).height + 70  // 여백 추가
    }
    
    @objc func showSentenceModal() {
        let sentenceModalVC = SentenceModalVC()
        self.presentPanModal(sentenceModalVC)
    }

}

extension ChatVC: UITextViewDelegate {
    func textViewDidChange(_ textView: UITextView) {
        // UITextView의 내용이 변경될 때 placeholderLabel을 숨기거나 표시
        placeholderLabel.isHidden = !inputChatTextView.text.isEmpty
        sendLabelContainer.isHidden = !inputChatTextView.text.isEmpty
        sendLabelContainer.isHidden = true
    }
}







