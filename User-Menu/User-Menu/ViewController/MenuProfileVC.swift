//
//  ViewController.swift
//  User-Menu
//
//  Created by Felipe Assis on 11/12/23.
//

import UIKit

class MenuProfileVC: UIViewController {
    
    let viewModel: MenuProfileViewModel = MenuProfileViewModel()
    var screen: MenuProfileScreen?
    
    override func loadView() {
        screen = MenuProfileScreen()
        view = screen
        
    }
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.isNavigationBarHidden = true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.setDelegate(delegate: self)
        viewModel.fetch(.request)
    }
}

extension MenuProfileVC: MenuProfileViewModelDelegate {
    func success() {
        screen?.setupTableView(delegate: self, dataSource: self)
        screen?.tableView.reloadData()
    }
    
    func error(_ message: String) {
        print("Erro: \(message)")
    }
}

extension MenuProfileVC: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return viewModel.numberOfSections
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfRowsInSection(section: section)
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let view = SectionView()
        view.referenceButton.addTarget(self, action: #selector(tappedSection), for: .touchUpInside)
        view.referenceButton.tag = section
        view.setupSection(description: viewModel.titleForSection(section))
        view.expandButton(value: viewModel.isSectionExpanded(section))
        return view
    }
    
    @objc func tappedSection(_ sender: UIButton) {
        let section = sender.tag
        if viewModel.isSectionExpanded(section) {
            viewModel.tappedSection(type: .collapsed, section: section)
            screen?.insertRowsTableView(indexPath: viewModel.indexPathForSection(section), section: section)
        } else {
            viewModel.tappedSection(type: .expanded, section: section)
            screen?.deleteRowsTableView(indexPath: viewModel.indexPathForSection(section), section: section)

        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 60
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return .leastNormalMagnitude
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        return nil
    }
}

