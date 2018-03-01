//
//  SearchTypeViewModel.swift
//  TestGitHubProject
//
//  Created by Yuriy Paterega on 19.10.17.
//  Copyright © 2017 Yuriy Paterega. All rights reserved.
//

import Foundation
import RxSwift

class SearchTypeListViewModel {
    
    // MARK: - Inputs
    
    let selectSearchType: AnyObserver<String>
    let cancel: AnyObserver<Void>
    
    // MARK: - Outputs
    
    let typeSearch: Observable<[String]>
    
    let didSelectSearchType: Observable<String>
    let didCancel: Observable<Void>
    
    init(httpService: HttpService = HttpService()) {
        self.typeSearch = httpService.getSearchTypeList() // redo
        
        let _selectSearchType = PublishSubject<String>()
        self.selectSearchType = _selectSearchType.asObserver()
        self.didSelectSearchType = _selectSearchType.asObservable()
        
        let _cancel = PublishSubject<Void>()
        self.cancel = _cancel.asObserver()
        self.didCancel = _cancel.asObservable()
    }
}
