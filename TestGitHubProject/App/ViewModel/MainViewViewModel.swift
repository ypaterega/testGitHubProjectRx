//
//  MainViewViewModel.swift
//  TestGitHubProject
//
//  Created by Yuriy Paterega on 18.10.17.
//  Copyright © 2017 Yuriy Paterega. All rights reserved.
//

import Foundation
import RxSwift

class MainViewViewModel {
    
    // MARK: - Inputs
    
    let reload: AnyObserver<Void>
    let setCurrentSearchType: AnyObserver<String>
    let chooseSearchType: AnyObserver<Void>
    let selectRepository: AnyObserver<RepositoryViewModel>
    
    // MARK: - Outputs
    
    let repositories: Observable<[RepositoryViewModel]>
    let errorMessage: Observable<String>
    let showDetails: Observable<Void>
    let showSearchTypeList: Observable<Void>
    let title: Observable<String>
    
    init(initialSearchType: String, httpService: HttpService = HttpService()) {
        
        let _currentSearchType = BehaviorSubject<String>(value: initialSearchType)
        self.setCurrentSearchType = _currentSearchType.asObserver()
        
        let _reload = PublishSubject<Void>()
        self.reload = _reload.asObserver()
        
        self.title = _currentSearchType.asObservable()
            .map { "\($0)" }
        
        let _errorMessage = PublishSubject<String>()
        self.errorMessage = _errorMessage.asObservable()
        
        self.repositories = Observable.combineLatest( _reload, _currentSearchType) { _, searchType in searchType }
            .flatMapLatest { searchType in
                httpService.getRepositories(bySearchType: searchType)
                    .catchError { error in
                        _errorMessage.onNext(error.localizedDescription)
                        return Observable.empty()
                }
            }
            .map { repositories in repositories.map(RepositoryViewModel.init) }
        
        let _selectRepository = PublishSubject<RepositoryViewModel>()
        self.selectRepository = _selectRepository.asObserver()
        self.showDetails = _selectRepository.asObservable()
            .map { $0.name }
        
        let _chooseSearchType = PublishSubject<Void>()
        self.chooseSearchType = _chooseSearchType.asObserver()
        self.showSearchTypeList = _chooseSearchType.asObservable()
    }
}

