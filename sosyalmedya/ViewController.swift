//
//  ViewController.swift
//  sosyalmedya
//
//  Created by Sueda Beyza Özcan on 30.07.2024.
//

import UIKit
import Firebase


class ViewController: UIViewController {
    
    @IBOutlet weak var emailTextField: UITextField!
    
    @IBOutlet weak var sifreTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    //kullıcı girişi
    @IBAction func girisYapTiklandi(_ sender: Any) {
        if emailTextField.text != "" && sifreTextField.text != ""{
            Auth.auth().signIn(withEmail: emailTextField.text!, password: sifreTextField.text!) { authResult, error in
                if error != nil {
                    self.hataMesaji(titleInput: "Hata", messageInput: error?.localizedDescription ?? "Hata Aldınız, Tekrar Deneyiniz")
                }else{
                    self.performSegue(withIdentifier: "toFeedVC", sender: nil)
                }
            }
        } else {
            hataMesaji(titleInput: "Hata", messageInput: "E-mail ve Şifre Giriniz!")
            }
            
        }
    //kullanıcı oluşturma
    @IBAction func kayıtOlTiklandi(_ sender: Any) {
        if emailTextField.text != "" && sifreTextField.text != "" {
            // Kayıt olma işlemi
            Auth.auth().createUser(withEmail: emailTextField.text!, password: sifreTextField.text!) { authResult, error in
                if error != nil {
                    self.hataMesaji(titleInput: "Hata", messageInput: error?.localizedDescription ?? "Hata Aldınız, Tekrar Deneyiniz")
                } else{
                    self.performSegue(withIdentifier: "toFeedVC", sender: nil)
                }
            }
            
        } else {
            hataMesaji(titleInput: "Hata", messageInput: "E-mail ve Şifre Giriniz!")
            }
        }
        func hataMesaji(titleInput:String, messageInput: String){
            let alert = UIAlertController(title: titleInput, message: messageInput, preferredStyle: UIAlertController.Style.alert)
            let okButton = UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil)
            alert.addAction(okButton)
            self.present(alert,animated: true, completion: nil)
        }
    }

