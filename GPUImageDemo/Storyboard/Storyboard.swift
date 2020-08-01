//
//  Storyboard.swift
//  GPUImageDemo
//
//  Created by CainLuo on 2020/8/1.
//  Copyright © 2020 CainLuo. All rights reserved.
//

import UIKit

enum Storyboard: String {
    case VideoOperation
    case CameraOperation
    case ImageOperation

    func instantiate<VC: UIViewController>(_ viewController: VC.Type) -> VC {
      guard
          let vc = UIStoryboard(name: self.rawValue, bundle: nil)
          .instantiateViewController(withIdentifier: VC.storyboardIdentifier) as? VC
        else { fatalError("Couldn't instantiate \(VC.storyboardIdentifier) from \(self.rawValue)") }

      return vc
    }
}

extension UIViewController {
  public static var defaultNib: String {
    return self.description().components(separatedBy: ".").dropFirst().joined(separator: ".")
  }

  public static var storyboardIdentifier: String {
    return self.description().components(separatedBy: ".").dropFirst().joined(separator: ".")
  }
}
