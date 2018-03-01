//
//  DetailsViewFlowController.swift
//  TestGitHubProject
//
//  Created by Yuriy Paterega on 18.10.17.
//  Copyright © 2017 Yuriy Paterega. All rights reserved.
//

import Foundation
import UIKit
import RxSwift

enum DetailsViewFlowControllerResult {
    case searchType(String)
    case cancel
}

class DetailsViewFlowController: BaseCoordinator<DetailsViewFlowControllerResult> {
    
    private let rootViewController: UIViewController
    
    init(rootViewController: UIViewController) {
        self.rootViewController = rootViewController
    }
    
    override func start() -> Observable<CoordinationResult> {
        
        let viewController = DetailsViewController.initFromStoryboard(name: "Main")
        let navigationController = UINavigationController(rootViewController: viewController)
        
        let viewModel = DetailsViewViewModel()
        viewController.viewModel = viewModel
        
        let cancel = viewModel.didCancel.map { _ in CoordinationResult.cancel }

        rootViewController.present(navigationController, animated: true)
        
        return Observable.merge(cancel)
            .take(1)
            .do(onNext: { [weak self] _ in self?.rootViewController.dismiss(animated: true) })
    }
}

