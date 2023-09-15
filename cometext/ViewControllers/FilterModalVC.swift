//
//  FilterModalVC.swift
//  cometext
//
//  Created by 최희진 on 2023/09/16.
//

import UIKit
import PanModal
import SnapKit


class FilterModalVC: UIViewController {
    
    let topicFilter : [TopicFilter] = TopicFilter.list
    
    let collectionView1: UICollectionView = {
        
        let layout = UICollectionViewFlowLayout()
        layout.minimumLineSpacing = 10
        
        layout.scrollDirection = .horizontal
        layout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
       
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        
        return cv
    }()
    
    let collectionView2: UICollectionView = {
        
        let layout = UICollectionViewFlowLayout()
        layout.minimumLineSpacing = 10
        
        layout.scrollDirection = .vertical
        layout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
       
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        
        return cv
    }()
    let collectionView3: UICollectionView = {
        
        let layout = UICollectionViewFlowLayout()
        layout.minimumLineSpacing = 10
        
        layout.scrollDirection = .vertical
        layout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
       
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        
        return cv
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white

        configureCollectionView(collectionView: collectionView1)
        configureCollectionView(collectionView: collectionView2)
        configureCollectionView(collectionView: collectionView3)

        view.addSubview(collectionView1)
        view.addSubview(collectionView2)
        view.addSubview(collectionView3)

        // Layout and position your UICollectionViews as needed using SnapKit
        collectionView1.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(20)
            make.left.equalToSuperview().offset(20)
            make.right.equalToSuperview().offset(-20)
            make.height.equalTo(100)
        }
        collectionView2.snp.makeConstraints { make in
            make.top.equalTo(collectionView1.snp.bottom).offset(20)
            make.left.equalToSuperview().offset(20)
            make.right.equalToSuperview().offset(-20)
            make.height.equalTo(100)
        }
        collectionView3.snp.makeConstraints { make in
            make.top.equalTo(collectionView2.snp.bottom).offset(20)
            make.left.equalToSuperview().offset(20)
            make.right.equalToSuperview().offset(-20)
            make.height.equalTo(100)
        }
    }
    private func configureCollectionView(collectionView: UICollectionView) {
       // Configure your UICollectionViews here
       collectionView.backgroundColor = .white
       collectionView.dataSource = self
       collectionView.delegate = self
       collectionView.register(CustomCollectionViewCell.self, forCellWithReuseIdentifier: "CustomCollectionViewCell")
 
   }

}
extension FilterModalVC: PanModalPresentable {

    var panScrollable: UIScrollView? {
        return nil
    }

    var shortFormHeight: PanModalHeight {
        return .contentHeight(600)
    }

    var longFormHeight: PanModalHeight {
        return .maxHeightWithTopInset(0)
    }
}

extension FilterModalVC: UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
           // 각 UICollectionView의 셀 개수 반환
            return topicFilter.count
       }

       func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
           // 커스텀 셀 반환
           let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CustomCollectionViewCell", for: indexPath) as! CustomCollectionViewCell

           let data = topicFilter[indexPath.item]
           cell.configure(data)
           
           return cell
       }
}
extension FilterModalVC: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        // 각 셀의 크기 설정
        return CGSize(width: 80, height: 80)
    }
}

// 커스텀 UICollectionViewCell
class CustomCollectionViewCell: UICollectionViewCell {
    let label = UILabel()

       override init(frame: CGRect) {
           super.init(frame: frame)
           configureLabel()
       }

       required init?(coder: NSCoder) {
           super.init(coder: coder)
           configureLabel()
       }

       private func configureLabel() {
           // UILabel 설정
           label.textAlignment = .center
           label.textColor = .black
           label.font = UIFont.systemFont(ofSize: 16)
           label.translatesAutoresizingMaskIntoConstraints = false

           // UILabel을 셀에 추가
           contentView.addSubview(label)

           // UILabel을 SnapKit을 사용하여 제약 조건을 설정
           label.snp.makeConstraints { make in
               make.edges.equalToSuperview()
           }
       }
    func configure(_ topic: TopicFilter){
        label.text = topic.topicName
    }
}


