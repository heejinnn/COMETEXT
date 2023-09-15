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
extension TopicFilter{
    static let list : [TopicFilter] = [
        TopicFilter(id: 1, topicName: "철학"),
        TopicFilter(id: 2, topicName: "종교"),
        TopicFilter(id: 3, topicName: "사회과학"),
        TopicFilter(id: 4, topicName: "자연과학"),
        TopicFilter(id: 5, topicName: "문학"),
        TopicFilter(id: 6, topicName: "역사")
    ]
}
