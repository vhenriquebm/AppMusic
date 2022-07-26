
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
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        
        let window = UIApplication.shared.connectedScenes
            .filter({$0.activationState == .foregroundActive})
            .compactMap({$0 as? UIWindowScene})
            .first?.windows.filter({$0.isKeyWindow}).first
        
        let topPading = window?.safeAreaInsets.top
        print (scrollView.contentOffset.y)
        
        if scrollView.contentOffset.y >= 300 {
            self.screen?.navBarTopAnchor?.constant = 0
        } else {
            self.screen?.navBarTopAnchor?.constant = -((topPading ?? 0.0) + 80)
            
        }
        
        UIView.animate(withDuration: 0.3, delay: 0, options: .curveEaseInOut) {
            self.view.layoutIfNeeded()
        }
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
