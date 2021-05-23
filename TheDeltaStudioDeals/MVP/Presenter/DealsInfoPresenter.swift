//
//  DealsInfoPresenter.swift
//  TheDeltaStudioDeals
//
//  Created by Admin on 23/05/21.
//

import Foundation
import UIKit

protocol InfoPresenterDelegate: AnyObject {
    func presentInfo(info:DealInfo)
}
typealias PresenterInfoDelegate = InfoPresenterDelegate & UIViewController

class infoPresenter {
    weak var delegate : PresenterInfoDelegate!

    // MARK: - DealInfo Events -
    
    // View input will be handled below.
    
    func getDealInfo(id:String)  {
        guard let url = URL(string: "https://www.cheapshark.com/api/1.0/deals?id="+id) else {return}
        let task = URLSession.shared.dataTask(with: url){ data,response,error in
            
            guard let data = data , error == nil else{
                return
            }
            do {
                let usersInfo = try JSONDecoder().decode(DealInfo.self , from:data)
                self.delegate?.presentInfo(info:usersInfo)
            }catch{
                print(error)
            }
        }
        task.resume()
    }
    
    // MARK: - Presentation Logic -
    // Interactor output implementation will go below.
    
    public func setViewDelegate(delegate : PresenterInfoDelegate){
        self.delegate = delegate
        
    }
}

