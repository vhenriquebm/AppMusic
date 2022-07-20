
import UIKit

class CardViewTableViewCell: UITableViewCell {
    
    let cardView: CustomCardView = {
        let cardView = CustomCardView(mode: .card)
        cardView.translatesAutoresizingMaskIntoConstraints = false
        cardView.clipsToBounds = true
        return cardView
    }()
    
    static let identifier: String = "CardViewTableViewCell"
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupView()
        setupConstraints()
        self.selectionStyle = .none
    }
    
    public func setupCell (data: CardViewModel) {
        cardView.setupView(data: data)
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    fileprivate func setupView () {
        self.contentView.addSubview(cardView)
    }
    
    fileprivate func setupConstraints () {
        
        cardView.pin(to: self)
    }
}
