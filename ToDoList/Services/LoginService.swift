//
//  LoginService.swift
//  ToDoList
//
//  Created by Ardi Jorganxhi on 27.12.22.
//

import Foundation


class LoginService {

    var loginUrl = "http://todolist-api.oguzhanercelik.dev/auth/login"


    func login(mail: String, password: String, completion: @escaping (Result<String, AuthenticationError>) -> Void){

        guard let url = URL(string: loginUrl) else {

            completion(.failure(.custom(errorMessage: "URL is not correct!")))

            return}

        let body: [String: AnyHashable] = ["mail": mail, "password": password]

        let bodyJSON = try? JSONSerialization.data(withJSONObject: body, options: .fragmentsAllowed)


        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.httpBody = bodyJSON
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")

        URLSession.shared.dataTask(with: request){ data, res, err in

            guard let data = data, err == nil else{
                completion(.failure(.custom(errorMessage: "No data!")))
                return
            }

            do{

                guard let res = try? JSONDecoder().decode(LoginResponse.self, from: data)
                else{
                    completion(.failure(.invalidCredientals))
                    return
                }

                print(res)




                guard let token = res.content else{
                    completion(.failure(.custom(errorMessage: "Token is not found!")))

                    return
                }

                completion(.success(token))

            }



        }.resume()












    }

    
}
