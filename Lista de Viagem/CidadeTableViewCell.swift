//
//  CidadeTableViewCell.swift
//  Lista de Viagem
//
//  Created by Leonardo Rodrigues de Morais Brunassi on 05/04/16.
//  Copyright © 2016 Leonardo Rodrigues de Morais Brunassi. All rights reserved.
//

import UIKit

class CidadeTableViewCell: UITableViewCell {

    @IBOutlet weak var nomeCidade: UILabel!
    @IBOutlet weak var qtdDias: UILabel!
    @IBOutlet weak var msgSemCidade: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
