//
//  MovieCollectionViewCell.swift
//  Movie4U
//
//  Created by Harish Anantharaman on 19/04/22.
//

import Foundation
import UIKit

class MovieCollectionViewCell: UICollectionViewCell {
   static let reuseIdentifier = "movieCellReuseIdentifier"
    
    let movieImageView: UIImageView = {
       let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        setupCell()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupCell() {
        contentView.addSubview(movieImageView)
        NSLayoutConstraint.activate([
            movieImageView.topAnchor.constraint(equalTo: contentView.topAnchor),
            movieImageView.leftAnchor.constraint(equalTo: contentView.leftAnchor),
            movieImageView.rightAnchor.constraint(equalTo: contentView.rightAnchor),
            movieImageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
        ])
    }
    
    func setCell(imageUrl: String) {
        if let url = URL(string: imageUrl) {
            // Fetch the image data from url in background thread
            DispatchQueue.global().async {
                do {
                let data = try Data(contentsOf: url)
                    // Load the imageData in the image view in main thread
                    DispatchQueue.main.async {
                        self.movieImageView.image = UIImage(data: data)
                    }
                } catch {
                    AppLogger.log(level: .error, args: error)
                }
            }
        }
    }
}
