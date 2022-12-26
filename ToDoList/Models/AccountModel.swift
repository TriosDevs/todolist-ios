//
//  AccountModel.swift
//  ToDoList
//
//  Created by Ardi Jorganxhi on 26.12.22.
//

import Foundation


struct AccountModel: Decodable, Identifiable {
    var id: Int
    var firstName: String
    var lastName: String
    var mail: String
    var status: Int?
}
