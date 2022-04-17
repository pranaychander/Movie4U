//
//  HomeViewController.swift
//  Movie4U
//
//  Created by Harish Anantharaman on 16/04/22.
//

import Foundation
import UIKit

protocol HomeViewControllerDelegate: AnyObject {
    
}

class HomeViewController: UIViewController {
    weak var parentingCoordinator: HomeViewControllerDelegate?
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
    }
}

