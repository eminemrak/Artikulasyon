//
//  MessageViewController.swift
//  Artikulasyon
//
//  Created by Eminko on 23.11.2022.
//

import UIKit
import Firebase

class MessageViewController: UIViewController,UITableViewDelegate,UITableViewDataSource, UITextFieldDelegate {
    
    
    
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var sendButton: UIButton!
    @IBOutlet weak var tableView: UITableView!
    
    
   
    var messageArr = [Message]()
    
    var selectedFriend : String?
    var selectedFriendPhone : String?
    var myUserName = ""

    func textFieldDidBeginEditing(_ textField: UITextField) {
        moveTextField(textField: textField, moveDistance: -250, up: true)
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        moveTextField(textField: textField, moveDistance: -250, up: false)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    func moveTextField(textField: UITextField, moveDistance: Int, up:Bool){
        let moveDuration = 0.3
        let movement: CGFloat = CGFloat(up ? moveDistance : -moveDistance)
        
        UIView.beginAnimations("animeTextField", context: nil)
        UIView.setAnimationBeginsFromCurrentState(true)
        UIView.setAnimationDuration(moveDuration)
        self.view.frame = CGRectOffset(self.view.frame, 0, movement)
        UIView.commitAnimations()
        
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        textField.layer.masksToBounds = true
        textField.layer.cornerRadius = 21
        
        sendButton.layer.cornerRadius = 21
        
        getMsgs()

        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.separatorStyle = .none
        tableView.showsVerticalScrollIndicator = false
      
        
        let nib = UINib(nibName: "chatTableViewCell", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: "chatTableViewCell")
        let gestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(hideKeyboard))
        view.addGestureRecognizer(gestureRecognizer)
        
        
        
    
        
        
    }
    
    @objc func hideKeyboard() {
        view.endEditing(true)
    }
    
    func scrollToBottom() {
        
        DispatchQueue.main.async {
            let point = CGPoint(x: 0, y: self.tableView.contentSize.height + self.tableView.contentInset.bottom - self.tableView.frame.height)
            if point.y >= 0 {
                self.tableView.setContentOffset(point, animated: true)
            }
        }
    }
    
    func getMsgs(){
            let msgDB = Database.database().reference().child("Messages")
            msgDB.observe(.childAdded) { (snapShot) in
                let value = snapShot.value as! Dictionary<String,String>
                let text = value["MessageBody"]!
                var sender = ""
                
                if value["Sender"] == Auth.auth().currentUser?.phoneNumber{
                    sender = self.myUserName
                }else {
                    sender = self.selectedFriend!
                }
                
                
               // let sender = value["Sender"]!
                let msg = Message()
                msg.msgBody = text
                msg.sender = sender
                if (value["Sender"] == Auth.auth().currentUser?.phoneNumber && value["Receiver"] == self.selectedFriendPhone) || (value["Sender"] == self.selectedFriendPhone && value["Receiver"] == Auth.auth().currentUser?.phoneNumber)  {
                    self.messageArr.append(msg)
                    

                }
                
              
                
                debugPrint(self.messageArr.count)
                
                
                self.tableView.reloadData()
            }
        
       
     
       
        }
    
    
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
      
        return messageArr.count
      
       
        
    }
    var x = 0
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       // let cell = tableView.dequeueReusableCell(withIdentifier: "chatTableViewCell", for: indexPath) as! chatTableViewCell
        let cell = Bundle.main.loadNibNamed("chatTableViewCell", owner: self)?.first as! chatTableViewCell
               cell.messageBody.text = messageArr[indexPath.row].msgBody
                //cell.userName.text = myUserName
               cell.userName.text = messageArr[indexPath.row].sender
              // cell.userProfile.image =  imageLiteral(resourceName: "profilePic")
        cell.view.layer.cornerRadius = cell.view.frame.height / 2
        //cell.view.layer.cornerRadius = 20
        
        
        x = x + 1
        if x == 1{
            scrollToBottom()
        }
        
               return cell
           
    }
    
    var Receiver = ""
    
    @IBAction func sendButton(_ sender: Any) {
        if textField.text != "" && textField.text != " " && textField.text != "  " && textField.text != "   " && textField.text != "    " && textField.text != "     " {
            x = 0 // scrollToBottom cellForRowAt'ta sadece bir kere çalışsın diye 0 yapıyorum
            textField.endEditing(true)
//            textField.isEnabled = false
//            sendButton.isEnabled = false
            
            let msgDB = Database.database().reference().child("Messages")
            
            
            
            
            
            Firestore.firestore().collection("Posts").addSnapshotListener { snapshot, error in
                if error != nil {print("settings error")}
                else{
                    for document in snapshot!.documents{
                        
                        
                        if document.documentID == Auth.auth().currentUser?.phoneNumber{
                            
                            if document.get("Rol") as! String == "Veli" {
                                if document.get("Terapistim") as! String != nil {
                                    self.Receiver = document.get("TerapistimPhone") as! String
                                }
                            }
                            else{
                                self.Receiver = self.selectedFriendPhone!
                            }
                        }
                    }
                }
            }
            
            
            
            
            
            if !Receiver.isEmpty{

            let msgDict = ["Sender" : Auth.auth().currentUser?.phoneNumber, "MessageBody" : self.textField.text!, "Receiver" : Receiver]
            
            
            msgDB.childByAutoId().setValue(msgDict){(error,ref) in
                if(error != nil){
                    debugPrint(error)
                    print("EERRROORR")
                }else{
                    debugPrint("Msg saved successfully")
                    self.textField.isEnabled = true
                    self.sendButton.isEnabled = true
                    self.textField.text = nil
                }
                
            }
        }
      }
    }
}

    
 

