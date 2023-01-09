//
//  HomeViewController.swift
//  ToDoList-MVC
//
//  Created by Ardi Jorganxhi on 8.1.23.
//

import UIKit

class HomeViewController: UIViewController {

    @IBOutlet weak var createListButton: UIButton!
    @IBOutlet weak var homeLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        createListButton.layer.cornerRadius = createListButton.frame.width / 2
        createListButton.layer.masksToBounds = true

        // Do any additional setup after loading the view.
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
