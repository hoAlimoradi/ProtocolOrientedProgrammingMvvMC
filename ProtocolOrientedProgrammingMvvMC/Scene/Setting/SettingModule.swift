//
//  SettingModule.swift
//  ProtocolOrientedProgrammingMvvMC
//
//  Created by Hosein Alimoradi
//
import UIKit

enum SettingModule {

    struct Configuration {}

    // MARK: - Alias
    typealias SceneView = SettingViewController

    static func build(with configuration: Configuration) -> SceneView {
        let viewModel = SettingViewModel(configuration: configuration)
        let router = SettingRouter(config: configuration)
        let viewController = SceneView(configuration: configuration,
                                       viewModel: viewModel,
                                       router: router)
        router.viewController = viewController
        return viewController
    }
}

