//
//  PeoplePresenter.swift
//  MVPPeopleMoya
//
//  Created by Anan Sadiya on 11/11/2019.
//  Copyright © 2019 Anan Sadiya. All rights reserved.
//

import Foundation
import UIKit
import Moya

class PeoplePresenter {
    var view: PeopleViewController!
    let provider = MoyaProvider<Swapi>()
    
    func attachView(view: PeopleViewController) {
        self.view = view
    }
    
    func fetchData() {
        view.showLoading()
        provider.request(.getPeople) { [weak self] result in
            guard self != nil else { return }

            switch result {
            case .success(let response):
            do {
                _ = try response.filterSuccessfulStatusCodes()
                let decoder = JSONDecoder()
                let persons = try response.map([Person].self, atKeyPath: "results", using: decoder)
                self!.view.reloadList(data: persons)
            }
            catch {
                self!.view.showEmptyView()
            }
            case .failure:
                self!.view.showEmptyView()
            }
        }
    }
    
    func addTapped() {
        let alert = UIAlertController(title: "Aler title", message: "Alert message", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Exit", style: .default, handler: nil))
        self.view.present(alert, animated: true)
    }
}
