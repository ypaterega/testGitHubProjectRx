//
//  SearchTypeCell.swift
//  TestGitHubProject
//
//  Created by Yuriy Paterega on 19.10.17.
//  Copyright © 2017 Yuriy Paterega. All rights reserved.
//

import Foundation
import UIKit

class SearchTypeCell: UITableViewCell {
    
    @IBOutlet private weak var searchTypeLabel: UILabel!
    
    func setSearchType(_ searchType: String) {
        searchTypeLabel.text = searchType
    }
}
