//
//  ListViewModel.swift
//  ToDoList
//
//  Created by Ardi Jorganxhi on 28.12.22.
//

import Foundation


class ListViewModel: ObservableObject {

    var name: String = ""

    @Published var listData = [ListModel]()
    @Published var isCreated: Bool = false
    @Published var listId: String?

    @Published var navigateTask: Bool = false

    init(listId: String){
        self.listId = listId
    }



    func goToTask(){

        DispatchQueue.main.async {
            self.navigateTask = true
        }
    }

   
    



    func getList(){
        let defaults = UserDefaults.standard
        guard let token = defaults.string(forKey: "jwttoken") else{
            return
        }

        ListService().getList(token: token) { result in
            switch result {
            case .success(let lists):

                defaults.setValue(self.listId, forKey: "listId")
                print(self.listId)

                DispatchQueue.main.async {
                    self.listData = lists
                    if(!self.listData.isEmpty){

                        

                    }
                    
                }

            case .failure(let err):
                print(err.localizedDescription)
            }
        }
    }

    func createList(){
        let defaults = UserDefaults.standard
        guard let token = defaults.string(forKey: "jwttoken") else {
            return
        }
        ListService().createList(name: name, token: token) { result in

            switch result {
            case .success(_):
                self.isCreated = true
                print("List is created!")
            case .failure(let err):
                print(err.localizedDescription)
            }

        }
    }

    func updateList(){
        let defaults = UserDefaults.standard
        guard let token = defaults.string(forKey: "jwttoken") else {
            return
        }
        ListService().updateList(name: name, token: token, listId: listId!) {result in
            switch result {
            case .success(_):
                print("List is updated!")
            case .failure(let err):
                print(err.localizedDescription)
            }
        }

    }

    func deleteList(){
        let defaults = UserDefaults.standard
        guard let token = defaults.string(forKey: "jwttoken") else {
            return
        }
        ListService().deleteList(token: token, listId: listId!) { result in
            switch result {
            case .success(_):
                print("List is deleted!")
            case .failure(let err):
                print(err.localizedDescription)
            }
        }
    }
}
