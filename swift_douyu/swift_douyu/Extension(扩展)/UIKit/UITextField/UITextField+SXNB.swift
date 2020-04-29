//
//  UITextField+SXNB.swift
//  SwiftyCreditSteward
//
//  Created by 王嘉倩 on 2018/12/5.
//  Copyright © 2018 王嘉倩. All rights reserved.
//

import Foundation
import UIKit
 extension UITextField {
    
     func sxnb_placeholder(text: String, textColor: UIColor, textFont: UIFont) -> Void {
        let attributedText = NSMutableAttributedString(string: text)
        attributedText.addAttribute(NSAttributedString.Key.font, value: textFont, range: NSRange(location: 0, length: text.count))
        attributedText.addAttribute(NSAttributedString.Key.foregroundColor, value: textColor, range: NSRange(location: 0, length: text.count))
        self.attributedPlaceholder = attributedText
    }
    
}
