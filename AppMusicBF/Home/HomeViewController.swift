
import UIKit

class HomeViewController: UIViewController {
    
    var tableViewScreen: HomeViewControllerScreen?
    
    override func loadView() {
        tableViewScreen = HomeViewControllerScreen()
        tableViewScreen?.configureTableView(delegate: self, dataSource: self)
        view = tableViewScreen
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .red
    }
}

extension HomeViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let detail = DetailViewController()
        detail.cardModel = CardData[indexPath.row]
        detail.modalPresentationStyle = .fullScreen
        present(detail, animated: true)
    }
}


extension HomeViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return CardData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: CardViewTableViewCell.identifier, for: indexPath) as? CardViewTableViewCell
        
        cell?.setupCell(data: CardData[indexPath.row])
        
        return cell ?? UITableViewCell ()
        
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 500
    }
    
    
    
}


