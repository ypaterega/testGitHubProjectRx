//
//  RepositoryModel.swift
//  TestGitHubProject
//
//  Created by Yuriy Paterega on 18.10.17.
//  Copyright © 2017 Yuriy Paterega. All rights reserved.
//

import Foundation
import UIKit
import ObjectMapper

class RepositoryModel: Mappable {
    var full_name: String = ""
    var description: String = ""
    var stargazers_count: Int = 0
    var url: String = ""
    var size: Int = 0
    var language: String = ""
    var watchers_count: Int = 0

    required init?(map: Map) {
    }
    
   func mapping(map: Map) {
        full_name <- map["full_name"]
        description <- map["description"]
        stargazers_count <- map["stargazers_count"]
        url <- map["url"]
        size <- map["size"]
        language <- map["language"]
        watchers_count <- map["watchers_count"]
    }
}
