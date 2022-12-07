//
//  RegisterResponse.swift
//  ToDoList
//
//  Created by Ardi Jorganxhi on 8.12.22.
//

import Foundation

struct RegisterResponse: Codable{
    
    var message: String
    var path: String
    var status: Int?
    var timestamp: Int
}
