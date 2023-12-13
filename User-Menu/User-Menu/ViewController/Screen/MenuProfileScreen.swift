//
//  MenuProfileScreen.swift
//  User-Menu
//
//  Created by Felipe Assis on 11/12/23.
//

import UIKit

class MenuProfileScreen: UIView {
    
    //MARK: Components
    private lazy var upArrowButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(systemName: "chevron.up"), for: .normal)
        button.tintColor = .white
        button.addTarget(self, action: #selector(tappedArrowButton), for: .touchUpInside)
        return button
    }()
    
    private lazy var headerView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .purple
        return view
    }()
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .white
        label.font = UIFont.boldSystemFont(ofSize: 16)
        label.text = "Menu"
        return label
    }()
    
    lazy var tableView: UITableView = {
        let table = UITableView(frame: CGRect(), style: .grouped)
        table.translatesAutoresizingMaskIntoConstraints = false
        table.backgroundColor = .white
        table.separatorStyle = .none
        
        return table
    }()
    
    //MARK: Button actions
    @objc func tappedArrowButton() {}

    //MARK: Setup view
    private func setupView() {
        backgroundColor = .purple
        addSubview(headerView)
        headerView.addSubview(upArrowButton)
        headerView.addSubview(titleLabel)
        addSubview(tableView)
        setupConstraints()
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            headerView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            headerView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor),
            headerView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor),
            headerView.heightAnchor.constraint(equalToConstant: 40),
            
            upArrowButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 25),
            upArrowButton.centerYAnchor.constraint(equalTo: headerView.centerYAnchor),
            
            titleLabel.leadingAnchor.constraint(equalTo: upArrowButton.trailingAnchor, constant: 20),
            titleLabel.centerYAnchor.constraint(equalTo: headerView.centerYAnchor),
            
            tableView.topAnchor.constraint(equalTo: headerView.bottomAnchor),
            tableView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: bottomAnchor)
  
        ])
    }
    
    public func setupTableView(delegate: UITableViewDelegate, dataSource: UITableViewDataSource) {
        tableView.delegate = delegate
        tableView.dataSource = dataSource
    }
    
    public func insertRowsTableView(indexPath: [IndexPath], section: Int) {
        tableView.beginUpdates()
        tableView.insertRows(at: indexPath, with: .fade)
        tableView.reloadSections(IndexSet(integer: section), with: .none)
        tableView.endUpdates()
    }
    
    public func deleteRowsTableView(indexPath: [IndexPath], section: Int) {
        tableView.beginUpdates()
        tableView.deleteRows(at: indexPath, with: .fade)
        tableView.reloadSections(IndexSet(integer: section), with: .none)
        tableView.endUpdates()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
