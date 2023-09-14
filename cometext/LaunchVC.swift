

import UIKit
import SnapKit

class LaunchVC: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor(named: "Primary")
        
        stackLabelView()
    }
    private func stackLabelView(){
        let stackView = UIStackView()
        stackView.axis = .vertical // 수직 정렬
        stackView.spacing = 10 // 버튼 사이의 간격
        stackView.alignment = .center // 중앙 정렬
        stackView.distribution = .fillEqually // 버튼 사이즈를 동일하게 분배

        // 라벨 2개 생성
        let mainLabel = UILabel()
        mainLabel.text = "COMETEXT"
        mainLabel.font = UIFont.systemFont(ofSize: 14)
        mainLabel.textColor = .black
        
        let subLabel = UILabel()
        subLabel.text = "COMETEXT"
        subLabel.font = UIFont.systemFont(ofSize: 14)
        subLabel.textColor = .black

        // UIStackView에 라벨 추가
        stackView.addArrangedSubview(mainLabel)
        stackView.addArrangedSubview(subLabel)

        // UIStackView를 뷰에 추가
        view.addSubview(stackView)

        // UIStackView의 제약 조건 설정
        stackView.snp.makeConstraints { make in
            make.centerX.equalToSuperview() // 수평 중앙 정렬
            make.centerY.equalToSuperview()
        }
    }
}


