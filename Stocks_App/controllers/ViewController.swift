//
//  ViewController.swift
//  Perich_PZ_tinkoff_laba
//
//  Created by Petar Perich on 30.01.2021.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    var myStocks = [Stocks]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureTableView()
        loadData()
    }
    
    func configureTableView(){
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
    }
    
    private func loadData () {
        NetworkService.loadStocks{ (serverResults, error) in
            if let error = error {
                self.showAlert(title: error.localizedDescription)
            }
            self.myStocks = serverResults
            self.tableView.reloadData()
        }
    }
    private func showAlert(title: String) {
        let alert = UIAlertController(title: title, message: nil, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default))
        present(alert, animated: true, completion: nil)
    }
}

// MARK: - Table view data source
extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return myStocks.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: StocksCell.identifier , for: indexPath) as! StocksCell
        
        let stocksInfo = myStocks [indexPath.row]
        
        cell.tickerLabel.text = stocksInfo.symbol
        cell.fullNameLabel.text = stocksInfo.fullName
        cell.priceLabel.text = stocksInfo.price
        cell.changeLabel.text = stocksInfo.change
        
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        let stocksItem = myStocks[indexPath.row]
        
        performSegue(withIdentifier: "ShowDetail", sender: stocksItem)
        
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ShowDetail" {
            guard let secondVC = segue.destination as? DetailViewController,
                  let ourStocks = sender as? Stocks
            else {
                fatalError("wrong")
            }
            
            secondVC.stocksItem = ourStocks
            
        }
        
    }
}
