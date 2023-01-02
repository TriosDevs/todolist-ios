//
//  ModalViewModel.swift
//  ToDoList
//
//  Created by Ardi Jorganxhi on 29.12.22.
//

import Foundation


class ModalViewModel: ObservableObject {

    @Published var isPresented: Bool = false
    @Published var isPresented2: Bool = false


    func setTrue(){

        DispatchQueue.main.async {
            self.isPresented = true
        }

    }

    func setTrue2(){
        DispatchQueue.main.async {
            self.isPresented2 = true
        }
    }

    func setFalse(){
        DispatchQueue.main.async {
            self.isPresented = false
        }
    }
}
