//
//  DealsViewController.swift
//  TheDeltaStudioDeals
//
//  Created by Admin on 23/05/21.
//

import UIKit

class DealsViewController: UIViewController , UITableViewDelegate , UITableViewDataSource , DealsPresenterDelegate {

    // MARK: - Outlets
    @IBOutlet weak var table:UITableView!
    
    // MARK: - Properties
    
    private var deals = [Deal]()
    private let presenter = userPresenter()
    

    // MARK: - View Lifecycle -
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Deals"
        table.delegate = self
        table.dataSource = self
        table.register(UINib(nibName: "DealTableViewCell", bundle: nil), forCellReuseIdentifier: "cell")
        //Presenter
        presenter.setViewDelegate(delegate: self)
        presenter.getDeals()
    }
    
    
    // MARK: - TABLEVIEW DELEGATES -

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return deals.count
    }
    
    // MARK: - TABLEVIEW DATASOURCE -
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! DealTableViewCell
        let content = deals[indexPath.row]
        cell.configure(deal:content)
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let infoViewController = self.storyboard?.instantiateViewController(withIdentifier: "Info") as! DealInfoViewController
        infoViewController.id = deals[indexPath.row].dealID

        self.navigationController?.pushViewController(infoViewController, animated: true)
        tableView.deselectRow(at: indexPath, animated: true)
    }

    // PRESENTER -> VIEW
    
    // presenter delegate
    
    func presentDeal(deals: [Deal]) {
        self.deals = deals
        // Updating UI on MAIN THREAD
        DispatchQueue.main.async {
            self.table.reloadData()
        }
    }
}
