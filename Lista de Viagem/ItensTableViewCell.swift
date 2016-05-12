//
//  ItensTableViewCell.swift
//  Lista de Viagem
//
//  Created by Leonardo Rodrigues de Morais Brunassi on 07/04/16.
//  Copyright © 2016 Leonardo Rodrigues de Morais Brunassi. All rights reserved.
//

import UIKit

class ItensTableViewCell: UITableViewCell {

    @IBOutlet weak var nomeItem: UILabel!
    @IBOutlet weak var qtdItem: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}