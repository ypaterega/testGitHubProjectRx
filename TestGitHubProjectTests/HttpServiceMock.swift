//
//  HttpServiceMock.swift
//  TestGitHubProjectTests
//
//  Created by Iurii Paterega on 20.10.17.
//  Copyright © 2017 Yuriy Paterega. All rights reserved.
//

@testable import TestGitHubProject
import Foundation
import RxSwift

class HttpServiceMock: HttpService {
    
    var listReturnValue: Observable<[String]> = .empty()
    override func getSearchTypeList() -> Observable<[String]> {
        return listReturnValue
    }
    
    var repositoriesLanguage: String!
    var repositoriesReturnValue: Observable<[RepositoryModel]> = .empty()
    override func getRepositories(bySearchType searchType: String) -> Observable<[RepositoryModel]> {
        repositoriesLanguage = searchType
        return repositoriesReturnValue
    }
}
