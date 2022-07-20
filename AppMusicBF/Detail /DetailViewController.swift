
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
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 500
    }
    
}


extension DetailViewController: DetailViewControllerScreenDelegate {
    
    func tappedClosedButton() {
        
dismiss(animated: true)
    }
    
}
