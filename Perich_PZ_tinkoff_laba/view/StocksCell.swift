//
//  StocksCell.swift
//  Perich_PZ_tinkoff_laba
//
//  Created by Petar Perich on 30.01.2021.
//

import UIKit

class StocksCell: UITableViewCell {
    
    static let identifier = "StocksCell"
    @IBOutlet weak var tickerLabel: UILabel!
    @IBOutlet weak var fullNameLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var changeLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
}
