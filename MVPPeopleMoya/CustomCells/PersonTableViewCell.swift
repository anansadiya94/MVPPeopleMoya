//
//  PersonTableViewCell.swift
//  MVPPeopleMoya
//
//  Created by Anan Sadiya on 11/11/2019.
//  Copyright © 2019 Anan Sadiya. All rights reserved.
//

import UIKit

class PersonTableViewCell: UITableViewCell {
    @IBOutlet weak var personName: UILabel!
    
    func setUpCell(_ person: Person) {
        self.personName.text = person.name
    }
}
