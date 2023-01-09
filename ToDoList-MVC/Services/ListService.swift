//
//  ListService.swift
//  ToDoList-MVC
//
//  Created by Ardi Jorganxhi on 9.1.23.
//

import Foundation


struct ListService {


    func createList(name: String, token: String, completion: @escaping (Result<String, NetworkError>) -> Void) {

        var url = baseApi + "/api/list"

        guard let url = URL(string: url) else {
            completion(.failure(.invalidURL))
            return
        }

        var request = URLRequest(url: url)

        let body: [String: AnyHashable] = ["name": name]

        let bodyJSON = try? JSONSerialization.data(withJSONObject: body, options: .fragmentsAllowed)

        request.httpMethod = "POST"
        request.httpBody = bodyJSON
        request.addValue("Bearer \(token)", forHTTPHeaderField: "Authorization")
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")


        URLSession.shared.dataTask(with: request) { data, res, err in

               guard let data = data, err == nil else {
                   completion(.failure(.noData))
                   return

               }

               guard let res = try? JSONDecoder().decode(MessageResponse.self, from: data) else {
                   completion(.failure(.decodingError))
                   return
               }

               print(res)



               



           }.resume()


        


    }
}
