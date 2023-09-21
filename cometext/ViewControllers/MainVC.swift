//
//  MainVC.swift
//  cometext
//
//  Created by 최희진 on 2023/09/15.
//

import UIKit
import SnapKit
import SafariServices

class MainVC: UIViewController{
    let bookStoreList : [BookStoreModel] = BookStoreModel.list
    
    @IBOutlet weak var infoView: UIView!
    let newBookList: [newBookInfo] = newBookInfo.list
    
    
    @IBOutlet weak var newBookCollectionView: UICollectionView!
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
        
        newBookCollectionView.dataSource = self
       
        infoView.layer.borderWidth = 1
        infoView.layer.borderColor = UIColor(named: "Gray1")?.cgColor
        
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

extension MainVC: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == bookStoreCollectionView {
            return bookStoreList.count
        } else if collectionView == newBookCollectionView {
            return newBookList.count
        }
        return 0
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == bookStoreCollectionView {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "BookStoreCollectionViewCell", for: indexPath) as! BookStoreCollectionViewCell
            let data = bookStoreList[indexPath.item]
            cell.configure(data)
            return cell
        } else if collectionView == newBookCollectionView {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "NewBookInfoCollectionViewCell", for: indexPath) as! NewBookInfoCollectionViewCell
            let data = newBookList[indexPath.item]
            cell.configure(data)
            return cell
        }

        // Return a default cell if neither collection view matches
        return UICollectionViewCell()
    }
}

extension MainVC: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        // 선택한 셀의 인덱스를 가져옴
        let selectedCellIndex = indexPath.item

        // 첫 번째 셀을 클릭한 경우에만 네이버 URL을 실행
        if selectedCellIndex == 0 {
            if let interparkURL = URL(string: "https://www.interpark.com/") {
                let safariViewController = SFSafariViewController(url: interparkURL)
                present(safariViewController, animated: true, completion: nil)
            }
        }
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


