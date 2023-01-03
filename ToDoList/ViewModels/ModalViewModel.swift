//
//  ModalViewModel.swift
//  ToDoList
//
//  Created by Ardi Jorganxhi on 29.12.22.
//

import Foundation


class ModalViewModel: ObservableObject {

    @Published var createModal: Bool = false
    @Published var updateModal: Bool = false


    func setCreatedTrue(){

        DispatchQueue.main.async {
            self.createModal = true
        }

    }

    func setUpdatedTrue(){
        DispatchQueue.main.async {
            self.updateModal = true
        }
    }


}
