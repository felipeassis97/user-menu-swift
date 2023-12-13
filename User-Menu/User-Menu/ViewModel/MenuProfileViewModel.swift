//
//  MenuProfileViewModel.swift
//  User-Menu
//
//  Created by Felipe Assis on 11/12/23.
//

import Foundation

enum TypeFetch {
    case mock
    case request
}

protocol MenuProfileViewModelDelegate: AnyObject {
    func success()
    func error(_ message: String)
}

enum StatusHiddenSection {
    case collapsed
    case expanded
}

class MenuProfileViewModel {
    private let service: MenuProfileService = MenuProfileService()
    private weak var delegate: MenuProfileViewModelDelegate?
    private var data: [MenuProfile] = []
    private var hiddenSection = Set<Int>()
    
    public func setDelegate(delegate: MenuProfileViewModelDelegate?) {
        self.delegate = delegate
    }
    
    public func fetch(_ typeFetch: TypeFetch) {
        switch typeFetch {
        case .mock:
            self.service.getMenuFromJson { success, error in
                if let success = success {
                    self.data = success.group
                    self.hiddenAllSection()
                    self.delegate?.success()
                } else {
                    self.delegate?.error(error?.localizedDescription ?? "")
                }
            }
        case .request:
            self.service.getMenu {
                success, error in
                if let success = success {
                    self.data = success.group
                    self.hiddenAllSection()
                    self.delegate?.success()
                } else {
                    self.delegate?.error(error?.localizedDescription ?? "")
                }
            }
        }
    }
    
    public var numberOfSections: Int {
        return data.count
    }
    
    private func numberOfChild(section: Int) -> Int {
        return data[section].child.count
    }
    
    
    public func titleForSection(_ section: Int) -> String {
        return data[section].title
    }
    
    public func isSectionExpanded(_ section: Int) -> Bool {
        return hiddenSection.contains(section)
    }
    
    public func tappedSection(type: StatusHiddenSection, section: Int) {
        if type == .collapsed {
            hiddenSection.insert(section)
        } else {
            hiddenSection.remove(section)
        }
    }
    
    public func indexPathForSection(_ section: Int) -> [IndexPath] {
        var indexPath = [IndexPath]()
        let size = numberOfChild(section: section)
        for row in 0..<size {
            indexPath.append(IndexPath(row: row, section: section))
        }
        return indexPath
    }
    
    public func numberOfRowsInSection(section: Int) -> Int {
        if isSectionExpanded(section) {
            return 0
        } else {
            return numberOfChild(section: section)
        }
    }
    
    private func hiddenAllSection() {
        let size = numberOfSections
        for index in 0..<size {
            hiddenSection.insert(index)
        }
    }
}
