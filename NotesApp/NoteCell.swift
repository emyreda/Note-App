//
//  NoteCell.swift
//  NotesApp
//
//  Created by Mac on 7/17/19.
//  Copyright © 2019 Mac. All rights reserved.
//

import UIKit

class NoteCell: UITableViewCell {

        
        @IBOutlet weak var title: UILabel!
        @IBOutlet weak var des: UITextView!
        @IBOutlet weak var date: UILabel!
        @IBOutlet weak var buDelete: UIButton!
    
    
        
        
        func setnotes(note:Notes){
            
            title.text = note.title
            des.text = note.details
            
            
            let formatdate = DateFormatter()
            
            formatdate.dateFormat = "MM/dd/yy h:m a "
            
            
            let now = formatdate.string(from: note.date  as! Date)
            
            
            date.text = now
            
            
            
            
            
            
            
            
        }
        
        
        
        
        
        
        
        
        
        
        
        
}
