//
//  ViewController.swift
//  Contacts
//
//  Created by Usuário Convidado on 04/02/16.
//  Copyright © 2016 Usuário Convidado. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate, SyncServerDelegate {

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var idadeLabel: UILabel!
    @IBOutlet weak var tipoContatoLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        /*let nameLabel = UILabel()
        nameLabel.text = "Text"
        nameLabel.frame = CGRectMake(120, 30, 200, 30)
        self.view.addSubview(nameLabel)*/
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func setContactType(contactType: String) {
        self.tipoContatoLabel.text = contactType
    }

    @IBAction func formaDeContatoAlert(sender: UIButton) {
        let actionSheet = UIAlertController (title: "Contact",
            message: "Choose a contact type",
            preferredStyle:  UIAlertControllerStyle.ActionSheet)
        actionSheet.addAction(UIAlertAction (title: "Cancel",
            style: UIAlertActionStyle.Cancel,
            handler: nil))
        actionSheet.addAction(UIAlertAction(title: "Email",
            style: UIAlertActionStyle.Default,
            handler: { _ in
            self.setContactType("Email") }))
        actionSheet.addAction(UIAlertAction(title: "Phone",
            style: UIAlertActionStyle.Default,
            handler: { _ in
            self.setContactType("Phone") }))
        
        self.presentViewController (actionSheet, animated: true, completion: nil)
    }
    
    @IBAction func stepperChanged(sender: UIStepper) {
        self.idadeLabel.text = "\(sender.value)"
    }
    
    @IBAction func salvarContato(sender: UIButton) {
        let alert = UIAlertController (title: "Confirmation",
                    message: "Do you wish to save the contact?",
                    preferredStyle: UIAlertControllerStyle.Alert)
        alert.addAction(UIAlertAction (title: "No",
                        style: UIAlertActionStyle.Cancel,
                        handler: { _ in
                        print ("Alert - No") }))
        alert.addAction(UIAlertAction (title: "Yes",
                        style: UIAlertActionStyle.Default,
                        handler: { _ in
                        self.syncToServer() }))
        
        self.presentViewController(alert, animated: true, completion: nil)
    }
    
    func syncToServer() {
        print ("Alert - Sim")
        let sync = SyncServer(delegate: self)
        sync.saveinfo()
    }
    
    func infoSaved() {
        let actionSheet = UIAlertController (title: "Success", message: "Information saved successfully!",
        preferredStyle: UIAlertControllerStyle.Alert)
        actionSheet.addAction(UIAlertAction (title: "OK", style: UIAlertActionStyle.Default, handler: nil))
        
        self.presentViewController(actionSheet, animated: true, completion: nil)
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        // Esconder teclado
        textField.resignFirstResponder()
        
        // Subir teclado
        //textField.becomeFirstResponder()
                            
        return false
    }
}

