//
//  DetailViewController.swift
//  Perich_PZ_tinkoff_laba
//
//  Created by Petar Perich on 31.01.2021.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var tickerDetailLabel: UILabel!
    @IBOutlet weak var nameDetailLabel: UILabel!
    @IBOutlet weak var changeDetailLabel: UILabel!
    @IBOutlet weak var priceDetailLabel: UILabel!
    @IBOutlet weak var sixMPriceDetail: UILabel!
    @IBOutlet weak var oneYPriceDetail: UILabel!
   
    var stocksItem: Stocks!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()

        // Do any additional setup after loading the view.
    }
    
   private func configure() {
        tickerDetailLabel.text = stocksItem.symbol
        nameDetailLabel.text = stocksItem.fullName
        priceDetailLabel.text = stocksItem.price
        changeDetailLabel.text = stocksItem.change
        sixMPriceDetail.text = stocksItem.sixMPrice
        oneYPriceDetail.text = stocksItem.oneYPrice
    }
}
