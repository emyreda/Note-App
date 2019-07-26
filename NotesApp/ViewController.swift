//
//  ViewController.swift
//  NoteApp
//
//  Created by Mac on 7/17/19.
//  Copyright © 2019 Mac. All rights reserved.
//

import UIKit
import  CoreData

class ViewController: UIViewController {
    
    
    
    @IBOutlet weak var txtAddNote: UITextField!
    @IBOutlet weak var txtViewDes: UITextView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    
    
    
    
    @IBAction func buSave(_ sender: Any) {
        
         // save my data to fields
            
       let  note = Notes(context:context)
        
        note.title = txtAddNote.text
        note.details = txtViewDes.text
        note.date = NSDate() as Date
        
        
        
         do{
         
         delegate.saveContext()
         
         txtAddNote.text = ""
         txtViewDes.text = ""
         
         
         }
         catch{
         
         
         print("Can not saved ")
         
         
         }
         
         
         let alert = UIAlertController(title: "Pretty", message: "Saved Successfully ", preferredStyle: .alert)
         
        
         alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
        self.present(alert , animated: true , completion: nil)
        
    }
    
    
}



