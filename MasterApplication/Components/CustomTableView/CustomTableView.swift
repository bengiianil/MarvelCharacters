//
//  CustomTableView.swift
//  GameOfThronesCharacters
//
//  Created by Bengi on 14.10.2021.
//

import Foundation
import UIKit

class CustomTableView: BaseView {
    
    deinit {
        print("DEINIT: CustomTableView")
    }
    
    weak var delegate: CustomTableViewProtocol?
    private var headerView: HeaderView!

    private lazy var tableView: UITableView = {
        let view = UITableView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.dataSource = self
        view.delegate = self
        view.estimatedRowHeight = UITableView.automaticDimension
        view.separatorStyle = .none
        view.contentInsetAdjustmentBehavior = .never
        view.register(CustomTableViewCell.self, forCellReuseIdentifier: CustomTableViewCell.identifier)
        return view
    }()
    
    override func addMajorViewComponents() {
        super.addMajorViewComponents()
        addTableView()
        addHeaderView()
    }
    
    private func addTableView() {
        addSubview(tableView)
        
        NSLayoutConstraint.activate([
            tableView.leadingAnchor.constraint(equalTo: leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: trailingAnchor),
            tableView.topAnchor.constraint(equalTo: topAnchor),
            tableView.bottomAnchor.constraint(equalTo: bottomAnchor),
        ])
    }
    
    private func addHeaderView() {
        headerView = HeaderView(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 250)) // giving as input
        tableView.tableHeaderView = headerView // according to instead of headerView.translatesAutoresizingMaskIntoConstraints = false
    }
    
    func reloadTableView() {
        DispatchQueue.main.async {
            self.tableView.reloadData()
            print("ReloadData is done.")
        }
    }
}

extension CustomTableView: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return delegate?.getNumberOfSection() ?? 0
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return delegate?.getNumberOfItem(in: section) ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let data = delegate?.getData(at: indexPath.row) else { fatalError("Please provide data.") }
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: CustomTableViewCell.identifier, for: indexPath) as? CustomTableViewCell else { return UITableViewCell() }
        
        cell.setData(by: data)
        return cell
    }
}
