//
//  NetworkError.swift
//  ToDoList-MVC
//
//  Created by Ardi Jorganxhi on 6.1.23.
//

import Foundation


enum NetworkError: Error {

  case invalidURL
  case noData
  case decodingError
  case custom(errorMessage: String)
}
