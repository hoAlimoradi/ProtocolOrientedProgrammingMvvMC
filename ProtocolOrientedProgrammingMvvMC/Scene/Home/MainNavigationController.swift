//
//  MainNavigationController.swift
//  ProtocolOrientedProgrammingMvvMC
//
//  Created by Hosein Alimoradi on 12/3/1401 AP.
//
import Foundation
import UIKit

final class MainNavigationController: UINavigationController {

    override func viewDidLoad() {
       
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let identifier = segue.identifier,
              let segueIdentifier = Segue(rawValue: identifier) else {
            return
        }
        switch segueIdentifier {
        case .showLogin:
            break
        case .showTabBar:
            if let tabController = segue.destination as? UITabBarController {
                tabController.selectedIndex = 0
            }
        default: break
        }
    }

}
