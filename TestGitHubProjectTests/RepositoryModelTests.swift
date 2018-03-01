//
//  RepositoryModelTests.swift
//  
//
//  Created by Iurii Paterega on 20.10.17.
//

@testable import TestGitHubProject

import XCTest
import Foundation
import ObjectMapper

class RepositoryModelTests: XCTestCase {
    
    private let json: [String: Any] = [
        "full_name": "Name",
        "description": "Description",
        "stargazers_count": 4,
        "url": "https://apple.com",
        "size": "100",
        "language": "Swift",
        "watchers_count": "13"
    ]
    
    override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func test_all_Fields() {
        guard let repository = Mapper<RepositoryModel>().map(JSONObject: json) else {
            return XCTFail()
        }
        
        XCTAssertEqual(repository.full_name, "Name")
        XCTAssertEqual(repository.description, "Description")
        XCTAssertEqual(repository.stargazers_count, 4)
        XCTAssertEqual(repository.url, "https://apple.com")
    }
}
