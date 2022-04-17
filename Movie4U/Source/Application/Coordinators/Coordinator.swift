//
//  Coordinator.swift
//  Movie4U
//
//  Created by Harish Anantharaman on 13/03/22.
//

import UIKit

protocol Coordinator {
    func start()
}

protocol NavigationCoordinator: Coordinator {
    var navigationController: UINavigationController! { get }
}
