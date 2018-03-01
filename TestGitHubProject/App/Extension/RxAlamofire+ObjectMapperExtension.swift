//
//  RxAlamofire+ObjectMapperExtension.swift
//  TestGitHubProject
//
//  Created by Yuriy Paterega on 20.10.17.
//  Copyright © 2017 Yuriy Paterega. All rights reserved.
//
// Had problem with this mapper. Know what 2 do. 

import Foundation
import ObjectMapper
import RxSwift

extension ObservableType {
        
    public func mapArray<T: Mappable>(type: T.Type) -> Observable<[T]> {
        return flatMap { data -> Observable<[T]> in
            let json = (data as? [String:AnyObject])?["items"] //TODO
            guard let objects = Mapper<T>().mapArray(JSONObject: json) else {
                throw NSError(
                    domain: "",
                    code: -1,
                    userInfo: [NSLocalizedDescriptionKey: "ObjectMapper can't mapping"]
                )
            }
            
            return Observable.just(objects)
        }
    }
}
