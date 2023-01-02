//
//  AccountViewModel.swift
//  ToDoList
//
//  Created by Ardi Jorganxhi on 26.12.22.
//

import Foundation

@MainActor
class UserViewModel: ObservableObject {
    
    var name: String = ""
    var surname: String = ""
    var mail: String = ""
    var password: String = ""
    @Published var userData = [AccountModel]()
    @Published var isAuthenticated: Bool = false
    @Published var isRegistered: Bool = false
    @Published var isUpdated: Bool = false
    @Published var isSignedOut: Bool = false



    func register(){

        UserService().register(name: name, surname: surname, mail: mail, password: password) {result in

            switch result {
            case .success(_):
                DispatchQueue.main.async {
                    self.isRegistered = true
                }
            case .failure(let error):
                print(error.localizedDescription)
            }

        }
    }




    func login(){

        let defaults = UserDefaults.standard

        UserService().login(mail: mail, password: password) { result in
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




    func getUser(){
        let defaults = UserDefaults.standard
        guard let token = defaults.string(forKey: "jwttoken") else {
            return
        }

        UserService().getUser(token: token) { result in

            switch result {
            case .success(let user):
                DispatchQueue.main.async {
                    self.userData = [user]
               
                }
            case .failure(let error):
                print(error)

            }
        }

    }

    func updateUser(){

        let defaults = UserDefaults.standard
        guard let token = defaults.string(forKey: "jwttoken") else {
            return
        }

        UserService().updateUser(name: name, surname: surname, mail: mail, token: token) {result in
            switch result {
            case .success(_):
                DispatchQueue.main.async {
                    self.isAuthenticated = false
                    self.isUpdated = true
                    defaults.removeObject(forKey: "jwttoken")

                }
            case .failure(let err):
                print(err.localizedDescription)
            }
        }
    }


    
}
