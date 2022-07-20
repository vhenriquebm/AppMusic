
import UIKit

enum ViewMode {
    case full
    case card
}

class CustomCardView: UIView {
    
    var containerLeadingConstraints: NSLayoutConstraint?
    var containerTrailingConstraints: NSLayoutConstraint?
    var containerTopConstraints: NSLayoutConstraint?
    var containerBottomConstraints: NSLayoutConstraint?
    var dataModel: CardViewModel?
    
    init (mode: ViewMode) {
        let frame = CGRect.zero
        super.init(frame: frame)
        self.addSubViews()
        configureConstraints()
        self.updateLayout(mode: mode)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
    lazy var cardContainerView: UIView = {
        let  cardContainerView = UIView ()
        cardContainerView.translatesAutoresizingMaskIntoConstraints = false
        cardContainerView.layer.cornerRadius = 20
        cardContainerView.clipsToBounds = true
        cardContainerView.layer.shadowOpacity = 1
        cardContainerView.layer.shadowOffset = CGSize(width: 0, height: -2)
        cardContainerView.layer.shadowRadius = 20
        return cardContainerView
    }()
    
    lazy var cardImage: UIImageView = {
        let cardImage = UIImageView()
        cardImage.translatesAutoresizingMaskIntoConstraints = false
        cardImage.backgroundColor = .black
        cardImage.contentMode = .scaleAspectFill
        return cardImage
    }()
    
    lazy var overLayView: UIView = {
        let  overLayView = UIView ()
        overLayView.translatesAutoresizingMaskIntoConstraints = false
        overLayView.backgroundColor = UIColor.black.withAlphaComponent(0.6)
        return overLayView
    }()
    
    lazy var profileBorderView: UIView = {
        let  profileBorderView = UIView ()
        profileBorderView.translatesAutoresizingMaskIntoConstraints = false
        profileBorderView.backgroundColor = .clear
        profileBorderView.layer.borderWidth = 2
        profileBorderView.layer.borderColor = UIColor.white.cgColor
        profileBorderView.layer.cornerRadius = 25
        return profileBorderView
    }()
    
    lazy var cardProfilePicture: UIImageView = {
        let cardProfilePicture = UIImageView()
        cardProfilePicture.translatesAutoresizingMaskIntoConstraints = false
        cardProfilePicture.backgroundColor = .black
        cardProfilePicture.contentMode = .scaleAspectFill
        cardProfilePicture.layer.cornerRadius = 20
        cardProfilePicture.clipsToBounds = true
        return cardProfilePicture
    }()
    
    lazy var addprofileImageButton: UIButton = {
        let addprofileImageButton = UIButton()
        addprofileImageButton.translatesAutoresizingMaskIntoConstraints = false
        addprofileImageButton.backgroundColor = . white
        addprofileImageButton.setBackgroundImage(UIImage(named: "plus"), for: .normal)
        addprofileImageButton.layer.cornerRadius = 10
        return addprofileImageButton
    }()
    
    lazy var cardCategoryTittleLabel: UILabel = {
        let cardCategoryTittleLabel = UILabel()
        cardCategoryTittleLabel.translatesAutoresizingMaskIntoConstraints = false
        cardCategoryTittleLabel.font = UIFont.systemFont(ofSize: 12, weight: .bold)
        cardCategoryTittleLabel.textColor = .white
        return cardCategoryTittleLabel
    }()
    
    lazy var cardCategoryDateLabel: UILabel = {
        let cardCategoryDateLabel = UILabel()
        cardCategoryDateLabel.translatesAutoresizingMaskIntoConstraints = false
        cardCategoryDateLabel.font = UIFont.systemFont(ofSize: 11)
        cardCategoryDateLabel.textColor = .white
        return cardCategoryDateLabel
    }()
    
    lazy var cardCategoryTitle: UILabel = {
        let cardCategoryTitle = UILabel()
        cardCategoryTitle.translatesAutoresizingMaskIntoConstraints = false
        cardCategoryTitle.font = UIFont.systemFont(ofSize: 31, weight: .bold)
        cardCategoryTitle.textColor = .white
        cardCategoryTitle.textAlignment = .center
        return cardCategoryTitle
    }()
    
    lazy var likeAndTimeLabel: UILabel = {
        let likeAndTimeLabel = UILabel()
        likeAndTimeLabel.translatesAutoresizingMaskIntoConstraints = false
        return likeAndTimeLabel
    }()
    
    lazy var descriptionTitleLabel: UILabel = {
        let descriptionTitleLabel = UILabel()
        descriptionTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        descriptionTitleLabel.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        descriptionTitleLabel.textColor = .white
        descriptionTitleLabel.numberOfLines = 0
        return descriptionTitleLabel
    }()
    
    lazy var actionsView: CardActionView = {
       
        let view = CardActionView ()
        view.translatesAutoresizingMaskIntoConstraints = true
        
        return view
    }()
    
    
    private func addSubViews () {
        self.addSubview(cardContainerView)
      cardContainerView.addSubview(cardImage)
        cardContainerView.addSubview(overLayView)
        cardContainerView.addSubview(profileBorderView)
       cardContainerView.addSubview(cardProfilePicture)
        cardContainerView.addSubview(addprofileImageButton)
        cardContainerView.addSubview(cardCategoryTittleLabel)
        cardContainerView.addSubview(cardCategoryDateLabel)
        cardContainerView.addSubview(cardCategoryTitle)
        cardContainerView.addSubview(likeAndTimeLabel)
        cardContainerView.addSubview(descriptionTitleLabel)
        updateLayout(mode: .card)
        self.cardContainerView.addSubview(self.actionsView)
    }
    
    func configureConstraints () {
        
        containerLeadingConstraints = cardContainerView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 30)
        containerLeadingConstraints?.isActive = true
        
        containerTopConstraints = cardContainerView.topAnchor.constraint(equalTo: self.topAnchor, constant: 15)
        containerTopConstraints?.isActive = true
        
        containerBottomConstraints = cardContainerView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -15)
        containerBottomConstraints?.isActive = true
        
