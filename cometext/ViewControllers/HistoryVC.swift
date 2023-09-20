//
//  HistoryVC.swift
//  cometext
//
//  Created by 최희진 on 2023/09/17.
//

import UIKit

class HistoryVC: UIViewController {
    
    @IBOutlet weak var searchChatTextField: UITextField!
    @IBOutlet weak var chatDataTableView: UITableView!
    
    var chatDataArray = [
        ChatData(id: 1, date: "2023-08-30", title: "시간이 게으른 게스트 하우스"),
        ChatData(id: 2, date: "2023-08-30", title: "사랑, 인생, 명언"),
        ChatData(id: 3, date: "2023-08-30", title: "시간이 게으른 게스트 하우스"),
        ChatData(id: 4, date: "2023-08-16", title: "시간이 게으른 게스트 하우스"),
        ChatData(id: 5, date: "2023-08-16", title: "시간이 게으른 게스트 하우스")
    ]
    
    var groupedData: [String: [ChatData]] = [:]
    var sectionTitles: [String] = []
   
    override func viewDidLoad() {
        super.viewDidLoad()
       
        configureTableView()
        groupAndSortChatData()
    }
   
    // MARK: - Table View Configuration
   
    private func configureTableView() {
        chatDataTableView.dataSource = self
        chatDataTableView.delegate = self
    }
   
    // MARK: - Data Manipulation
   
    private func groupAndSortChatData() {
        // 날짜별로 대화 데이터 그룹화
        for data in chatDataArray {
            if var group = groupedData[data.date] {
                group.append(data)
                groupedData[data.date] = group
            } else {
                groupedData[data.date] = [data]
            }
        }
       
        // 날짜 최신순으로 정렬하여 섹션 제목으로 사용
        sectionTitles = groupedData.keys.sorted { (date1, date2) -> Bool in
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "yyyy-MM-dd"
           
            if let date1 = dateFormatter.date(from: date1),
               let date2 = dateFormatter.date(from: date2) {
                return date1 > date2
            }
           
            return false
        }
    }
}

// MARK: - Table View Data Source

extension HistoryVC: UITableViewDataSource {
    
    //섹션 수 반환
    func numberOfSections(in tableView: UITableView) -> Int {
        return sectionTitles.count
    }
    //섹션 별 항목 수 반환
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let sectionTitle = sectionTitles[section]
        return groupedData[sectionTitle]?.count ?? 0
    }
    //셀 구성
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ChatDataTableViewCell", for: indexPath) as! ChatDataTableViewCell
        
        let sectionTitle = sectionTitles[indexPath.section]
        if let chatData = groupedData[sectionTitle]?[indexPath.row] {
            cell.configure(withTitle: chatData.title)
        }
        
        return cell
    }
    //섹션 제목 설정
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return sectionTitles[section]
    }
}

// MARK: - Table View Delegate

extension HistoryVC: UITableViewDelegate {
    //스와이프 액션 구현(오른쪽)
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        // 삭제 버튼 구현
        let deleteAction = UIContextualAction(style: .destructive, title: nil) { (action, view, completion) in
            let sectionTitle = self.sectionTitles[indexPath.section]
            if var chatDataSection = self.groupedData[sectionTitle] {
                chatDataSection.remove(at: indexPath.row)
                self.groupedData[sectionTitle] = chatDataSection
            }
            
            tableView.deleteRows(at: [indexPath], with: .automatic)
            self.chatDataTableView.reloadData()
            
            completion(true)
        }
        
        // 삭제 버튼에 이미지 추가
        deleteAction.image = UIImage(named: "trash") // 이미지 이름을 적절하게 수정
        deleteAction.backgroundColor = UIColor(named: "Pink1")
        
        // 다른 스와이프 액션 버튼도 추가 가능
        
        return UISwipeActionsConfiguration(actions: [deleteAction])
    }

    //셀 클릭시 색상 원래로 돌아오기
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70 // 각 UITableViewCell의 높이를 설정
    }
}


