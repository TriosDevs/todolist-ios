//
//  RegisterService.swift
//  ToDoList
//
//  Created by Ardi Jorganxhi on 27.12.22.
//

import Foundation


class RegisterService {

    var registerUrl = "http://todolist-api.oguzhanercelik.dev/auth"
    
    func register(name: String, surname: String, mail: String, password: String, completion: @escaping (Result<String, NetworkError>) -> Void){

        guard let url = URL(string: registerUrl) else {

            completion(.failure(.invalidURL))
            return

        }

        let body: [String: AnyHashable] = ["name": name, "surname": surname, "mail": mail, "password": password]

        let bodyJSON = try? JSONSerialization.data(withJSONObject: body, options: .fragmentsAllowed)


        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.httpBody = bodyJSON
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")

        URLSession.shared.dataTask(with: request){ data, res, err in

            guard let data = data, err == nil else{
                completion(.failure(.noData))
                return
            }

            do{

                guard let res = try? JSONDecoder().decode(RegisterResponse.self, from: data)
                else{
                    completion(.failure(.decodingError))
                    return
                }

                completion(.success("User is registered!"))



            }



        }.resume()
    }
}
