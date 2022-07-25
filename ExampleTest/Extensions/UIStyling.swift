//
//  UIStyling.swift
//  ExampleTest
//
//  Created by Macbook on 24/07/2022.
//

import Foundation
import UIKit

extension CALayer {
  func applySketchShadow(
    color: UIColor = .gray,
    alpha: Float = 0.2,
    x: CGFloat = 3,
    y: CGFloat = 3,
    blur: CGFloat = 59,
    spread: CGFloat = 0)
  {
    masksToBounds = false
    shadowColor = color.cgColor
    shadowOpacity = alpha
    shadowOffset = CGSize(width: x, height: y)
    shadowRadius = blur / 5.0
    cornerRadius = 20
    if spread == 0 {
      shadowPath = nil
    } else {
      let dx = -spread
      let rect = bounds.insetBy(dx: dx, dy: dx)
      shadowPath = UIBezierPath(rect: rect).cgPath
    }
  }
    
    func applyShadow(
      color: UIColor = .gray,
      alpha: Float = 1,
      x: CGFloat = 3,
      y: CGFloat = 3,
      blur: CGFloat = 59,
      spread: CGFloat = 0)
    {
      masksToBounds = false
      shadowColor = color.cgColor
      shadowOpacity = alpha
      shadowOffset = CGSize(width: x, height: y)
      shadowRadius = blur / 5.0
      cornerRadius = 20
      if spread == 0 {
        shadowPath = nil
      } else {
        let dx = -spread
        let rect = bounds.insetBy(dx: dx, dy: dx)
        shadowPath = UIBezierPath(rect: rect).cgPath
      }
    }
}


@IBDesignable extension UIButton {

    @IBInspectable var borderWidth: CGFloat {
        set {
            layer.borderWidth = newValue
        }
        get {
            return layer.borderWidth
        }
    }

    @IBInspectable var cornerRadius: CGFloat {
        set {
            layer.cornerRadius = newValue
        }
        get {
            return layer.cornerRadius
        }
    }

    @IBInspectable var borderColor: UIColor? {
        set {
            guard let uiColor = newValue else { return }
            layer.borderColor = uiColor.cgColor
        }
        get {
            guard let color = layer.borderColor else { return nil }
            return UIColor(cgColor: color)
        }
    }
}


extension Date {
    func asString() -> String {
        let dateformater = DateFormatter()
        dateformater.dateFormat = "MMMM d, YYYY"
        return dateformater.string(from: self)
    }
}
