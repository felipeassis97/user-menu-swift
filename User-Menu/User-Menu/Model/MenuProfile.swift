//
//  MenuProfile.swift
//  User-Menu
//
//  Created by Felipe Assis on 11/12/23.
//

import Foundation

// MARK: - MenuProfileGroup
struct MenuProfileGroup: Codable {
    let group: [MenuProfile]
}

// MARK: - MenuProfile
struct MenuProfile: Codable {
    let title: String
    let child: [Item]
}

// MARK: - Item
struct Item: Codable {
    let title: String
}

