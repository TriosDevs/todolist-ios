//
//  ModalViewModel.swift
//  ToDoList
//
//  Created by Ardi Jorganxhi on 29.12.22.
//

import Foundation


class ModalViewModel: ObservableObject {

    @Published var isPresented: Bool = false


    func setTrue(){

        DispatchQueue.main.async {
            self.isPresented = true
        }

    }
}
