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
    
    let viewModel: HomeViewModel
    
    private let collectionView: UICollectionView = {
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: createLayout())
//        collectionView.translatesAutoresizingMaskIntoConstraints = false
        return collectionView
    }()
    
    init(viewModel: HomeViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        getPopularMovies()
        setupHomeView()
    }
    
    static func createLayout() -> UICollectionViewCompositionalLayout {
        // Item
        let item = NSCollectionLayoutItem(layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1)))
                                          
        // Group
        let group = NSCollectionLayoutGroup.horizontal(
            layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(2/5)),
            subitem: item, count: 2)
                                          
        // Section
        let section = NSCollectionLayoutSection(group: group)
        
        // Return
        return UICollectionViewCompositionalLayout(section: section)
    }
    
    func setupHomeView() {
        view.addSubview(collectionView)
        collectionView.register(MovieCollectionViewCell.self, forCellWithReuseIdentifier: MovieCollectionViewCell.reuseIdentifier)
        collectionView.frame = view.bounds
        collectionView.backgroundColor = .white
        collectionView.dataSource = self
        collectionView.delegate = self
    }
    
    func getPopularMovies() {
        viewModel.getPopularMovies(pageNumber: 1) { result in
            switch result {
            case .success(let moviesData):
                AppLogger.log(level: .verbose, args: moviesData)
                DispatchQueue.main.async {
                    self.collectionView.reloadData()
                }
            case .failure(let error):
                AppLogger.log(level: .error, args: "Encountered error ", error)
            }
        }
    }
}

extension HomeViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.moviesArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MovieCollectionViewCell.reuseIdentifier, for: indexPath) as! MovieCollectionViewCell
        let currentMovie = viewModel.moviesArray[indexPath.row]
        print("posterurl is ", currentMovie.posterUrl)
        cell.setCell(imageUrl: currentMovie.posterUrl)
        return cell
    }
}
