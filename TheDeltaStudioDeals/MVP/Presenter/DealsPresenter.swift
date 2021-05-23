//
//  DealsPresenter.swift
//  TheDeltaStudioDeals
//
//  Created by Admin on 23/05/21.
//

import Foundation
import UIKit

protocol DealsPresenterDelegate: AnyObject {
    func presentDeal(deals:[Deal])
  
}
typealias PresenterDelegate = DealsPresenterDelegate & UIViewController

class userPresenter{
    
    weak var delegate : PresenterDelegate!
    
    
    // MARK: - Deal Events -
    
    // View input will be handled below.
    
    public func getDeals(){
        guard let url = URL(string: "https://www.cheapshark.com/api/1.0/deals") else {return}
        let task = URLSession.shared.dataTask(with: url){ data,_,error in
            guard let data = data , error == nil else{
                return
            }
            do {
                let deals = try JSONDecoder().decode([Deal].self , from:data)
                self.delegate?.presentDeal(deals: deals)
            }catch{
                print(error)
            }
        }
        task.resume()
    }
    
    // MARK: - Presentation Logic -
    // Interactor output implementation will go below.
    public func setViewDelegate(delegate : PresenterDelegate){
        self.delegate = delegate
    }
}

