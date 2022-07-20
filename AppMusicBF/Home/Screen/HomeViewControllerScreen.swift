//
//  HomeViewControllerScreen.swift
//  AppMusicBF
//
//  Created by Vitor Henrique Barreiro Marinho on 28/06/22.
//

import UIKit

class HomeViewControllerScreen: UIView {
    
    public lazy var musicTable: UITableView = {
        let musicTable = UITableView()
        musicTable.separatorStyle = .none
        musicTable.isScrollEnabled = true
        musicTable.tableFooterView = UIView()
        musicTable.showsVerticalScrollIndicator = false
        musicTable.register(CardViewTableViewCell.self, forCellReuseIdentifier: CardViewTableViewCell.identifier)
        return musicTable
    }()
    
    public func configureTableView (delegate:UITableViewDelegate, dataSource: UITableViewDataSource) {
        musicTable.delegate = delegate
        musicTable.dataSource = dataSource
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.addSubview(musicTable)
        configureTableViewConstraints()
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configureTableViewConstraints () {
        musicTable.pin(to: self)
    }
    
}
