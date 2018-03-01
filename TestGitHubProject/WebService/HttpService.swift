//
//  HttpService.swift
//  TestGitHubProject
//
//  Created by Yuriy Paterega on 18.10.17.
//  Copyright © 2017 Yuriy Paterega. All rights reserved.
//

// URL code presentation can be better

import Foundation
import RxSwift
import RxCocoa
import RxAlamofire

enum ServiceError: Error {
    case cannotParse
}

class HttpService {
    
    fileprivate let mainAdress: String = "https://api.github.com"
    fileprivate let searchRepository: String = "/search/repositories"
    fileprivate let sortType: String = "stars"

    private let session: URLSession
    
    init(session: URLSession = URLSession.shared) {
        self.session = session
    }
    
    func getRepositories(bySearchType searchType: String) -> Observable<[RepositoryModel]> {
        
        let encodedSearchType = searchType.addingPercentEncoding(withAllowedCharacters: CharacterSet.urlQueryAllowed)!
        let url = URL(string: mainAdress + searchRepository  + "?q=languages:\(encodedSearchType)&sort="+sortType)!
    
        return json(.get, url).mapArray(type: RepositoryModel.self)
    }
    
    func getSearchTypeList() -> Observable<[String]> {
        return Observable.just([
            "Java",
            "Swift",
            "SQL"])
    }
}

