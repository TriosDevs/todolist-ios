//
//  AuthenticationError.swift
//  ToDoList
//
//  Created by Ardi Jorganxhi on 28.12.22.
//

import Foundation

enum AuthenticationError: Error {

    case invalidCredientals
    case custom(errorMessage: String)
}
