//
//  MyPageVC.swift
//  cometext
//
//  Created by 최희진 on 2023/09/21.
//

import UIKit

class MyPageVC: UIViewController {
    
    @IBOutlet weak var myInfoTableView: UITableView!
    
    var menuArr = ["닉네임 변경", "비밀번호 변경", "연동된 SNS 계정"]
   
    override func viewDidLoad() {
        super.viewDidLoad()
        
        myInfoTableView.layer.borderWidth = 1
        myInfoTableView.layer.borderColor = UIColor(named: "Gray1")?.cgColor
       
        configureTableView()
    }
   
    // MARK: - Table View Configuration
   
    private func configureTableView() {
        myInfoTableView.dataSource = self
        myInfoTableView.delegate = self
    }
}

// MARK: - Table View Data Source

extension MyPageVC: UITableViewDataSource {
    
    //섹션 수 반환
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    //섹션 별 항목 수 반환
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return menuArr.count
    }
    //셀 구성
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MyInfoTableViewCell", for: indexPath) as! MyInfoTableViewCell
        
        let menuData = menuArr[indexPath.row] // 옵셔널 처리 제거
        
        cell.configure(withTitle: menuData)
        
        return cell
    }
    //섹션 제목 설정
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "내 정보"
    }
}

// MARK: - Table View Delegate

extension MyPageVC: UITableViewDelegate {

    //셀 클릭시 색상 원래로 돌아오기
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50 // 각 UITableViewCell의 높이를 설정
    }
}

