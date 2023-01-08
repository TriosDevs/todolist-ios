//
//  RegisterViewController.swift
//  ToDoList-MVC
//
//  Created by Ardi Jorganxhi on 7.1.23.
//

import UIKit

class RegisterViewController: UIViewController {


    @IBOutlet weak var nameTextField: UITextField!

    @IBOutlet weak var surnameTextField: UITextField!

    @IBOutlet weak var emailTextField: UITextField!

    @IBOutlet weak var passwordTextField: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    @IBAction func register(_ sender: Any) {

        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let loginVC = storyboard.instantiateViewController(withIdentifier: "LoginViewController")

        UserService().register(name: nameTextField.text!, surname: surnameTextField.text!, mail: emailTextField.text!, password: passwordTextField.text!){ result in
            switch result {

            case .success(_):
                DispatchQueue.main.async {
                    print("User is registered!")
                    self.navigationController?.pushViewController(loginVC, animated: true)
                    loginVC.navigationItem.hidesBackButton = true

                }



            case .failure(let err):
                print(err.localizedDescription)
            }

        }
        
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
