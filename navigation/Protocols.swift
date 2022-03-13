//
//  Protocols.swift
//  navigation
//
//  Created by Admin on 13.03.2022.
//

import Foundation

protocol ViewModelProtocol {}

protocol Setupable {
    func setup(with viewModel: ViewModelProtocol)
}
