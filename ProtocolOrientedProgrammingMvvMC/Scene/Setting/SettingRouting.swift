//
//  SettingRouting.swift
//  ProtocolOrientedProgrammingMvvMC
//
//  Created by Hosein Alimoradi on 12/3/1401 AP.
//
import UIKit

// sourcery: AutoMockable
protocol SettingRouting: Router {

}

final class SettingRouter: SettingRouting {

    // MARK: - Properties
    weak var viewController: UIViewController?
    private let config: SettingModule.Configuration

    // MARK: - Initilize
    init(config: SettingModule.Configuration) {
        self.config = config
    }
}

