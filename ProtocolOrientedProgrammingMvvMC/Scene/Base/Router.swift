//
//  Router.swift
//  ProtocolOrientedProgrammingMvvMC
//
//  Created by Hosein Alimoradi on 12/3/1401 AP.
//
import UIKit

/// Router of each module which need to navigate to other views have to conform to this protocol
/// - Properties: var viewController: UIViewController?
/// This property have to declare as week anywhere you confrom to this protocol.
protocol Router {
    var viewController: UIViewController? { get set }
}
