//
//  AppDelegate.swift
//  TestGitHubProject
//
//  Created by Yuriy Paterega on 18.10.17.
//  Copyright © 2017 Yuriy Paterega. All rights reserved.
//

import UIKit
import RxSwift

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    
    private let disposeBag = DisposeBag()
    private var mainFlowController: AppFlowController!
    
    func application(_ application: UIApplication,
                     didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        
        window = UIWindow()
        mainFlowController = AppFlowController(window: window!)
        mainFlowController.start()
                            .subscribe()
                            .disposed(by: disposeBag)
    
        return true
    }
    
}
