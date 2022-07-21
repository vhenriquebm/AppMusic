
import Foundation
import UIKit

protocol DetailViewControllerScreenDelegate: AnyObject {
func tappedClosedButton()
}

class DetailScreen: UIView {
    
    private weak var delegate: DetailViewControllerScreenDelegate?
    var cardModel: CardViewModel?
    var navBarTopAnchor: NSLayoutConstraint?
    
    lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView(frame: .zero)
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.showsVerticalScrollIndicator = false
        scrollView.showsHorizontalScrollIndicator = false
        scrollView.autoresizingMask = .flexibleHeight
        scrollView.bounces = false
        scrollView.clipsToBounds = true
        return scrollView
    }()
    
    lazy var cardView: CustomCardView = {
        
        let view = CustomCardView (mode: .full)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.cardContainerView.layer.cornerRadius = 0.0
        view.setupView(data: self.cardModel ?? CardViewModel())
        return view
    }()
    
    lazy var tableView: UITableView = {
        let table = UITableView()
        table.translatesAutoresizingMaskIntoConstraints = false
        table.tableFooterView = UIView()
        table.separatorStyle = .none
        table.showsVerticalScrollIndicator =  false
        table.isScrollEnabled = false
        table.contentInset = UIEdgeInsets(top: 10, left: 0, bottom: 20, right: 0)
        table.register(DetailTableViewCell.self, forCellReuseIdentifier: DetailTableViewCell.identifier)
        return table
    }()
    
    lazy var closeButton: UIButton = {
        
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.layer.cornerRadius = 15
        button.backgroundColor = .white.withAlphaComponent(0.3)
        button.setBackgroundImage(UIImage(named: "back")?.withRenderingMode(.alwaysTemplate), for: .normal)
        button.tintColor = .white
        button.addTarget(self, action: #selector(closePressed), for: .touchUpInside)
        return button
    }()
    
    @objc func closePressed () {
        
        self.delegate?.tappedClosedButton()
    }
    
    
   init(dataView: CardViewModel) {
        super.init(frame: CGRect())
       self.cardModel = dataView
       DispatchQueue.main.async {
           self.setupView()
           self.setupConstraints()
       }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    private func setupView () {
        self.addSubview(scrollView)
        self.scrollView.addSubview(cardView)
        self.scrollView.addSubview(tableView)
        self.addSubview(self.closeButton)
    }
    
    
    private func setupConstraints () {
        
        let window = UIApplication.shared.connectedScenes
            .filter({$0.activationState == .foregroundActive})
            .compactMap({$0 as? UIWindowScene})
            .first?.windows.filter({$0.isKeyWindow}).first
        
        let topPading = window?.safeAreaInsets.top
        
        self.scrollView.pin(to: self)
        
        
        NSLayoutConstraint.activate([
            
            cardView.topAnchor.constraint(equalTo: self.scrollView.topAnchor, constant: -(topPading ?? 0)),
            cardView.centerXAnchor.constraint(equalTo: self.scrollView.centerXAnchor),     cardView.heightAnchor.constraint(equalToConstant: 500),
            cardView.widthAnchor.constraint(equalToConstant: self.frame.size.width),
            
            tableView.topAnchor.constraint(equalTo: self.cardView.bottomAnchor),
            tableView.centerXAnchor.constraint(equalTo: self.scrollView.centerXAnchor),
            tableView.heightAnchor.constraint(equalToConstant: CGFloat(80 * (cardModel?.cardList?.count ?? 0) + 20)),
            tableView.widthAnchor.constraint(equalToConstant: self.frame.size.width),
            tableView.bottomAnchor.constraint(equalTo: self.scrollView.bottomAnchor),
            
            closeButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            closeButton.widthAnchor.constraint(equalToConstant: 30),
            closeButton.heightAnchor.constraint(equalToConstant: 30),
            closeButton.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 10)
        ])
    }
    
    func setupDelegates (delegate: UITableViewDelegate, dataSource: UITableViewDataSource, scrollViewDelegate: UIScrollViewDelegate, detailViewScreenDelegate: DetailViewControllerScreenDelegate) {
        tableView.delegate = delegate
        tableView.dataSource = dataSource
        scrollView.delegate =  scrollViewDelegate
        self.delegate = detailViewScreenDelegate
    }
    
}
