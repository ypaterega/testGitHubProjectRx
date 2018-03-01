//
//  MainViewController.swift
//  TestGitHubProject
//
//  Created by Yuriy Paterega on 18.10.17.
//  Copyright © 2017 Yuriy Paterega. All rights reserved.

import UIKit
import RxSwift
import RxCocoa

class MainViewController: UIViewController, StoryboardInit{
    
    @IBOutlet private weak var tableView: UITableView!
    
    private let chooseSearchTypeButton = UIBarButtonItem(barButtonSystemItem: .action, target: nil, action: nil)
    private let refreshControl = UIRefreshControl()
    
    var viewModel: MainViewViewModel!
    private let disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
        setupBindings()
        
        refreshControl.sendActions(for: .valueChanged)
    }
    
    private func setupUI() {
        navigationItem.rightBarButtonItem = chooseSearchTypeButton
        
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.estimatedRowHeight = 120
        tableView.insertSubview(refreshControl, at: 0)
    }
    
    private func setupBindings() {

        viewModel.repositories
            .observeOn(MainScheduler.instance)
            .do(onNext: { [weak self] _ in self?.refreshControl.endRefreshing() })
            .bind(to: tableView.rx.items(cellIdentifier: "RepositoryCell",
                                         cellType: RepositoryCell.self)) { [weak self] (_, repo, cell) in
                self?.setupRepositoryCell(cell, repository: repo)
            }
            .disposed(by: disposeBag)
        
        viewModel.title
            .bind(to: navigationItem.rx.title)
            .disposed(by: disposeBag)
        
        viewModel.errorMessage
            .subscribe(onNext: { [weak self] in self?.presentError(message: $0) })
            .disposed(by: disposeBag)
        
        refreshControl.rx.controlEvent(.valueChanged)
            .bind(to: viewModel.reload)
            .disposed(by: disposeBag)
        
        chooseSearchTypeButton.rx.tap
            .bind(to: viewModel.chooseSearchType)
            .disposed(by: disposeBag)
        
        tableView.rx.modelSelected(RepositoryViewModel.self)
            .bind(to: viewModel.selectRepository)
            .disposed(by: disposeBag)
    }
    
    private func setupRepositoryCell(_ cell: RepositoryCell, repository: RepositoryViewModel) {
        cell.selectionStyle = .none
        cell.setName(repository.name)
        cell.setDescription(repository.description)
        cell.setStarsCountTest(repository.stars)
        cell.setSize(repository.size)
        cell.setWatchers(repository.watchers)
    }
    
    private func presentError(message: String) {
        let alertController = UIAlertController(title: "Error", message: message, preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        present(alertController, animated: true)
    }
}

