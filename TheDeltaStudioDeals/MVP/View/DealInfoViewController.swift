//
//  DealInfoViewController.swift
//  TheDeltaStudioDeals
//
//  Created by Admin on 23/05/21.
//

import UIKit

class DealInfoViewController: UIViewController , InfoPresenterDelegate {
    
    // MARK: - Properties
    
    var id : String!
    private var infos :DealInfo!
    private let presenter = infoPresenter()
    
    // MARK: - Outlets
    
    @IBOutlet weak var titleLable : UILabel!
    @IBOutlet weak var normalPriceLabel : UILabel!
    @IBOutlet weak var salePriceLabel :UILabel!
    @IBOutlet weak var thumbImage :UIImageView!
    
    // MARK: - View Lifecycle -
    override func viewDidLoad() {
        super.viewDidLoad()
        //Presenter
        presenter.setViewDelegate(delegate: self)
        presenter.getDealInfo(id:self.id)
    }
    // PRESENTER -> VIEW
    
    func presentInfo(info: DealInfo) {
        self.infos = info
        
        // Updating UI on MAIN THREAD
       
        DispatchQueue.main.async {
        self.titleLable.text = self.infos.gameInfo.name
        self.normalPriceLabel.attributedText = self.infos.gameInfo.retailPrice.strikeThrough()
        self.salePriceLabel.text = "$"+self.infos.gameInfo.salePrice
        guard let url = URL(string:info.gameInfo.thumb) else { return  }
        let data = try? Data(contentsOf: url)
        if let imageData = data {
            let image = UIImage(data: imageData)
            self.thumbImage.image = image
        }
        }
        
    }

}
