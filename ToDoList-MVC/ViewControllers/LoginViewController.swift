//
//  ViewController.swift
//  ToDoList-MVC
//
//  Created by Ardi Jorganxhi on 6.1.23.
//

import UIKit

extension LoginViewController: UITextFieldDelegate {

    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}

class LoginViewController: UIViewController {


    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()
        self.emailTextField.layer.cornerRadius = 35.0



        


}



    @IBAction func login(_ sender: Any) {



        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let mainVC = storyboard.instantiateViewController(withIdentifier: "MainViewController") as! UITabBarController

        UserService().login(mail: emailTextField.text!, password: passwordTextField.text!){result in
            switch result{
            case .success(_):
                DispatchQueue.main.async {
                    self.navigationController?.pushViewController(mainVC, animated: true)
                    mainVC.navigationItem.hidesBackButton = true
                }


            case .failure(let err):
                print(err.localizedDescription)
            }

        }
   
    }



}

