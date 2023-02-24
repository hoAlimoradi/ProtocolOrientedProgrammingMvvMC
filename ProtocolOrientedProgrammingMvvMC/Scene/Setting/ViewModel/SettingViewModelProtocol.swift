//
//  SettingViewModelProtocol.swift
//  ProtocolOrientedProgrammingMvvMC
//
//  Created by Hosein Alimoradi on 12/3/1401 AP.
//

import Combine

// sourcery: AutoMockable
protocol SettingViewModelProtocol {
    var state: CurrentValueSubject<SettingViewModelState, Never> { get }
    func action(_ handler: SettingViewModelAction)
}

enum SettingFetchState: Equatable {
    case idle
    case loading
    case success(String?)
    case failed(Error)

    static func == (lhs: SettingFetchState, rhs: SettingFetchState) -> Bool {
        switch (lhs, rhs) {
        case (.idle, .idle), (.loading, .loading):
            return true
        case let (.success(lhs), .success(rhs)):
            return lhs == rhs
        case let (.failed(lhs), .failed(rhs)):
            return lhs.localizedDescription == rhs.localizedDescription
        default: return false
        }
    }
}

enum SettingRouteAction {}

struct SettingViewModelState {
    let route: SettingRouteAction?
    let settingFetchState: SettingFetchState?

    init(route: SettingRouteAction? = nil,
         settingFetchState: SettingFetchState? = nil) {
        self.route = route
        self.settingFetchState = settingFetchState ?? .idle
    }

    func update(
        route: SettingRouteAction? = nil,
        settingFetchState: SettingFetchState? = nil) -> Self {
            .init(route: self.route,
                  settingFetchState: settingFetchState ?? self.settingFetchState)
        }
}

enum SettingViewModelAction {}



