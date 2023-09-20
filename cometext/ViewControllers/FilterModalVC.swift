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
    
    var dataSource1: [TopicFilter] = []
    var dataSource2: [TopicFilter] = []
    var dataSource3: [TopicFilter] = []
    
    let guideLabel = UILabel()
    let subjectLabel = UILabel()
    let bookLabel = UILabel()
    let yearLabel = UILabel()
    
    let collectionView1: UICollectionView = {
        
        let layout = UICollectionViewFlowLayout()
        layout.minimumLineSpacing = 10
        
        layout.scrollDirection = .vertical
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
        
        view.addSubview(guideLabel)
        view.addSubview(subjectLabel)
        view.addSubview(bookLabel)
        view.addSubview(yearLabel)
        view.addSubview(collectionView1)
        view.addSubview(collectionView2)
        view.addSubview(collectionView3)
        
        // collectionView1의 데이터 소스 설정
        dataSource1 = TopicFilter.list1 // 첫 번째 데이터 소스 사용

        // collectionView2의 데이터 소스 설정
        dataSource2 = TopicFilter.list2 // 두 번째 데이터 소스 사용

        // collectionView3의 데이터 소스 설정
        dataSource3 = TopicFilter.list3 // 세 번째 데이터 소스 사용

        configureCollectionView(collectionView: collectionView1)
        configureCollectionView(collectionView: collectionView2)
        configureCollectionView(collectionView: collectionView3)

        
        guideLabel.text = "더 정밀한 도서추천을 해드릴게요!"
        guideLabel.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        guideLabel.textAlignment = .center
        
        subjectLabel.text = "주제"
        subjectLabel.font = UIFont.systemFont(ofSize: 15)
        
        bookLabel.text = "도서 종류"
        bookLabel.font = UIFont.systemFont(ofSize: 15)
        
        yearLabel.text = "연도"
        yearLabel.font = UIFont.systemFont(ofSize: 15)
         
        guideLabel.snp.makeConstraints{make in
            make.top.equalToSuperview().offset(30)
            make.left.equalToSuperview().offset(20)
            make.right.equalToSuperview().offset(-20)
            make.height.equalTo(30)
        }
        
        subjectLabel.snp.makeConstraints{make in
            make.top.equalTo(guideLabel.snp.bottom).offset(20)
            make.left.equalToSuperview().offset(15)
        }
    
        collectionView1.snp.makeConstraints { make in
            make.top.equalTo(subjectLabel.snp.bottom).offset(20)
            make.left.equalToSuperview().offset(20)
            make.right.equalToSuperview().offset(-20)
            make.height.equalTo(150)
        }
        
        bookLabel.snp.makeConstraints{make in
            make.top.equalTo(collectionView1.snp.bottom).offset(20)
            make.left.equalToSuperview().offset(15)
        }
        
        collectionView2.snp.makeConstraints { make in
            make.top.equalTo(bookLabel.snp.bottom).offset(20)
            make.left.equalToSuperview().offset(20)
            make.right.equalToSuperview().offset(-20)
            make.height.equalTo(130)
        }
        
        yearLabel.snp.makeConstraints{make in
            make.top.equalTo(collectionView2.snp.bottom).offset(20)
            make.left.equalToSuperview().offset(15)
        }
        
        collectionView3.snp.makeConstraints { make in
            make.top.equalTo(yearLabel.snp.bottom).offset(20)
            make.left.equalToSuperview().offset(20)
            make.right.equalToSuperview().offset(-20)
            make.height.equalTo(150)
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
        switch collectionView {
        case collectionView1:
            return dataSource1.count
        case collectionView2:
            return dataSource2.count
        case collectionView3:
            return dataSource3.count
        default:
            return 0
        }
   }

   func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
       // 커스텀 셀 반환
       let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CustomCollectionViewCell", for: indexPath) as! CustomCollectionViewCell

      var topic: TopicFilter?

      switch collectionView {
      case collectionView1:
          topic = dataSource1[indexPath.item]
      case collectionView2:
          topic = dataSource2[indexPath.item]
      case collectionView3:
          topic = dataSource3[indexPath.item]
      default:
          break
      }

      // 셀에 데이터를 설정
      if let topic = topic {
          cell.configure(topic)
      }

      return cell
   }
}
extension FilterModalVC: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        // 각 셀의 크기 설정
        return CGSize(width: 100, height: 30)
    }
}



