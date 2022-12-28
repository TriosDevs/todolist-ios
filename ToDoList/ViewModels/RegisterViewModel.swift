//
//  RegisterViewModel.swift
//  ToDoList
//
//  Created by Ardi Jorganxhi on 14.12.22.
//

import Foundation



class RegisterViewModel: ObservableObject {

    var name: String = ""
    var surname: String = ""
    var mail: String = ""
    var password: String = ""
    @Published var isRegistered: Bool = false


    func register(){

        RegisterService().register(name: name, surname: surname, mail: mail, password: password) {result in

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

}
