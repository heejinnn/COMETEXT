//
//  SentenceModal.swift
//  cometext
//
//  Created by 최희진 on 2023/09/20.
//

import UIKit
import PanModal

class SentenceModalVC: UIViewController {
    
    let sentenceLabel = UILabel()
    
    let receiveData: [ReceiveData] = ReceiveData.list
    
    var index = 0
   
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        sentenceLabel.text = receiveData[index].entireSentence
        sentenceLabel.numberOfLines = 0
        sentenceLabel.lineBreakMode = .byWordWrapping
        
        view.addSubview(sentenceLabel)
        
        sentenceLabel.snp.makeConstraints{make in
            make.top.equalToSuperview().offset(40)
            make.leading.equalToSuperview().offset(20)
            make.trailing.equalToSuperview().offset(-20)
        }
        index += 1
    }

}
extension SentenceModalVC: PanModalPresentable {

    var panScrollable: UIScrollView? {
        return nil
    }

    var shortFormHeight: PanModalHeight {
        return .contentHeight(400)
    }

    var longFormHeight: PanModalHeight {
        return .maxHeightWithTopInset(0)
    }
}
