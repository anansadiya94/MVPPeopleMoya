//
//  ViewController.swift
//  MVPPeopleMoya
//
//  Created by Anan Sadiya on 11/11/2019.
//  Copyright © 2019 Anan Sadiya. All rights reserved.
//

import UIKit

protocol PeopleListInterface {
    func showLoading()
    func hideLoading()
    func showEmptyView()
    func reloadList(data: [Person])
}

class PeopleViewController: UIViewController {
    @IBOutlet weak var peopleTableView: UITableView!
    @IBOutlet weak var spinner: UIActivityIndicatorView!
    let peoplePresenter = PeoplePresenter()
    var people: [Person] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // bind this view(controller) with presenter
        peoplePresenter.attachView(view: self)
        self.title = "People List"
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Add", style: .plain, target: self, action: #selector(addTapped))
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        // fetch data
        peoplePresenter.fetchData()
    }
    
    @objc func addTapped() {
        peoplePresenter.addTapped()
    }
}

extension PeopleViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return people.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "personCell") as? PersonTableViewCell {
            cell.setUpCell(people[indexPath.row])
            return cell
        }
        return UITableViewCell()
    }
}

extension PeopleViewController: PeopleListInterface {
    func showLoading() {
        peopleTableView.isHidden = true
        spinner.startAnimating()
    }
    
    func hideLoading() {
        spinner.stopAnimating()
    }
    
    func showEmptyView() {
        peopleTableView.isHidden = false
    }
    
    func reloadList(data: [Person]) {
        peopleTableView.isHidden = false
        people = data
        peopleTableView.reloadData()
    }
}
