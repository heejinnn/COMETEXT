//
//  CustomCollectionViewCell.swift
//  cometext
//
//  Created by 최희진 on 2023/09/17.
//

import UIKit
import SnapKit

class CustomCollectionViewCell: UICollectionViewCell {
    let filterBtn = UIButton() // UIButton으로 변경
    var isPrimaryColor = false // 초기에는 false로 설정하여 Gray2 색상으로 시작

    override init(frame: CGRect) {
        super.init(frame: frame)
        configureButton() // 메서드 이름 변경

        filterBtn.addTarget(self, action: #selector(changeButtonColor), for: .touchUpInside)
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        configureButton() // 메서드 이름 변경
    }

    private func configureButton() {
        // UIButton 설정
        filterBtn.titleLabel?.textAlignment = .center // 버튼의 titleLabel의 정렬 설정
        filterBtn.setTitleColor(.black, for: .normal) // 일반 상태의 텍스트 색상
        filterBtn.titleLabel?.font = UIFont.systemFont(ofSize: 13)
        filterBtn.translatesAutoresizingMaskIntoConstraints = false
        filterBtn.layer.cornerRadius = 15

        // UIButton을 셀에 추가
        contentView.addSubview(filterBtn)

        // UIButton을 SnapKit을 사용하여 제약 조건을 설정
        filterBtn.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }

        // 초기 배경색 설정
        setButtonBackgroundColor()
    }

    // 셀에 데이터를 설정하기 위한 메서드
    func configure(_ topic: TopicFilter) {
        filterBtn.setTitle(topic.topicName, for: .normal) // 버튼의 텍스트 설정
    }

    @objc func changeButtonColor() {
        isPrimaryColor.toggle()
        setButtonBackgroundColor()
    }

    private func setButtonBackgroundColor() {
        if isPrimaryColor {
            filterBtn.backgroundColor = UIColor(named: "Primary")
        } else {
            filterBtn.backgroundColor = UIColor(named: "Gray2")
        }
    }
}
