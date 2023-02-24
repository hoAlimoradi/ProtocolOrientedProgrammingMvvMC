//
//  SettingViewController.swift
//  ProtocolOrientedProgrammingMvvMC
//
//  Created by Hosein Alimoradi
//
 
import UIKit
import Combine

class SettingViewController: UIViewController {

    private enum Constants {}

    // MARK: - Properties
    private let router: SettingRouting
    private var cancellables = Set<AnyCancellable>()
    let viewModel: SettingViewModelProtocol

    init(configuration: SettingModule.Configuration,
         viewModel: SettingViewModelProtocol,
         router: SettingRouting) {
        self.viewModel =  viewModel
        self.router = router
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError()
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
}
