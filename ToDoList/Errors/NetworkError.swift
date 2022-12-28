//
//  NetworkError.swift
//  ToDoList
//
//  Created by Ardi Jorganxhi on 28.12.22.
//

import Foundation

enum NetworkError: Error {

    case invalidURL
    case noData
    case decodingError
    case custom(errorMessage: String)

}
