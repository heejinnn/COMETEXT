//
//  MainVC.swift
//  cometext
//
//  Created by 최희진 on 2023/09/15.
//

import UIKit
import SnapKit

class MainVC: UIViewController{
    let bookStoreList : [BookStoreModel] = BookStoreModel.list
    
    @IBOutlet weak var bookStoreCollectionView: UICollectionView!
    @IBOutlet weak var newChatBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //back버튼 스타일 지정
        self.navigationController?.navigationBar.tintColor = .black
        self.navigationController?.navigationBar.topItem?.title = " "
        self.navigationController?.navigationBar.backgroundColor = .white
        
        newChatBtn.layer.cornerRadius = 15
            
        
        //Data, Presentation 을 알려줌
        bookStoreCollectionView.dataSource = self

        // Layout 을 알려줌
        bookStoreCollectionView.delegate = self
        
    }
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.setNavigationBarHidden(true, animated: true)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        print(segue.destination)
            if let destinationVC = segue.destination as? ChatVC {
                // ChatVC로 이동하기 전에 Tab Bar 숨기기
                
                destinationVC.hidesBottomBarWhenPushed = true
            }
        }
}

extension MainVC: UICollectionViewDataSource{

    //섹션에 넣을 아이템 개수
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return bookStoreList.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        // 재사용 가능한 셀을 가져옴 (indexPath 번째)
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "BookStoreCollectionViewCell", for: indexPath) as! BookStoreCollectionViewCell

        let data = bookStoreList[indexPath.item]
        cell.configure(data)
        return cell
    }

}

extension MainVC: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        let spacing: CGFloat = 10.0 // 원하는 간격 값으로 수정
        return UIEdgeInsets(top: spacing, left: spacing, bottom: spacing, right: spacing)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 20.0 // 원하는 줄 간격 값으로 수정
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 10.0 // 원하는 항목 간격 값으로 수정
    }
}


