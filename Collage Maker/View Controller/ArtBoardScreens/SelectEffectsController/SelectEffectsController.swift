//
//  SelectEffectsController.swift
//  Collage Maker
//
//  Created by Naveed Khalid on 17/01/2025.
//

import UIKit

class SelectEffectsController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
   
    
    // MARK: - UI Components
    private let formatView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor(named: "main")
        view.layer.cornerRadius = 16
        return view
    }()
    
    private let lineView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor(named: "theme")
        view.layer.cornerRadius = 3
        return view
    }()
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Effects"
        label.font = UIFont.systemFont(ofSize: 14, weight: .medium)
        label.textColor = UIColor(named: "white")
        return label
    }()
    
    private let dismissBtn: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(named: "themeDismiss"), for: .normal)
        button.contentMode = .scaleAspectFill
        return button
    }()
    
  // MARK: Transition Collection View
    
    var transitionsArr = [["img":"doneTransition1", "lbl":"None"],["img":"dissolve", "lbl":"Dissolve"],["img":"dissolve", "lbl":"Slide"],["img":"dissolve", "lbl":"Circle"],]
    
    private let transitionsCollectionViw: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        
        layout.minimumLineSpacing = 6
        layout.minimumInteritemSpacing = 6

        let transitionsCollectionViw = UICollectionView(frame: .zero, collectionViewLayout: layout)
        transitionsCollectionViw.translatesAutoresizingMaskIntoConstraints = false
        transitionsCollectionViw.backgroundColor = .clear
        transitionsCollectionViw.showsHorizontalScrollIndicator = false

        return transitionsCollectionViw
    }()
    
    
    private let toggleButton: UIButton = {
           let button = UIButton()
           button.translatesAutoresizingMaskIntoConstraints = false
           button.setImage(UIImage(named: "applyEmpty"), for: .normal)
           button.setImage(UIImage(named: "applyFill"), for: .selected)
           return button
       }()
    

    private let applyTransitionsLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Apply between all pages"
        label.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        label.textColor = UIColor(named: "white")
        return label
    }()
    
    
    
    // MARK: - View Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        transitionsCollectionViw.delegate = self
        transitionsCollectionViw.dataSource = self
        transitionsCollectionViw.register(TransitionCollectionViewCell.self, forCellWithReuseIdentifier: "TransitionCollectionViewCell")
        
        
        setUp()
    }
    
    private func setUp() {
        setUpFormatView()
        setUpLineView()
        setUpDismissBtn()
        setUpTitleLbl()
        setUpTransitionsCollectionViw()
        setUpToggleButton()
        setUpApplyTransitionsLabel()
    }
    
    private func setUpFormatView() {
        view.addSubview(formatView)
        NSLayoutConstraint.activate([
            formatView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
            formatView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0),
            formatView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0),
        ])
    }
    
    private func setUpLineView() {
        formatView.addSubview(lineView)
        NSLayoutConstraint.activate([
            lineView.topAnchor.constraint(equalTo: formatView.topAnchor, constant: 11),
            lineView.centerXAnchor.constraint(equalTo: formatView.centerXAnchor),
            lineView.heightAnchor.constraint(equalToConstant: 5),
            lineView.widthAnchor.constraint(equalToConstant: 62)
        ])
    }
    
    private func setUpDismissBtn() {
        formatView.addSubview(dismissBtn)
        NSLayoutConstraint.activate([
            dismissBtn.trailingAnchor.constraint(equalTo: formatView.trailingAnchor, constant: -15),
            dismissBtn.topAnchor.constraint(equalTo: formatView.topAnchor, constant: 11)
        ])
    }
    
    private func setUpTitleLbl() {
        formatView.addSubview(titleLabel)
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: lineView.bottomAnchor, constant: 3),
            titleLabel.centerXAnchor.constraint(equalTo: formatView.centerXAnchor)
        ])
    }

    
    
    private func setUpTransitionsCollectionViw(){
        formatView.addSubview(transitionsCollectionViw)
        NSLayoutConstraint.activate([
            transitionsCollectionViw.leadingAnchor.constraint(equalTo: formatView.leadingAnchor, constant: 20),
            transitionsCollectionViw.trailingAnchor.constraint(equalTo: formatView.trailingAnchor, constant: 0),
            transitionsCollectionViw.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 12),
            transitionsCollectionViw.heightAnchor.constraint(equalToConstant: 120)
        ])
    }

    
    
    // MARK: Transition Collection View Set UP
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return transitionsArr.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "TransitionCollectionViewCell", for: indexPath) as! TransitionCollectionViewCell
        cell.transitionsImageView.image  = UIImage(named: transitionsArr[indexPath.row]["img"] ?? "")
        cell.transitionsLbl.text = transitionsArr[indexPath.row]["lbl"]
        return cell
    }
    

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let screenWidth = UIScreen.main.bounds.width
        let numberOfCells = 3.5
        let totalSpacing = CGFloat(numberOfCells - 1) * 10
        let itemWidth = (screenWidth - totalSpacing - 30) / CGFloat(numberOfCells)
        let cell = CGSize(width: itemWidth, height: 120)
        return cell
    }
        
    
    private func setUpToggleButton() {
        
        formatView.addSubview(toggleButton)
        NSLayoutConstraint.activate([
            toggleButton.leadingAnchor.constraint(equalTo: formatView.leadingAnchor, constant: 20),
            toggleButton.topAnchor.constraint(equalTo: transitionsCollectionViw.bottomAnchor, constant: 10),
            toggleButton.bottomAnchor.constraint(equalTo: formatView.bottomAnchor, constant: -24),
            toggleButton.widthAnchor.constraint(equalToConstant: 18),
            toggleButton.heightAnchor.constraint(equalToConstant: 18)
        ])
           
           toggleButton.addTarget(self, action: #selector(toggleButtonTapped), for: .touchUpInside)
       }
    
    
    
    private func setUpApplyTransitionsLabel(){
        formatView.addSubview(applyTransitionsLabel)
        NSLayoutConstraint.activate([
            applyTransitionsLabel.leadingAnchor.constraint(equalTo: toggleButton.trailingAnchor, constant: 12),
            applyTransitionsLabel.centerYAnchor.constraint(equalTo: toggleButton.centerYAnchor)
        ])
    }
    
    
    // MARK: - Actions
    @objc private func toggleButtonTapped(_ sender: UIButton) {
        sender.isSelected.toggle()
    }
}
