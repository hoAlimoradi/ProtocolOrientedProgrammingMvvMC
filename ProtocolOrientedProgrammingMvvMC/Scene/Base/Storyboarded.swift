//
//  Storyboarded.swift
//  ProtocolOrientedProgrammingMvvMC
//
//  Created by Hosein Alimoradi on 12/3/1401 AP.
//
import UIKit

private enum Constants {
    static let mainStoryboard = "Main"
}

protocol Storyboarded {}

extension Storyboarded where Self: UIViewController {
    static func instantiateMain() -> Self {
        return UIStoryboard(name: Constants.mainStoryboard, bundle: Bundle.main)
            .instantiateViewController(withIdentifier: className(of: self)) as! Self
    }

    static func instantiate() -> Self {
        return UIStoryboard(name: className(of: self), bundle: Bundle.main)
            .instantiateInitialViewController() as! Self
    }
}

