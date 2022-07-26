//
//  CustomNavBar.swift
//  AppMusicBF
//
//  Created by Vitor Henrique Barreiro Marinho on 25/07/22.
//

import UIKit

class CustomNavBar: UIView {
    
    //MARK: - Properties
    
    lazy var categoryTitle: UILabel  = {
        let label = UILabel ()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 12, weight: .bold)
        label.textColor = .white
        label.textAlignment = .center
        return label
    }()
    
    lazy var cardTitle: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        label.textColor = .white
        label.textAlignment = .center
        return label
    }()
    
    lazy var featureLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        return label
    }()
    
    lazy var cardImage: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.contentMode = .scaleToFill
        image.clipsToBounds = true
        return image
    }()
    
    lazy var overLayView: UIView = {
       let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .black.withAlphaComponent(0.7)
        return view
    }()
    
    //MARK: - Overrides

    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureViews()
    }
    
    //MARK: - Public methods

    public func configureView (data: CardViewModel){
        cardTitle.text = data.cardTitle
        categoryTitle.text = data.categoryName
        cardImage.image = UIImage(named: data.cardImage ?? "")
        featureLabel.attributedText = .featureText(data.likeCount ?? "", data.duration ?? "")
    }
    
    //MARK: - Private methods
    
    private func configureViews () {
        self.addSubview(cardImage)
        self.addSubview(overLayView)
        self.addSubview(categoryTitle)
        self.addSubview(cardTitle)
        self.addSubview(featureLabel)
        
        self.configureConstraints()
    }
    
    private func configureConstraints () {
        self.cardImage.pin(to: self)
        self.overLayView.pin(to: self)
        
        NSLayoutConstraint.activate([
            self.categoryTitle.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 5),
            self.categoryTitle.leadingAnchor.constraint(equalTo: self.leadingAnchor,constant: 20),
            self.categoryTitle.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20),
            
            self.cardTitle.leadingAnchor.constraint(equalTo: self.leadingAnchor,constant: 20),
            self.cardTitle.trailingAnchor.constraint(equalTo: self.trailingAnchor,constant: -20),
            self.cardTitle.topAnchor.constraint(equalTo: self.categoryTitle.bottomAnchor,constant: 5),

            self.featureLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            self.featureLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20),
            self.featureLabel.topAnchor.constraint(equalTo: self.cardTitle.bottomAnchor, constant: 5),
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
