//
//  SearchTypeViewController.swift
//  TestGitHubProject
//
//  Created by Yuriy Paterega on 19.10.17.
//  Copyright © 2017 Yuriy Paterega. All rights reserved.
//

import Foundation
import UIKit
import RxSwift
import RxCocoa

class SearchTypeViewController: UIViewController, StoryboardInit {
    
    let disposeBag = DisposeBag()
    var viewModel: SearchTypeListViewModel!
    
    @IBOutlet private weak var tableView: UITableView!
    private let cancelButton = UIBarButtonItem(barButtonSystemItem: .cancel, target: nil, action: nil)

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
        setupBindings()
    }
    
    private func setupUI() {
        navigationItem.leftBarButtonItem = cancelButton
        navigationItem.title = "Choose a search type"
        
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.estimatedRowHeight = 40
    }
    
    private func setupBindings() {
        
        viewModel.typeSearch
            .observeOn(MainScheduler.instance)
            .bind(to: tableView.rx.items(cellIdentifier: "SearchTypeCell",
                                         cellType: SearchTypeCell.self)) { (_, searchType, cell) in
                cell.setSearchType(searchType)
                cell.selectionStyle = .none
            }
            .disposed(by: disposeBag)

        tableView.rx.modelSelected(String.self)
            .bind(to: viewModel.selectSearchType)
            .disposed(by: disposeBag)
        
        cancelButton.rx.tap
            .bind(to: viewModel.cancel)
            .disposed(by: disposeBag)
    }
}

