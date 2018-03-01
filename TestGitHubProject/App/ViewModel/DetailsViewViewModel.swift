//
//  DetailsViewViewModel.swift
//  TestGitHubProject
//
//  Created by Yuriy Paterega on 18.10.17.
//  Copyright © 2017 Yuriy Paterega. All rights reserved.
//

import RxSwift

class DetailsViewViewModel {
    
    // MARK: - Inputs
    
    let cancel: AnyObserver<Void>
    
    // MARK: - Outputs
 
    let didCancel: Observable<Void>
    
    init() {
 
        let _cancel = PublishSubject<Void>()
        self.cancel = _cancel.asObserver()
        self.didCancel = _cancel.asObservable()
    }
}
