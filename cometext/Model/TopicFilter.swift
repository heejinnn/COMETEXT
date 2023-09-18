//
//  BookFilteringModel.swift
//  cometext
//
//  Created by 최희진 on 2023/09/16.
//
struct TopicFilter{
    let id: Int
    let topicName: String
    
}
// 첫 번째 데이터 소스
extension TopicFilter {
    static let list1: [TopicFilter] = [
        TopicFilter(id: 1, topicName: "철학"),
        TopicFilter(id: 2, topicName: "종교"),
        TopicFilter(id: 3, topicName: "사회과학"),
        TopicFilter(id: 4, topicName: "자연과학"),
        TopicFilter(id: 5, topicName: "기술과학"),
        TopicFilter(id: 6, topicName: "예술"),
        TopicFilter(id: 7, topicName: "언어"),
        TopicFilter(id: 8, topicName: "문학"),
        TopicFilter(id: 9, topicName: "역사")
    ]
}

// 두 번째 데이터 소스
extension TopicFilter {
    static let list2: [TopicFilter] = [
        TopicFilter(id: 1, topicName: "강연집"),
        TopicFilter(id: 2, topicName: "도서관"),
        TopicFilter(id: 3, topicName: "문학정보"),
        TopicFilter(id: 4, topicName: "백과사전"),
        TopicFilter(id: 5, topicName: "신문"),
        TopicFilter(id: 6, topicName: "일반 전진"),
        TopicFilter(id: 7, topicName: "학회")
    ]
}

// 세 번째 데이터 소스
extension TopicFilter {
    static let list3: [TopicFilter] = [
        TopicFilter(id: 1, topicName: "1999년 이전"),
        TopicFilter(id: 2, topicName: "2000~2004"),
        TopicFilter(id: 3, topicName: "2005~2009"),
        TopicFilter(id: 4, topicName: "2010~2014"),
        TopicFilter(id: 5, topicName: "2015~2019"),
        TopicFilter(id: 6, topicName: "2020년 이후")
    ]
}







