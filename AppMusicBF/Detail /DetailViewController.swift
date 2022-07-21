
import Foundation
import UIKit


class DetailViewController: UIViewController {
   
    var screen:DetailScreen?
    var cardModel: CardViewModel?
    
    override var prefersStatusBarHidden: Bool {
        return true
    }
    
    override func loadView() {
        self.screen = DetailScreen(dataView: self.cardModel!)
        screen?.setupDelegates(delegate: self, dataSource: self, scrollViewDelegate: self, detailViewScreenDelegate: self)
        self.view = self.screen
    }
    
    
    private func setupView() {
        
     
        
    }
    
}

extension DetailViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cardModel?.cardList?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: DetailTableViewCell.identifier, for: indexPath) as? DetailTableViewCell
        
        cell?.setupCell(data: self.cardModel?.cardList?[indexPath.row] ?? CardListModel())
        
        return cell ?? UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
    
    
    
}


extension DetailViewController: DetailViewControllerScreenDelegate {
    
    func tappedClosedButton() {
        
dismiss(animated: true)
    }
    
}
