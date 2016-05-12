//
//  Tutorial.swift
//  Lista de Viagem
//
//  Created by Leonardo Rodrigues de Morais Brunassi on 12/05/16.
//  Copyright © 2016 Leonardo Rodrigues de Morais Brunassi. All rights reserved.
//

import Foundation
import UIKit

class Tutorial : UIView {
    override init (frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = UIColor(red: 247/255, green: 247/255, blue: 247/255, alpha: 1)
        
        let lbl = UILabel(frame: CGRectMake(30, -70, frame.width - 60, frame.height))
        lbl.textAlignment = .Center
        lbl.font = UIFont (name: "Avenir Next Condensed", size: 27)
        lbl.textColor = UIColor(red: 103/255, green: 65/255, blue: 114/255, alpha: 1)
        lbl.numberOfLines = 0
        lbl.text = "Não há itens registrados!"
        //let img = UIImageView(frame: CGRectMake(140, 150, 100, 100))
        //img.image = UIImage(named: "exclamacao")
        //self.addSubview(img)
        self.addSubview(lbl)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
