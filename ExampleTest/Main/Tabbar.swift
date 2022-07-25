//
//  Tabbar.swift
//  ExampleTest
//
//  Created by Macbook on 24/07/2022.
//

import Foundation
import UIKit

class CustomTabBar: UITabBar {
    @IBInspectable var height: CGFloat = 0.0
     override func awakeFromNib() {
            super.awakeFromNib()
            layer.masksToBounds = true
            layer.cornerRadius = 30
            layer.maskedCorners = [.layerMinXMinYCorner,.layerMaxXMinYCorner]
         
         if #available(iOS 15.0, *) {
            let appearance = UITabBarAppearance()
            appearance.configureWithOpaqueBackground()
             appearance.backgroundColor = UIColor(red: 45/255, green: 39/255, blue: 55/255, alpha: 1)
            
            self.standardAppearance = appearance
            self.scrollEdgeAppearance = self.standardAppearance
         }
         
      }
       override func sizeThatFits(_ size: CGSize) -> CGSize {
           var sizeThatFits = super.sizeThatFits(size)
           if height > 0.0 {
               sizeThatFits.height = height
           }
           return sizeThatFits
       }
 }
