//
//  UserService.swift
//  ToDoList
//
//  Created by Ardi Jorganxhi on 27.12.22.
//

import Foundation


class UserService {

    var getUserUrl = "http://todolist-api.oguzhanercelik.dev/api/user"



    func getUser(token: String, completion: @escaping (Result<AccountModel, NetworkError>) -> Void){

        guard let url = URL(string: getUserUrl) else {

            completion(.failure(.invalidURL))
            return
        }

        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        request.addValue("Bearer \(token)", forHTTPHeaderField: "Authorization")

        URLSession.shared.dataTask(with: request) {data, res, err in

            guard let data = data, err == nil else {
                completion(.failure(.custom(errorMessage: "No account!")))
                return
            }


            do {
                 let res = try JSONDecoder().decode(AccountModel.self, from: data)



                print(res)
                completion(.success(res))
            } catch(let err){
                print(err)
            }



        }.resume()




    }
}
