//
//  mojaCelijaPodaci.swift
//  VezTabela007
//
//  Created by Milos Jovanovic on 03/02/2019.
//  Copyright © 2019 Milos Jovanovic. All rights reserved.
//

import UIKit

class mojaCelijaPodaci: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    @IBOutlet weak var prikazManji: UIImageView!
    @IBOutlet weak var ime: UILabel!
    @IBOutlet weak var nazivSlike: UILabel!
    @IBOutlet weak var stil: UILabel!
    @IBOutlet weak var velicina: UILabel!
    @IBOutlet weak var cena: UILabel!
    
}
