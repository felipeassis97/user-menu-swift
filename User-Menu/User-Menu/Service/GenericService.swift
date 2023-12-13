//
//  GenericService.swift
//  User-Menu
//
//  Created by Felipe Assis on 11/12/23.
//

import Foundation
import Alamofire

protocol GenericService: AnyObject {
    typealias completion <T> = (_ result: T, _ failure: Error?) -> Void
}

enum Error: Swift.Error {
    case fileNotFound(name: String)
    case fileDecodeFail(name: String, Swift.Error)
    case requestError(AFError)
}
