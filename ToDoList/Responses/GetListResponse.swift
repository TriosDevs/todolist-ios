//
//  GetListResponse.swift
//  ToDoList
//
//  Created by Ardi Jorganxhi on 28.12.22.
//

import Foundation


struct GetListResponse: Decodable, Identifiable {
    var id: Int?
    var status: Int?
    var content: [ListModel]?
}
