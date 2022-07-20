//
//  DetailTableViewCellScreen.swift
//  AppMusicBF
//
//  Created by Vitor Henrique Barreiro Marinho on 20/07/22.
//

import UIKit

class DetailTableViewCellScreen: UIView {

    lazy var thumbImage: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(named: "demo")
        image.layer.cornerRadius = 5
        image.clipsToBounds = true
        return image
    }()
    
    lazy var title: UILabel = {
       let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Teste Nome"
        label.numberOfLines = 0
        label.font =  UIFont.systemFont(ofSize: 17, weight: .bold)
        label.textColor = .black
        return label
    }()
    
    lazy var subTitle: UILabel = {
       let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Teste Nome"
        label.numberOfLines = 0
        label.font =  UIFont.systemFont(ofSize: 16, weight: .bold)
        label.textColor = .black
        return label
    }()
    
    lazy var likeButton:UIButton = {
       let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setBackgroundImage(UIImage(named: "love")?.withRenderingMode(.alwaysTemplate), for: .normal)
        button.tintColor = .lightGray
        return button
    }()
    
    lazy var moreButton:UIButton = {
       let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setBackgroundImage(UIImage(named: "more")?.withRenderingMode(.alwaysTemplate), for: .normal)
        button.tintColor = .lightGray
        return button
    }()
    
    
    //MARK: - PRIVATE METHODS
    
    
    private func configureUI () {
        
        addViews()
        
        configureConstraints()
    }
    
    
    private func addViews () {
        
        self.addSubview(thumbImage)
        self.addSubview(title)
        self.addSubview(subTitle)
        self.addSubview(likeButton)
        self.addSubview(moreButton)

    }
    
    
    private func configureConstraints () {
        
        NSLayoutConstraint.activate([
            
            self.thumbImage.leadingAnchor.constraint(equalTo: self.leadingAnchor,constant: 20),
            self.thumbImage.topAnchor.constraint(equalTo: self.topAnchor,constant: 20),
            self.thumbImage.heightAnchor.constraint(equalToConstant: 80),
            self.thumbImage.widthAnchor.constraint(equalToConstant: 80),

            self.title.leadingAnchor.constraint(equalTo: thumbImage.trailingAnchor, constant: 10),
            self.title.topAnchor.constraint(equalTo: self.topAnchor,constant: 20),
            
            self.subTitle.leadingAnchor.constraint(equalTo: thumbImage.trailingAnchor, constant: 10),
            self.title.topAnchor.constraint(equalTo: self.title.bottomAnchor ,constant: 20),
            
            self.likeButton.topAnchor.constraint(equalTo: self.topAnchor,constant: 30),
            self.likeButton.leadingAnchor.constraint(equalTo: self.title.trailingAnchor, constant: 20),
        
            self.moreButton.topAnchor.constraint(equalTo: self.topAnchor,constant: 30),
            self.moreButton.leadingAnchor.constraint(equalTo: self.likeButton.trailingAnchor, constant: 20),
        ])
    }
}
