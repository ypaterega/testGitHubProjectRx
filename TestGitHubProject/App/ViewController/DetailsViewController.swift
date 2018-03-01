//
//  DetailsViewController.swift
//  TestGitHubProject
//
//  Created by Yuriy Paterega on 18.10.17.
//  Copyright © 2017 Yuriy Paterega. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class DetailsViewController: UIViewController, StoryboardInit {
    
    let disposeBag = DisposeBag()
    var viewModel: DetailsViewViewModel!
    
    private let cancelButton = UIBarButtonItem(barButtonSystemItem: .cancel,
                                               target: nil, action: nil)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
        setupBindings()
    }
    
    private func setupUI() {
        navigationItem.leftBarButtonItem = cancelButton
        navigationItem.title = "Repository details"
    }
    
    private func setupBindings() {
        
        cancelButton.rx.tap
            .bind(to: viewModel.cancel)
            .disposed(by: disposeBag)
    }
}

