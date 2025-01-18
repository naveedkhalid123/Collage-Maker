//
//  TransitionCollectionViewCell.swift
//  Collage Maker
//
//  Created by Naveed Khalid on 17/01/2025.
//



import UIKit

class TransitionCollectionViewCell: UICollectionViewCell {
    

     let transitionsImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFill
         imageView.layer.cornerRadius = 10
        imageView.clipsToBounds = true
        return imageView
    }()
    

     let transitionsLbl: UILabel = {
        let designLabLbl = UILabel()
        designLabLbl.font = UIFont.systemFont(ofSize: 12,weight: .regular)
         designLabLbl.textColor = .white
        designLabLbl.translatesAutoresizingMaskIntoConstraints = false
        return designLabLbl
    }()

    
    // MARK: - Initializer
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
        setUpTransitionLbl()
        
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupViews()
        setUpTransitionLbl()
      

    }
    
    // MARK: - Setup Views
     func setupViews() {
        contentView.addSubview(transitionsImageView)
        NSLayoutConstraint.activate([
            transitionsImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 0),
            transitionsImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: 0),
            transitionsImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 0),
        ])
    }
    
    func setUpTransitionLbl() {
        contentView.addSubview(transitionsLbl)
        NSLayoutConstraint.activate([
            transitionsLbl.topAnchor.constraint(equalTo: transitionsImageView.bottomAnchor, constant: 8),
            transitionsLbl.centerXAnchor.constraint(equalTo: transitionsImageView.centerXAnchor)
        ])
    }
    
    
}
