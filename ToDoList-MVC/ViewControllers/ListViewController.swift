//
//  ListViewController.swift
//  ToDoList-MVC
//
//  Created by Ardi Jorganxhi on 8.1.23.
//

import UIKit

class ListViewController: UIViewController {

    @IBOutlet weak var createListModal: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()

        createListModal.layer.cornerRadius = createListModal.frame.width / 2
        createListModal.layer.masksToBounds = true
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
