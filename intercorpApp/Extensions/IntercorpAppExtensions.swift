//
//  IntercorpAppExtensions.swift
//  intercorpApp
//
//  Created by Nicolas schmidt on 16/10/2021.
//

import Foundation
import UIKit

//MARK: - Extensions

extension UIStoryboard {
    static func instantiate(viewController viewControllerName: String) -> UIViewController {
        return UIStoryboard(name: viewControllerName, bundle: .main).instantiateViewController(withIdentifier: viewControllerName)
    }
}
extension UIViewController {
    static func instantiateFromStoryboard() -> Self {
      return UIStoryboard.instantiate(viewController: String(describing: self)) as? Self ?? Self()
    }
}
