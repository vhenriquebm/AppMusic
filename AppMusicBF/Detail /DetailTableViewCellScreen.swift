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
        label.font =  UIFont.systemFont(ofSize: 17, weight: .bold)
        label.textColor = .black
        return label
    }()
    
    lazy var subTitle: UILabel = {
       let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Teste Nome"
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
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
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
            self.thumbImage.topAnchor.constraint(equalTo: self.topAnchor, constant: 20),
            self.thumbImage.heightAnchor.constraint(equalToConstant: 60),
            self.thumbImage.widthAnchor.constraint(equalToConstant: 60),

            self.title.leadingAnchor.constraint(equalTo: thumbImage.trailingAnchor, constant: 15),
            self.title.topAnchor.constraint(equalTo: self.topAnchor,constant: 17),
            
            self.subTitle.leadingAnchor.constraint(equalTo: thumbImage.trailingAnchor, constant: 15),
            self.subTitle.topAnchor.constraint(equalTo: self.title.bottomAnchor ,constant: 4),
            
            self.moreButton.trailingAnchor.constraint(equalTo: self.trailingAnchor,constant: -15),
            self.moreButton.widthAnchor.constraint(equalToConstant: 35),
            self.moreButton.heightAnchor.constraint(equalToConstant: 35),
            self.moreButton.topAnchor.constraint(equalTo: self.topAnchor, constant: 20),
            
            self.likeButton.trailingAnchor.constraint(equalTo: self.moreButton.leadingAnchor, constant: -15),
            self.likeButton.widthAnchor.constraint(equalToConstant: 35),
            self.likeButton.heightAnchor.constraint(equalToConstant: 35),
            self.likeButton.topAnchor.constraint(equalTo: self.topAnchor,constant: 20)
            
            
        ])
    }
    
    public func setupCell (data: CardListModel) {
        
        self.title.text = data.listTitle
        self.subTitle.text = data.listSubtitle
        self.thumbImage.image = UIImage(named: data.listImage ?? "")
    }
}
