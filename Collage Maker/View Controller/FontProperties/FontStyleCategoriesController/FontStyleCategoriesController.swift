//
//  ViewController.swift
//  Collage Maker
//
//  Created by Naveed Khalid on 20/01/2025.
//



import UIKit

class FontStyleCategoriesController: UIViewController {
    
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
        label.text = "Fonts"
        label.font = UIFont.systemFont(ofSize: 14, weight: .bold)
        label.textColor = UIColor(named: "white")
        return label
    }()
    
    private let doneBtn: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(named: "themeTick"), for: .normal)
        button.contentMode = .scaleAspectFill
        return button
    }()
    
    private let dismissBtn: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(named: "themeDismiss"), for: .normal)
        button.contentMode = .scaleAspectFill
        return button
    }()
    
    
    // MARK: Fonts Label Collection View
    private let fontsLblCollectionViw: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        
        layout.minimumLineSpacing = 6
        layout.minimumInteritemSpacing = 6

        let fontsLblCollectionViw = UICollectionView(frame: .zero, collectionViewLayout: layout)
        fontsLblCollectionViw.translatesAutoresizingMaskIntoConstraints = false
        fontsLblCollectionViw.backgroundColor = .red
        fontsLblCollectionViw.showsHorizontalScrollIndicator = false

        return fontsLblCollectionViw
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        setUp()
    }
    
  
    private func setUp() {
        setUpFormatView()
        setUpLineView()
        setUpDoneBtn()
        setUpDismissBtn()
        setUpTitleLbl()
        
        setUpFontsLblCollectionViw()
    }

    private func setUpFormatView() {
        view.addSubview(formatView)
        NSLayoutConstraint.activate([
            formatView.leadingAnchor.constraint(equalTo: view.leadingAnchor,constant: 0),
            formatView.trailingAnchor.constraint(equalTo: view.trailingAnchor,constant: 0),
            formatView.bottomAnchor.constraint(equalTo: view.bottomAnchor,constant: 0),
            formatView.heightAnchor.constraint(equalToConstant: 232)
        ])
    }
    
    private func setUpLineView() {
        formatView.addSubview(lineView)
        NSLayoutConstraint.activate([
            lineView.topAnchor.constraint(equalTo: formatView.topAnchor, constant: 11),
            lineView.centerXAnchor.constraint(equalTo: formatView.centerXAnchor),
            lineView.heightAnchor.constraint(equalToConstant: 5),
            lineView.widthAnchor.constraint(equalToConstant: 69)
        ])
    }
    
    private func setUpDoneBtn() {
        formatView.addSubview(doneBtn)
        NSLayoutConstraint.activate([
            doneBtn.leadingAnchor.constraint(equalTo: formatView.leadingAnchor, constant: 15),
            doneBtn.topAnchor.constraint(equalTo: formatView.topAnchor, constant: 11)
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
            titleLabel.topAnchor.constraint(equalTo: lineView.bottomAnchor, constant: 10),
            titleLabel.centerXAnchor.constraint(equalTo: formatView.centerXAnchor)
        ])
    }
    
   
    private func setUpFontsLblCollectionViw(){
        formatView.addSubview(fontsLblCollectionViw)
        NSLayoutConstraint.activate([
            fontsLblCollectionViw.topAnchor.constraint(equalTo: doneBtn.bottomAnchor, constant: 18),
            fontsLblCollectionViw.leadingAnchor.constraint(equalTo: formatView.leadingAnchor, constant: 20),
            fontsLblCollectionViw.trailingAnchor.constraint(equalTo: formatView.trailingAnchor, constant: -20),
            
            fontsLblCollectionViw.heightAnchor.constraint(equalToConstant: 20)
        ])
    }
}

