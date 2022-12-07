//
//  LoginResponse.swift
//  ToDoList
//
//  Created by Ardi Jorganxhi on 7.12.22.
//

import Foundation


struct LoginResponse: Codable {
    
    var content: String?
    var message: String
    var path: String
    var status: Int?
    var timestamp: Int
    
}
