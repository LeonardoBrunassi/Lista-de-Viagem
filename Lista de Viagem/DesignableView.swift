//
//  DesignableView.swift
//  boxMovement
//
//  Created by Leonardo Rodrigues de Morais Brunassi on 15/04/15.
//  Copyright (c) 2015 Leonardo Brunassi. All rights reserved.
//

import Foundation
import UIKit

extension UIView {
    @IBInspectable
    var borderWidth: CGFloat {
        get {
            return layer.borderWidth
        }
        set {
            layer.borderWidth = newValue
        }
    }
    
//    @IBInspectable
//    var borderColor: UIColor {
//        get {
//            return UIColor(CGColor: layer.borderColor)!
//        }
//        set {
//            layer.borderColor = newValue.CGColor
//        }
//    }
    
    @IBInspectable
    var cornerRadius: CGFloat {
        get {
            return layer.cornerRadius
        }
        set {
            layer.cornerRadius = newValue
        }
    }
    
    @IBInspectable
    var clipping: Bool {
        get {
            return clipsToBounds
        }
        set {
            clipsToBounds = newValue
        }
    }
}

@IBDesignable
class LBImageView: UIImageView {
    @IBInspectable
    var clips: Bool {
        get {
            return self.clipsToBounds
        }
        set {
            self.clipsToBounds = newValue
        }
    }
}

@IBDesignable
class LBButton: UIButton {}

@IBDesignable
class LBLabel: UILabel {}

@IBDesignable
class LBView: UIView {}

@IBDesignable
class LBTextField: UITextField {}

@IBDesignable
class LBTextView: UITextView {}