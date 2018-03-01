//
//  MainViewFlowController.swift
//  TestGitHubProject
//
//  Created by Yuriy Paterega on 18.10.17.
//  Copyright © 2017 Yuriy Paterega. All rights reserved.
//

import UIKit
import RxSwift
import SafariServices

class MainViewFlowController: BaseCoordinator<Void> {
    
    private let window: UIWindow
    
    init(window: UIWindow) {
        self.window = window
    }
    
    override func start() -> Observable<Void> {
        let viewModel = MainViewViewModel(initialSearchType: "Java")
        let viewController = MainViewController.initFromStoryboard(name: "Main")
        let navigationController = UINavigationController(rootViewController: viewController)
        
        viewController.viewModel = viewModel
        
        viewModel.showDetails
            .flatMap { [weak self] _ -> Observable<String?> in
                guard let `self` = self else { return .empty() }
                return self.showDetailsList(on: viewController)
            }
            .filter { $0 != nil }
            .map { $0! }
            .bind(to: viewModel.setCurrentSearchType)
            .disposed(by: disposeBag)
        
        viewModel.showSearchTypeList
            .flatMap { [weak self] _ -> Observable<String?> in
                guard let `self` = self else { return .empty() }
                return self.showSearchTypeList(on: viewController)
            }
            .filter { $0 != nil }
            .map { $0! }
            .bind(to: viewModel.setCurrentSearchType)
            .disposed(by: disposeBag)
        
        window.rootViewController = navigationController
        window.makeKeyAndVisible()
        
        return Observable.never()
    }
    
    private func showDetailsList(on rootViewController: UIViewController) -> Observable<String?> {
        let detailsListFlowController = DetailsViewFlowController(rootViewController: rootViewController)
        return coordinate(to: detailsListFlowController)
            .map { result in
               return nil
        }
    }
    
    private func showSearchTypeList(on rootViewController: UIViewController) -> Observable<String?> {
        let searchTypeListFlowController = SearchTypeListFlowController(rootViewController: rootViewController)
        return coordinate(to: searchTypeListFlowController)
            .map { result in
                switch result {
                case .searchType(let searchType): return searchType
                case .cancel: return nil
                }
        }
    }
}
