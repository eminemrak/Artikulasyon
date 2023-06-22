//
//  friendTableViewCell.swift
//  Artikulasyon
//
//  Created by Eminko on 30.11.2022.
//

import UIKit

class friendTableViewCell: UITableViewCell {

    @IBOutlet weak var friendLabel: UILabel!
    @IBOutlet weak var view: UIView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
