//
//  MainViewViewModelTests.swift
//  TestGitHubProjectTests
//
//  Created by Iurii Paterega on 20.10.17.
//  Copyright © 2017 Yuriy Paterega. All rights reserved.
//

@testable import TestGitHubProject
import XCTest
import RxTest
import RxSwift

class MainViewModelTests: XCTestCase {
    
    var testScheduler: TestScheduler!
    var disposeBag: DisposeBag!
    var httpService: HttpServiceMock!
    var viewModel: MainViewViewModel!
    
    override func setUp() {
        super.setUp()
        
        testScheduler = TestScheduler(initialClock: 0)
        disposeBag = DisposeBag()
        httpService = HttpServiceMock()
        viewModel = MainViewViewModel(initialSearchType: "Java", httpService: httpService)
    }
    
    func test_InitWithInitialLanguage_checkTitle() {
        viewModel = MainViewViewModel(initialSearchType: "Java", httpService: httpService)
        let result = testScheduler.start { self.viewModel.title }
        XCTAssertEqual(result.events, [next(200, "Java")])
    }
}

