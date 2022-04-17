//
//  SettingsViewController.swift
//  Movie4U
//
//  Created by Harish Anantharaman on 16/04/22.
//

import Foundation
import UIKit

protocol SettingsViewControllerDelegate: AnyObject {
    
}

class SettingsViewController: UIViewController {
    weak var parentingCoordinator: SettingsViewControllerDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .yellow
    }
}
