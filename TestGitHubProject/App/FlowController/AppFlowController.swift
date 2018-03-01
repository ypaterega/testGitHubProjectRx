//
//  AppFlowController.swift
//  TestGitHubProject
//
//  Created by Yuriy Paterega on 18.10.17.
//  Copyright © 2017 Yuriy Paterega. All rights reserved.
//

import RxSwift
import Foundation

class AppFlowController: BaseCoordinator<Void> {
    
    private let window: UIWindow
    
    init(window: UIWindow) {
        self.window = window
    }
    
    override func start() -> Observable<Void> {
        let mainViewFlowController = MainViewFlowController(window: window)
        return coordinate(to: mainViewFlowController)
    }
}
