//
//  loginViewController.swift
//  Artikulasyon
//
//  Created by Eminko on 12.11.2022.
//

import UIKit
import Firebase

class loginViewController: UIViewController {
    
    
    @IBOutlet weak var phoneText: UITextField!
    @IBOutlet weak var passwordText: UITextField!
    @IBOutlet weak var otpText: UITextField!
    
    @IBOutlet weak var smsButton: UIButton!
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var registerButton: UIButton!
    
   
    override func viewDidLoad() {
        super.viewDidLoad()
        otpText.isEnabled = false
        
        smsButton.layer.cornerRadius = 15
        loginButton.layer.cornerRadius = 15
        registerButton.layer.cornerRadius = 15
        
            
        let gestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(hideKeyboard))
        view.addGestureRecognizer(gestureRecognizer)
    }
    
    @objc func hideKeyboard() {
        view.endEditing(true)
    }
    
    
    var vertificationID : String?
    var vertificationCode : String?
    var rol : String?
    
    func makeAlert (title: String, message: String, okTitle: String){
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertController.Style.alert)
        let okButton = UIAlertAction(title: okTitle, style: UIAlertAction.Style.default)
        alert.addAction(okButton)
        self.present(alert, animated: true, completion: nil)
    }
    
    @IBAction func otpReqButton(_ sender: Any) {
        
        if (!otpText.isEnabled) {
            if phoneText.text != "" && passwordText.text != "" {
                Auth.auth().settings?.isAppVerificationDisabledForTesting = false
                PhoneAuthProvider.provider().verifyPhoneNumber("+90\(phoneText.text!)", uiDelegate: nil, completion: {vertificationID, error
                    in
                    if error != nil {
                        self.makeAlert(title: "Giriş Başarısız",
                                       message: "Kayıt Olduğunuzdan ve Bilgileri Doğru Girdiğinizden Emin Olun",
                                       okTitle: "Tekrar Giriş Yap")
                        print("ERROR1")
                    }else{
                        self.vertificationID = vertificationID
                        self.otpText.isEnabled = true
                    }
                })
            }
            else {
                print("phoneText veya passwordText Boş Bırakıldı")
                makeAlert(title: "Başarısız Giriş", message: "Kullanıcı Adı veya Şifre Geçersiz", okTitle: "Tekrar Giriş Yap")
            }
        }else {
            print("ERROR otpText is not Enabled")
        }
        
    }
  
    @IBAction func loginButton(_ sender: Any) {
        
        
        if vertificationID != nil {
            let credential = PhoneAuthProvider.provider().credential(withVerificationID: vertificationID!, verificationCode: otpText.text!)
            Auth.auth().signIn(with: credential) { authData, error in
                if error != nil {
                    print("ERROR 2")
                }else {
                    print("ACCESS SUCCESS" + (authData?.user.phoneNumber ?? "no phone number"))
                }
            }
        }else{
            print("ERROR in getting vertification id")
            makeAlert(title: "Başarısız Giriş", message: "SMS Kodunu Doğru Girdiğinizden Emin Olun", okTitle: "Tekrar Giriş Yap")
        }
        var x = 0
        Firestore.firestore().collection("Posts").addSnapshotListener { snapshot, error in
            if error != nil {print("error login rol almak için")}
            else {
                for document in snapshot!.documents {
                    if document.documentID == "+90\(self.phoneText.text!)" {
                        x = 1
                        if let rolText = document.get("Rol") as? String {
                            self.rol = rolText
                        }
                        if self.rol == "Terapist" {
                            self.performSegue(withIdentifier: "loginToTerapist", sender: nil)
                        }else {
                            self.performSegue(withIdentifier: "loginToVeli", sender: nil)

                        }
                    }
                  }
                if x == 0{
                   self.makeAlert(title: "Kayıt Bulunamadı", message: "Giriş Yapmadan Önce Kayıt Olmanız Gerek!", okTitle: "Anladım")
               }
             }
           }
        }
 
    @IBAction func registerButton(_ sender: Any) {
        //self.performSegue(withIdentifier: "loginToRegister", sender: nil)
    }
}

