//
//  FavouritesViewController.swift
//  Movie4U
//
//  Created by Harish Anantharaman on 16/04/22.
//

import Foundation
import UIKit

protocol FavouritesViewControllerDelegate: AnyObject {
    
}

class FavouritesViewController: UIViewController {
    weak var parentingCoordinator: HomeViewControllerDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemPink
    }
}
