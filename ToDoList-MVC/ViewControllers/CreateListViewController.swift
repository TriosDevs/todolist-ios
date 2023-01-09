//
//  CreateListViewController.swift
//  ToDoList-MVC
//
//  Created by Ardi Jorganxhi on 9.1.23.
//

import UIKit

class CreateListViewController: UIViewController {

    @IBOutlet weak var listName: UITextField!

    @IBOutlet weak var createListButton: UIButton!
    @IBOutlet weak var cancelModalButton: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.modalPresentationStyle = .formSheet
        self.preferredContentSize = CGSize(width: 300, height: 300)
        self.listName.layer.cornerRadius = 20.0
        self.listName.layer.masksToBounds = true
        self.createListButton.layer.cornerRadius = 20.0
        self.createListButton.layer.masksToBounds = true
        self.cancelModalButton.layer.cornerRadius = 20.0
        self.cancelModalButton.layer.masksToBounds = true

        // Do any additional setup after loading the view.
    }
    
    @IBAction func createList(_ sender: Any) {

        let defaults = UserDefaults.standard
        guard let token = defaults.string(forKey: "jwttoken") else {
            return
        }
        ListService().createList(name: listName.text!, token: token) { result in
            switch result {
            case .success(_):
                print("List is created!")
            case .failure(let err):
                print(err.localizedDescription)
            }
        }
    }

    
    @IBAction func closeModal(_ sender: Any) {

        self.dismiss(animated: true)
    }
    


}
