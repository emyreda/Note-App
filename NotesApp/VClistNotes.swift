//
//  VClistNotes.swift
//  NotesApp
//
//  Created by Mac on 7/17/19.
//  Copyright © 2019 Mac. All rights reserved.
//

    import UIKit
    import CoreData
    
    class VClistNotes: UIViewController{
        
        
        @IBOutlet weak var managetableview: UITableView!
        var arraylistnotes = [Notes]()
    
        
        override func viewDidLoad() {
            super.viewDidLoad()
            
            managetableview.tableFooterView = .none
            managetableview.separatorColor = .darkGray
            loadnotes()
        }
        
        
        
        // func for loading the notes from database
        
        func loadnotes(){
            
            let fetch:NSFetchRequest<Notes> = Notes.fetchRequest()
            
            
            do{
                
                arraylistnotes =  try context.fetch(fetch)
                managetableview.reloadData()
                
            }
                
            catch{
                
                print("can not read from database")
            }
            
        }  // end func loadnotes
        
        
        
        // func of delete
        @objc func deletepress(_ sender:UIButton){
            
            
            print("index\(sender.tag)")
            
            
            
           // context.delete(arraylistnotes[sender.tag])
            
            do {
                
                
                
                context.delete(arraylistnotes[sender.tag])

                try context.save()
                
            } catch _ {
                
                
                print("Not Saved ")
            }
            
            
            loadnotes()
            
        }
        
        
        
        @IBAction func back(_ sender: Any) {
            
            
            dismiss(animated: true, completion: nil)
        }
        
      
}



extension VClistNotes: UITableViewDelegate , UITableViewDataSource{
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arraylistnotes.count
    }
    
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell:NoteCell = tableView.dequeueReusableCell(withIdentifier: "cell", for:indexPath) as! NoteCell
        
        cell.setnotes(note:arraylistnotes[indexPath.row])
        
        
        // For Delete button
        cell.buDelete.tag = indexPath.row
        cell.buDelete.addTarget(self, action:#selector(deletepress(_:)), for:.touchUpInside )
        
       
        return cell
        
    }
    
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
    }
    
    
    //MARK:- Another way for delete cell without button in cell
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        
        
        
        
        
        
        if   editingStyle == UITableViewCell.EditingStyle.delete{
            
            context.delete(arraylistnotes[indexPath.row])
            
            
            
            
            do {
                try context.save()
                
                
            } catch _ {
                
                
                print("Not Saved ")
            }
            
            
            
            
            loadnotes()
            
            
        }
        
        
        
    }
    
    
    
}




