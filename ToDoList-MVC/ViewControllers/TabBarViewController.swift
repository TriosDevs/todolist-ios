//
//  TabBarViewController.swift
//  ToDoList-MVC
//
//  Created by Ardi Jorganxhi on 8.1.23.
//

import UIKit

class TabBarViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        UINavigationBar.appearance().prefersLargeTitles = true
        self.tabBar.backgroundColor = .white
        self.tabBar.layer.cornerRadius = 20.0
        self.tabBar.tintColor = .black
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
