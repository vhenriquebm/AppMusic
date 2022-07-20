//
//  DetailTableViewCell.swift
//  AppMusicBF
//
//  Created by Vitor Henrique Barreiro Marinho on 20/07/22.
//

import UIKit

class DetailTableViewCell: UITableViewCell {
    
    static public let identifier: String = "DetailTableViewCell"
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    

}
