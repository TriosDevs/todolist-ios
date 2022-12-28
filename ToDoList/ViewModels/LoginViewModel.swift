//
//  LoginViewModel.swift
//  ToDoList
//
//  Created by Ardi Jorganxhi on 14.12.22.
//

import Foundation



class LoginViewModel: ObservableObject {

    var mail: String = ""
    var password: String = ""
    @Published var isAuthenticated: Bool = false


    func login(){

        let defaults = UserDefaults.standard

        LoginService().login(mail: mail, password: password) { result in
            switch result {

            case .success(let token):

                defaults.setValue(token, forKey: "jwttoken")
               
                DispatchQueue.main.async {
                    self.isAuthenticated = true
                }
            case .failure(let error):

                print(error.localizedDescription)

            }
            }
        }
    }

