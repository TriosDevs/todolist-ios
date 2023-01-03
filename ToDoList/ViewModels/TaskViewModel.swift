//
//  TaskViewModel.swift
//  ToDoList
//
//  Created by Ardi Jorganxhi on 30.12.22.
//

import Foundation



class TaskViewModel: ObservableObject {

    var name: String = ""
    @Published var id: String
    @Published var taskIsCreated: Bool = false
    init(id: String){
        self.id = id
    }






    func createTask(){
        let defaults = UserDefaults.standard
        guard let token = defaults.string(forKey: "jwttoken") else{
            return
        }

        TaskService().createTask(name: name, token: token, listId: id) { result in
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

    func updateTask(){
        let defaults = UserDefaults.standard
        guard let token = defaults.string(forKey: "jwttoken") else {
            return
        }
        TaskService().updateTask(name: name, token: token, taskId: id) { result in

            switch result {

            case .success(_):
                print("Task is updated!")
            case .failure(let err):
                print(err.localizedDescription)

            }
        }
    }

    func deleteTask(){
        let defaults = UserDefaults.standard
        guard let token = defaults.string(forKey: "jwttoken") else {
            return
        }
        TaskService().delete(token: token, taskId: id){ result in
            switch result {
            case .success(_):
                print("Task is deleted!")
            case .failure(let err):
                print(err.localizedDescription)
            }
        }
    }
}
