//
//  ListService.swift
//  ToDoList
//
//  Created by Ardi Jorganxhi on 27.12.22.
//

import Foundation



class ListService {

    var getListUrl = "http://todolist-api.oguzhanercelik.dev/api/list"

    func getList(token: String, completion: @escaping (Result<[ListModel], NetworkError>) -> Void ) {

        guard let url = URL(string: getListUrl) else {
            completion(.failure(.invalidURL))
            return
        }

        var request = URLRequest(url: url)

        request.addValue("Bearer \(token)", forHTTPHeaderField: "Authorization")

        URLSession.shared.dataTask(with: request) { data, res, err in

            guard let data = data, err == nil else {
                completion(.failure(.noData))
                return
            }
            do {
                let res = try JSONDecoder().decode(GetListResponse.self, from: data)

                print(res.content)
                completion(.success(res.content!))
            } catch(let err) {
                print(err)
                
            }


        }.resume()
    }
}
