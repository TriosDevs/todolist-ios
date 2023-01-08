//
//  UserService.swift
//  ToDoList-MVC
//
//  Created by Ardi Jorganxhi on 6.1.23.
//

import Foundation


struct UserService {


    func register(name: String, surname: String, mail: String, password: String, completion: @escaping (Result<String, NetworkError>) -> Void){

        var url = baseApi + "/auth"

            guard let url = URL(string: url) else {

                completion(.failure(.invalidURL))
                return

            }

            let body: [String: AnyHashable] = ["name": name, "surname": surname, "mail": mail, "password": password]

            let bodyJSON = try? JSONSerialization.data(withJSONObject: body, options: .fragmentsAllowed)


            var request = URLRequest(url: url)
            request.httpMethod = "POST"
            request.httpBody = bodyJSON
            request.addValue("application/json", forHTTPHeaderField: "Content-Type")

            URLSession.shared.dataTask(with: request){ data, res, err in

                guard let data = data, err == nil else{
                    completion(.failure(.noData))
                    return
                }

                let res = try? JSONDecoder().decode(RegisterResponse.self, from: data)
                print(res)


                completion(.success("User is registered!"))


            }.resume()


    }



    func login(mail: String, password: String, completion: @escaping(Result<String,NetworkError>) -> Void){

        let url = baseApi + "/auth/login"

        guard let url = URL(string: url) else {
            return
        }

        var request = URLRequest(url: url)

        var body: [String: AnyHashable] = ["mail": mail, "password": password]

        var bodyJSON = try? JSONSerialization.data(withJSONObject: body, options: .fragmentsAllowed)

        request.httpMethod = "POST"
        request.httpBody = bodyJSON
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")

        URLSession.shared.dataTask(with: request) { data, res, err in

            guard let data = data, err == nil else {
                return
            }

            let res = try? JSONDecoder().decode(LoginResponse.self, from: data)

            print(res)

            guard let token = res?.content else{
                return
            }

            completion(.success(token))
        }.resume()

    }
}
