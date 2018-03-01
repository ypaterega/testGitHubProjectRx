//
//  SearchTypeListFlowController.swift
//  TestGitHubProject
//
//  Created by Yuriy Paterega on 19.10.17.
//  Copyright © 2017 Yuriy Paterega. All rights reserved.
//

import Foundation
import UIKit
import RxSwift

/// Type that defines possible coordination results of the `SearchTypeListCoordinator`.
///
/// - SearchType: SearchType was choosen.
/// - cancel: Cancel button was tapped.

enum SearchTypeListFlowControllerResult {
    case searchType(String)
    case cancel
}

class SearchTypeListFlowController: BaseCoordinator<SearchTypeListFlowControllerResult> {
    
    private let rootViewController: UIViewController
    
    init(rootViewController: UIViewController) {
        self.rootViewController = rootViewController
    }
    
    override func start() -> Observable<CoordinationResult> {
        let viewController = SearchTypeViewController.initFromStoryboard(name: "Main")
        let navigationController = UINavigationController(rootViewController: viewController)
        
        let viewModel = SearchTypeListViewModel()
        viewController.viewModel = viewModel
        
        let cancel = viewModel.didCancel.map { _ in CoordinationResult.cancel }
        let searchType = viewModel.didSelectSearchType.map { CoordinationResult.searchType($0) }
        
        rootViewController.present(navigationController, animated: true)
        
        return Observable.merge(cancel, searchType)
            .take(1)
            .do(onNext: { [weak self] _ in self?.rootViewController.dismiss(animated: true) })
    }
}
