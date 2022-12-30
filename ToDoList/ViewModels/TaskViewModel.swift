//
//  TaskViewModel.swift
//  ToDoList
//
//  Created by Ardi Jorganxhi on 30.12.22.
//

import Foundation



class TaskViewModel: ObservableObject {

    var name: String = ""
    @Published var listId: String
    @Published var taskIsCreated: Bool = false
    init(listId: String){
        self.listId = listId
    }






    func createTask(){
        let defaults = UserDefaults.standard
        guard let token = defaults.string(forKey: "jwttoken") else{
            return
        }

        TaskService().createTask(name: name, token: token, listId: listId) { result in
            switch result {
            case .success(_):
                print("Task is created!")
                DispatchQueue.main.async {
                    self.taskIsCreated = true
                }
            case .failure(let err):
                print(err.localizedDescription)

            }
        }
    }
}
