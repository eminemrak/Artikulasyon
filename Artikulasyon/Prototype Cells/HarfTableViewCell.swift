//
//  HarfTableViewCell.swift
//  Artikulasyon
//
//  Created by Eminko on 24.07.2022.
//

import UIKit

class HarfTableViewCell: UITableViewCell {
    
    //Harfleri listelediğimiz tabloda prototype cell kullandık ancak henüz farklı bir tasarım koymadık.
    // sadece bir adet LABEL var.

    @IBOutlet weak var view: UIView!
    
    @IBOutlet weak var label: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        
    
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
