//
//  ListService.swift
//  ToDoList
//
//  Created by Ardi Jorganxhi on 27.12.22.
//

import Foundation



class ListService {

    var listUrl = "http://todolist-api.oguzhanercelik.dev/api/list"

    func getList(token: String, completion: @escaping (Result<[ListModel], NetworkError>) -> Void ) {

        guard let url = URL(string: listUrl) else {
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

    func createList(name: String, token: String, completion: @escaping (Result<String, NetworkError>) -> Void){

        guard let url = URL(string: listUrl) else {
            completion(.failure(.invalidURL))
            return
        }
        let body: [String: AnyHashable] = ["name": name]

        let bodyJSON = try? JSONSerialization.data(withJSONObject: body, options: .fragmentsAllowed)
        

        var request = URLRequest(url: url)

        request.httpMethod = "POST"
        request.httpBody = bodyJSON
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.addValue("Bearer \(token)", forHTTPHeaderField: "Authorization")


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



            completion(.success("List is created!"))


            
        }.resume()



    }

}
