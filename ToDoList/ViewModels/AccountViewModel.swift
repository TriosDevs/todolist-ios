//
//  AccountViewModel.swift
//  ToDoList
//
//  Created by Ardi Jorganxhi on 26.12.22.
//

import Foundation


class AccountViewModel: ObservableObject {


    @Published var userData = [AccountModel]()

    var firstName: String = ""
    var lastName: String = ""



    func getUser(){
        let defaults = UserDefaults.standard
        guard let token = defaults.string(forKey: "jwttoken") else {
            return
        }

        APIService().getUser(token: token) { result in

            switch result {
            case .success(let user):
                DispatchQueue.main.async {
                    self.userData = [user]
                    self.firstName = user.firstName
                    self.lastName = user.lastName
                }
            case .failure(let error):
                print(error)

            }
        }

    }


    
}
