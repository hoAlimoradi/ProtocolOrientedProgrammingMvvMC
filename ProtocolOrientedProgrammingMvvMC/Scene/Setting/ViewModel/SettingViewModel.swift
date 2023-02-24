//
//  SettingViewModel.swift
//  ProtocolOrientedProgrammingMvvMC
//
//  Created by Hosein Alimoradi on 12/3/1401 AP.
//
import Combine
import Foundation

final class SettingViewModel: SettingViewModelProtocol {

    private enum Constants {}

    // MARK: - Properties
    var state: CurrentValueSubject<SettingViewModelState, Never>

    // MARK: - Initialize
    init(configuration: SettingModule.Configuration) {
        state = .init(.init())
    }

    func action(_ handler: SettingViewModelAction) {

    }
}
