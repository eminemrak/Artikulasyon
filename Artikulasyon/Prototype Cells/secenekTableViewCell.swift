//
//  secenekTableViewCell.swift
//  Artikulasyon
//
//  Created by Eminko on 29.07.2022.
//

import UIKit

class secenekTableViewCell: UITableViewCell {

    @IBOutlet weak var view: UIView!
    @IBOutlet weak var secenekTextLabel: UILabel!
    @IBOutlet weak var starTextLabel: UILabel!
    @IBOutlet weak var totalTextLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
