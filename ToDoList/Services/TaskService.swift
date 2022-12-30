//
//  TaskService.swift
//  ToDoList
//
//  Created by Ardi Jorganxhi on 27.12.22.
//

import Foundation


class TaskService {


    func createTask(name: String, token: String, listId: String, completion: @escaping (Result<String, NetworkError>) -> Void){

        let url = "http://todolist-api.oguzhanercelik.dev/api/task?list=" + listId.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)!

        guard let url = URL(string: url) else {
            completion(.failure(.invalidURL))
            return
        }

        var request = URLRequest(url: url)

        let body: [String: AnyHashable] = ["name": name]

        let bodyJSON = try? JSONSerialization.data(withJSONObject: body, options: .fragmentsAllowed)

        request.httpMethod = "POST"
        request.httpBody = bodyJSON
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        
        request.addValue("Bearer \(token)", forHTTPHeaderField: "Authorization")


        URLSession.shared.dataTask(with: request) { data, res, err in

            guard let data = data, err == nil else {
                completion(.failure(.noData))
                return
            }

            let res = try? JSONDecoder().decode(CreateTaskResponse.self, from: data)

            print(res)

            completion(.success("Task is created!"))

            
        }.resume()


        
    }
}