        containerTrailingConstraints = cardContainerView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -30)
        containerTrailingConstraints?.isActive = true
        
        overLayView.pin(to: cardContainerView)
        cardImage.pin(to: cardContainerView)
        
        NSLayoutConstraint.activate([
        
            profileBorderView.topAnchor.constraint(equalTo: cardContainerView.topAnchor,constant: 60),
            profileBorderView.centerXAnchor.constraint(equalTo: cardContainerView.centerXAnchor),
            profileBorderView.widthAnchor.constraint(equalToConstant: 50),
            profileBorderView.heightAnchor.constraint(equalToConstant: 50),
            
            addprofileImageButton.trailingAnchor.constraint(equalTo: profileBorderView.trailingAnchor, constant: 4),
            addprofileImageButton.bottomAnchor.constraint(equalTo: profileBorderView.bottomAnchor, constant: 4),
            addprofileImageButton.widthAnchor.constraint(equalToConstant: 20),
            addprofileImageButton.heightAnchor.constraint(equalToConstant: 20),

            
           
           cardProfilePicture.centerXAnchor.constraint(equalTo: profileBorderView.centerXAnchor),
            cardProfilePicture.centerYAnchor.constraint(equalTo: profileBorderView.centerYAnchor),
            cardProfilePicture.widthAnchor.constraint(equalToConstant: 40),
            cardProfilePicture.heightAnchor.constraint(equalToConstant: 40),


            cardCategoryTittleLabel.topAnchor.constraint(equalTo: profileBorderView.bottomAnchor, constant: 10),
            cardCategoryTittleLabel.centerXAnchor.constraint(equalTo: cardContainerView.centerXAnchor),
            
            cardCategoryDateLabel.topAnchor.constraint(equalTo: cardCategoryTittleLabel.bottomAnchor, constant: 2),
            cardCategoryDateLabel.centerXAnchor.constraint(equalTo: cardContainerView.centerXAnchor),
            cardCategoryTitle.topAnchor.constraint(equalTo: cardCategoryDateLabel.topAnchor, constant: 20),
            
            cardCategoryTitle.leadingAnchor.constraint(equalTo: cardContainerView.leadingAnchor, constant: 20),
            cardCategoryTitle.trailingAnchor.constraint(equalTo: cardContainerView.trailingAnchor, constant: -20),
            
            
            likeAndTimeLabel.topAnchor.constraint(equalTo: cardCategoryTitle.bottomAnchor, constant: 10),
            
            likeAndTimeLabel.centerXAnchor.constraint(equalTo: cardContainerView.centerXAnchor),
            
            descriptionTitleLabel.topAnchor.constraint(equalTo: likeAndTimeLabel.topAnchor, constant: 30),
            descriptionTitleLabel.leadingAnchor.constraint(equalTo: cardContainerView.leadingAnchor, constant: 40),
            descriptionTitleLabel.trailingAnchor.constraint(equalTo: cardContainerView.trailingAnchor, constant: -40),
            
            
            
            self.actionsView.bottomAnchor.constraint(equalTo: self.cardContainerView.bottomAnchor, constant: -20),
            self.actionsView.leadingAnchor.constraint(equalTo: self.cardContainerView.leadingAnchor, constant: 20),
            self.actionsView.bottomAnchor.constraint(equalTo: self.cardContainerView.bottomAnchor, constant: -20),
            self.actionsView.trailingAnchor.constraint(equalTo: self.cardContainerView.trailingAnchor, constant: -20),
            self.actionsView.heightAnchor.constraint(equalToConstant: 80)
            
        ])
    }
    
    private func updateLayout (mode: ViewMode)  {
        
        if mode == .full {
            containerTopConstraints?.constant = 0
            containerBottomConstraints?.constant = 0
            containerLeadingConstraints?.constant = 0
            containerTrailingConstraints?.constant = 0
            descriptionTitleLabel.isHidden = false
            
        } else {
            descriptionTitleLabel.isHidden = true
            containerTopConstraints?.constant = 15
            containerTrailingConstraints?.constant = -30
            containerLeadingConstraints?.constant = 30
            containerBottomConstraints?.constant = -15
        }
        
    }
    
    public func setupView (data: CardViewModel) {
        
        cardCategoryTittleLabel.text = data.categoryName
        cardCategoryDateLabel.text = data.categoryDate
        cardCategoryTitle.text = data.cardTitle
        likeAndTimeLabel.attributedText = NSAttributedString.featureText(data.likeCount ?? "", data.duration ?? "")
        descriptionTitleLabel.text = data.cardDescription
        cardImage.image = UIImage(named: data.cardImage ?? "")
        cardProfilePicture.image = UIImage(named: data.categoryImage ?? "")
    }
}
