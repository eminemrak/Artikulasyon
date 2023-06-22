//
//  chatTableViewCell.swift
//  Artikulasyon
//
//  Created by Eminko on 30.11.2022.
//

import UIKit

class chatTableViewCell: UITableViewCell {

    
    @IBOutlet weak var view: UIView!
    
    @IBOutlet weak var userName: UILabel!
    
    @IBOutlet weak var messageBody: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
