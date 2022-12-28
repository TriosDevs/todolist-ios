//
//  ListViewModel.swift
//  ToDoList
//
//  Created by Ardi Jorganxhi on 28.12.22.
//

import Foundation


class ListViewModel: ObservableObject {

    @Published var listData = [ListModel]()


    func getList(){
        let defaults = UserDefaults.standard
        guard let token = defaults.string(forKey: "jwttoken") else{
            return
        }

        ListService().getList(token: token) { result in
            switch result {
            case .success(let lists):

                DispatchQueue.main.async {
                    self.listData = lists
                }

            case .failure(let err):
                print(err.localizedDescription)
            }
        }
    }
}
