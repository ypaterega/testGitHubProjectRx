//
//  RepositoryCell.swift
//  TestGitHubProject
//
//  Created by Yuriy Paterega on 19.10.17.
//  Copyright © 2017 Yuriy Paterega. All rights reserved.
//

import Foundation
import UIKit

class RepositoryCell: UITableViewCell {
    
    @IBOutlet private weak var nameLabel: UILabel!
    @IBOutlet private weak var descriptionLabel: UILabel!
    @IBOutlet private weak var starsLabel: UILabel!
    @IBOutlet private weak var sizeLabel: UILabel!
    @IBOutlet private weak var watchersLabel: UILabel!
    
    func setName(_ name: String) {
        nameLabel.text = name
    }
    
    func setDescription(_ description: String) {
        descriptionLabel.text = description
    }
    
    func setStarsCountTest(_ starsText: String) {
        starsLabel.text = starsText
    }
    
    func setSize(_ sizeText: String) {
        sizeLabel.text = sizeText
    }
    
    func setWatchers(_ watchersText: String) {
        watchersLabel.text = watchersText
    }
}
