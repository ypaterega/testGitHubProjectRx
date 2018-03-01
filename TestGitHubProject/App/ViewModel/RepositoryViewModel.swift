//
//  RepositoryViewModel.swift
//  TestGitHubProject
//
//  Created by Iurii Paterega on 19.10.17.
//  Copyright © 2017 Yuriy Paterega. All rights reserved.
//

import Foundation

class RepositoryViewModel {
    let name: String
    let description: String
    let stars: String
    let url: URL
    let size: String
    let watchers: String
    
    init(repository: RepositoryModel) {
        self.name = "Repoitory name:  \(repository.full_name)"
        self.description = repository.description
        self.stars = "Stars count: \(repository.stargazers_count)"
        self.url = URL(string: repository.url)!
        self.size = "Size in KB: \(repository.size)"
        self.watchers = "Watchers count: \(repository.watchers_count)"
    }
}
