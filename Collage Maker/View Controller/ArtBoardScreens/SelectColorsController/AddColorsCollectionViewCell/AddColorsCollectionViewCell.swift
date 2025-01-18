////
////  ColorsCollectionViewCell.swift
////  Collage Maker
////
////  Created by Naveed Khalid on 17/01/2025.
////
//
//
//
//import UIKit
//
//class AddColorsCollectionViewCell: UICollectionViewCell {
//    
//    
//    let colorsView: UIImageView = {
//        let imageView = UIImageView()
//        imageView.translatesAutoresizingMaskIntoConstraints = false
//        imageView.contentMode = .scaleAspectFill
//        imageView.layer.cornerRadius = 6
//        imageView.clipsToBounds = true
//        return imageView
//    }()
//    
//
//    
//    // MARK: - Initializer
//    override init(frame: CGRect) {
//        super.init(frame: frame)
//        setupViews()
//    }
//    
//    required init?(coder: NSCoder) {
//        super.init(coder: coder)
//        setupViews()
//
//    }
//    
//    // MARK: - Setup Views
//     func setupViews() {
//        contentView.addSubview(colorsView)
//        NSLayoutConstraint.activate([
//            colorsView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 0),
//            colorsView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: 0),
//            colorsView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 0),
//            colorsView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: 0),
//            colorsView.widthAnchor.constraint(equalToConstant: 40),
//            colorsView.heightAnchor.constraint(equalToConstant: 40),
//        ])
//    }
//
//}
//
//
//
//



import UIKit

class AddColorsCollectionViewCell: UICollectionViewCell {
    
    // MARK: - Properties
    let colorsView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFill
        imageView.layer.cornerRadius = 6
        imageView.clipsToBounds = true
        return imageView
    }()
    
    // MARK: - Initializer
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupViews()
    }
    
    // MARK: - Setup Views
    private func setupViews() {
        contentView.addSubview(colorsView)
        NSLayoutConstraint.activate([
            colorsView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            colorsView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            colorsView.topAnchor.constraint(equalTo: contentView.topAnchor),
            colorsView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ])
    }
    
    // MARK: - Configure Cell
    func configureCell(image: UIImage?, backgroundColor: UIColor?) {
        if let image = image {
            colorsView.image = image
            colorsView.backgroundColor = nil
        } else if let backgroundColor = backgroundColor {
            colorsView.image = nil
            colorsView.backgroundColor = backgroundColor
        }
    }
}
