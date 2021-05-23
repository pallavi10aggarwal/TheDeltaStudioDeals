//
//  DealTableViewCell.swift
//  TheDeltaStudioDeals
//
//  Created by Admin on 23/05/21.
//

import UIKit

class DealTableViewCell: UITableViewCell {
    // MARK: - Outlets

    @IBOutlet weak var titleLable : UILabel!
    @IBOutlet weak var normalPriceLabel : UILabel!
    @IBOutlet weak var salePriceLabel :UILabel!
    
    // MARK: - Init
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func configure(deal:Deal)  {
        self.titleLable?.text = deal.title
        self.normalPriceLabel?.attributedText = deal.normalPrice.strikeThrough()
        self.salePriceLabel?.text = "$" + deal.salePrice
        
    }
    
}
