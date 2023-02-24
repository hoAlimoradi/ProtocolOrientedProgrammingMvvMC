//
//  ReplaceSegue.swift
//  ProtocolOrientedProgrammingMvvMC
//
//  Created by Hosein Alimoradi on 12/3/1401 AP.
//

import Foundation
import UIKit

class ReplaceSegue: UIStoryboardSegue {

    override func perform() {
        (source as? UINavigationController)?.setViewControllers([destination], animated: false)
    }

}

extension UIViewController {

    func performSegue(_ segue: Segue, sender: Any?) {
        self.performSegue(withIdentifier: segue.rawValue, sender: sender)
    }

}

enum Segue: String {
    case showTabBar
    case showLogin
    case showAppBlockedMessage

    static func segue(from storyboardSegue: UIStoryboardSegue) -> Segue? {
        return Segue(rawValue: storyboardSegue.identifier ?? "")
    }
}


