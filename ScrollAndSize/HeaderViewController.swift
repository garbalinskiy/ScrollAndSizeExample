//
//  HeaderViewController.swift
//  ScrollAndSize
//
//  Created by Sergey Garbalinskiy on 7/16/18.
//  Copyright © 2018 Sergey Garbalinskiy. All rights reserved.
//

import UIKit

class HeaderViewController: UIViewController {
    
    @IBOutlet var hiddableLabels: [UILabel]!
    
    static let minHeight:CGFloat = 130;
    static let maxHeight:CGFloat = 200;
    
    public func setPreferedHeight(_ preferedHeight: CGFloat) {
        var height = preferedHeight
        
        if height > HeaderViewController.maxHeight {
            height = HeaderViewController.maxHeight
        }
        
        if height < HeaderViewController.minHeight {
            height = HeaderViewController.minHeight
        }
        
        let hiddableLabelsAplpha = (height - HeaderViewController.minHeight) /  (HeaderViewController.maxHeight - HeaderViewController.minHeight)
        
        hiddableLabels.forEach { $0.alpha = hiddableLabelsAplpha }
        
        let currentFrame = view.frame
        view.frame = CGRect(origin: currentFrame.origin, size: CGSize(width: currentFrame.size.width, height: height))
    }

}
