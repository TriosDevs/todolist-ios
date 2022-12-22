//
//  ListModel.swift
//  ToDoList
//
//  Created by Ardi Jorganxhi on 15.12.22.
//

import Foundation



struct ListModel: Decodable, Identifiable {
    var identifyId = UUID()
    var id: Int
    var name: String
    var task: [TaskModel]
}
