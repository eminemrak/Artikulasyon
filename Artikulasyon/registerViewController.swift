//
//  registerViewController.swift
//  Artikulasyon
//
//  Created by Eminko on 12.11.2022.
//

import UIKit
import Firebase

class registerViewController: UIViewController {
    
    var Dataa1 = [String : Any]()
    
 
    
    
   
    
    
    @IBOutlet weak var rolPickerView: UIPickerView!
    
    @IBOutlet weak var sabitText: UITextField!
    @IBOutlet weak var userText: UITextField!
    @IBOutlet weak var passwordText: UITextField!
    @IBOutlet weak var phoneNumber: UITextField!
    @IBOutlet weak var otpText: UITextField!
    @IBOutlet weak var rolText: UILabel!
    
    var userInformation : [String : Any] = [:]
    
    
    var roller = ["Terapist","Veli"]

    
    func makeAlert (title: String, message: String, okTitle: String){
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertController.Style.alert)
        let okButton = UIAlertAction(title: okTitle, style: UIAlertAction.Style.default)
        alert.addAction(okButton)
        self.present(alert, animated: true, completion: nil)
    }
   
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        rolPickerView.dataSource = self
        rolPickerView.delegate = self
        
        otpText.isEnabled = false
        let gestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(hideKeyboard))
        view.addGestureRecognizer(gestureRecognizer)
       
        
        
    
        
        
    }
    
    @objc func hideKeyboard() {
        view.endEditing(true)
    }
    
    
    
    var vertification_id : String? = nil
    @IBAction func otpRequestButton(_ sender: Any) {
        if (!otpText.isEnabled) {
            if !phoneNumber.text!.isEmpty && !userText.text!.isEmpty && passwordText.text != "" {
                Auth.auth().settings?.isAppVerificationDisabledForTesting = false
                PhoneAuthProvider.provider().verifyPhoneNumber("\(sabitText.text!)\(phoneNumber.text!)", uiDelegate: nil, completion: {vertificationID, error
                    in
                    if error != nil {
                        print("ERROR1")
                        self.makeAlert(title: "Başarısız Doğrulama", message: "Telefon Numaranızı ve Tüm Bilgileri Doğru Giriniz!", okTitle: "Tekrar Dene")
                    }else{
                        self.vertification_id = vertificationID
                        self.otpText.isEnabled = true
                    }
                 })
              }
            else {
                makeAlert(title: "Eksik Bilgi", message: "Tüm Bilgileri Doğru Giriniz", okTitle: "Anladım")
              }
               }else {
                 print("ERROR for ?AS?DA?SD")
                       }
                        }
    
    
    
    
    
    
    
    
    
    
    
    
    @IBAction func registerButton(_ sender: Any) {
                
        if !phoneNumber.text!.isEmpty && !userText.text!.isEmpty && passwordText.text != "" && otpText.text != ""{
            
            userInformation = (["Kullanıcı" : userText.text! , "Password": passwordText.text! , "Phone Number": "+90\(phoneNumber.text!)" , "Rol": rolText.text!] as? [String:Any])!
            if vertification_id != nil {
                let credential = PhoneAuthProvider.provider().credential(withVerificationID: vertification_id!, verificationCode: otpText.text!)
                Auth.auth().signIn(with: credential) { authData, error in
                    if error != nil {print("Credential Error")
                        self.makeAlert(title: "Başarısız Doğrulama", message: "Telefon Numaranızı ve Tüm Bilgileri Doğru Giriniz!", okTitle: "Tekrar Dene")
                    }else {
                        print("ACCESS SUCCESS" + (authData?.user.phoneNumber ?? "no phone number"))
                        Firestore.firestore().collection("Posts").document("+90\(self.phoneNumber.text!)").setData(self.userInformation)
                        
                        if self.rolText.text == "Terapist" {

                        var array1 = ["B","C","Ç","D","F","G","H","J","K","L","M","N","P","R","S","Ş","T","V","Y","Z"]
                        var array2 = ["Tek","İki","Çok"]
                        var array3 = [Data().bTekText,Data().bTwoText,Data().bMoreText,Data().cTekText,Data().cTwoText,Data().cMoreText,Data().çTekText,Data().çTwoText,Data().çMoreText,Data().dTekText,Data().dTwoText,Data().dMoreText,Data().fTekText,Data().fTwoText,Data().fMoreText,Data().gTekText,Data().gTwoText,Data().gMoreText,Data().hTekText,Data().hTwoText,Data().hMoreText,Data().jTekText,Data().jTwoText,Data().jMoreText,Data().kTekText,Data().kTwoText,Data().kMoreText,Data().lTekText,Data().lTwoText,Data().lMoreText,Data().mTekText,Data().mTwoText,Data().mMoreText,Data().nTekText,Data().nTwoText,Data().nMoreText,Data().pTekText,Data().pTwoText,Data().pMoreText,Data().rTekText,Data().rTwoText,Data().rMoreText,Data().sTekText,Data().sTwoText,Data().sMoreText,Data().şTekText,Data().şTwoText,Data().şMoreText,Data().tTekText,Data().tTwoText,Data().tMoreText,Data().vTekText,Data().vTwoText,Data().vMoreText,Data().yTekText,Data().yTwoText,Data().yMoreText,Data().zTekText,Data().zTwoText,Data().zMoreText]
                        var sayı = -1
                        for array in array3 {
                            sayı = sayı + 1
                            for aa in array {
                                self.Dataa1["\(aa)"] = "yıldızlı değil"
                            }
                            Firestore.firestore().collection("Posts").document("+90\(self.phoneNumber.text!)").collection("Stars")
                                .document("\(array1[sayı/3])'nin \(array2[sayı%3]) Heceli").setData(self.Dataa1)
                            self.Dataa1.removeAll()
                        }
                            self.performSegue(withIdentifier: "registerToTerapist", sender: nil)}
                        else {self.performSegue(withIdentifier: "registerToVeli", sender: nil)}
                        }
                      }
                    }else{
                print("ERROR in getting vertification id")
                makeAlert(title: "Geçersiz SMS Kodu", message: "SMS Kodunu Doğru Giriniz", okTitle: "Tekrar Dene")
                }
              }
            else{
            makeAlert(title: "Eksik Bilgi", message: "Tüm Bilgileri ve SMS Doğrulama Kodunu Doğru Giriniz", okTitle: "Anladım")
           }
        }
      }


extension registerViewController: UIPickerViewDelegate, UIPickerViewDataSource{

    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1 // bir sütun olucak sadece
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        
        return roller.count // kaç seçenek olacak : terapist ile veli
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        
        return roller[row] //seçeneklerde ne yazacak
        
    }
    
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
        rolText.text = roller[row]
    }
    
    
}
