//
//  HomeControllerViewController.swift
//  Collage Maker
//
//  Created by Naveed Khalid on 10/01/2025.
//
//

import UIKit
import SnapKit

class HomeController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
   
    
    // MARK: - UI Components
    
    private let scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.automaticallyAdjustsScrollIndicatorInsets = false
        return scrollView
    }()
    
    private let contentView: UIView = {
        let view = UIView()
        return view
    }()
    
    private let topView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(named: "viewColor")
        return view
    }()
    
    private let topHeadLbl: UILabel = {
        let topHeadLbl = UILabel()
        topHeadLbl.text = "Collage Maker"
        topHeadLbl.font = UIFont.systemFont(ofSize: 22,weight: .heavy)
        topHeadLbl.textColor = UIColor(named: "black")
        topHeadLbl.translatesAutoresizingMaskIntoConstraints = false
        return topHeadLbl
        
    }()
    
    
    private let proBtn: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "proIcon"), for: .normal)
        button.contentMode = .scaleAspectFill
        return button
    }()

    
    private let menuBtn: UIButton = {
        let menuBtn = UIButton()
        menuBtn.setImage(UIImage(named: "menuIcon"), for: .normal)
        menuBtn.contentMode = .scaleAspectFill
        return menuBtn
    }()

    
    // MARK: - Featured Collage View
    
    private let featuredView: UIView = {
        let featuredView = UIView()
        featuredView.translatesAutoresizingMaskIntoConstraints = false
        featuredView.backgroundColor = .yellow
        return featuredView
        
    }()
    
    
    private let featuredLbl: UILabel = {
        let featuredLbl = UILabel()
        featuredLbl.text = "Featured Collage"
        featuredLbl.font = UIFont.systemFont(ofSize: 14,weight: .bold)
        featuredLbl.textColor = UIColor(named: "black")
        featuredLbl.translatesAutoresizingMaskIntoConstraints = false
        return featuredLbl
    }()
    
    private let featuredCollageCollectionViw: UICollectionView = {
        let featuredCollageCollectionViw = UICollectionView()
        featuredCollageCollectionViw.translatesAutoresizingMaskIntoConstraints = false
        featuredCollageCollectionViw.backgroundColor  = .black
        return featuredCollageCollectionViw
    }()

    // MARK: - Lifecycle Methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // MARK: - Featured Collage Collection View
        featuredCollageCollectionViw.delegate = self
        featuredCollageCollectionViw.dataSource = self
        
        
        
    
        setupUI()
    }
    
    // MARK: - Setup Methods
    
    private func setupUI() {
        view.backgroundColor = UIColor(named: "theme")
        setupTopView()
        setupScrollView()
        setupContentView()
        setUpTopHeadLbl()
        setUpProBtn()
        setUpMenuBtn()
        setUpFeaturedView()
        setUpFeaturedLbl()
        setUpFeaturedCollageCollectionViw()
        
    }
    
    private func setupTopView() {
        view.addSubview(topView)
        topView.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top)
            make.leading.trailing.equalToSuperview()
            make.height.equalTo(50)
        }
    }
    
    private func setupScrollView() {
        view.addSubview(scrollView)
        scrollView.snp.makeConstraints { make in
            make.top.equalTo(topView.snp.bottom)
            make.leading.trailing.bottom.equalToSuperview()
        }
    }
    
    private func setupContentView() {
        scrollView.addSubview(contentView)
        contentView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
            make.width.equalTo(scrollView)
            make.height.greaterThanOrEqualTo(scrollView.snp.height)
        }
    }
    
    
    private func setUpTopHeadLbl() {
        topView.addSubview(topHeadLbl)
        topHeadLbl.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(15)
            make.centerY.equalToSuperview()
        }
    }
    
    private func setUpProBtn() {
        topView.addSubview(proBtn)
        proBtn.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            proBtn.centerYAnchor.constraint(equalTo: topView.centerYAnchor),
            proBtn.heightAnchor.constraint(equalToConstant: 22),
            proBtn.widthAnchor.constraint(equalToConstant: 50)
        ])
    }

    private func setUpMenuBtn() {
        topView.addSubview(menuBtn)
        menuBtn.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            menuBtn.leadingAnchor.constraint(equalTo: proBtn.trailingAnchor, constant: 13),
            menuBtn.trailingAnchor.constraint(equalTo: topView.trailingAnchor, constant: -15),
            menuBtn.centerYAnchor.constraint(equalTo: topView.centerYAnchor),
            menuBtn.heightAnchor.constraint(equalToConstant: 22),
            menuBtn.widthAnchor.constraint(equalToConstant: 22)
        ])
    }


    private func setUpFeaturedView(){
        contentView.addSubview(featuredView)
        NSLayoutConstraint.activate([
            featuredView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            featuredView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 15),
            featuredView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -15),
            featuredView.widthAnchor.constraint(equalToConstant: 346),
            featuredView.heightAnchor.constraint(equalToConstant: 220)
        ])
    }

    private func setUpFeaturedLbl(){
        featuredView.addSubview(featuredLbl)
        NSLayoutConstraint.activate([
            featuredLbl.leadingAnchor.constraint(equalTo: featuredView.leadingAnchor, constant: 0),
            featuredLbl.topAnchor.constraint(equalTo: featuredView.topAnchor, constant: 0)
        ])
    }
    
    
    private func setUpFeaturedCollageCollectionViw(){
        featuredView.addSubview(featuredCollageCollectionViw)
        NSLayoutConstraint.activate([
            featuredCollageCollectionViw.topAnchor.constraint(equalTo: featuredLbl.bottomAnchor, constant: 10),
            featuredCollageCollectionViw.leadingAnchor.constraint(equalTo: featuredView.leadingAnchor, constant: 0),
            featuredCollageCollectionViw.trailingAnchor.constraint(equalTo: featuredView.trailingAnchor, constant: 0),
            featuredCollageCollectionViw.bottomAnchor.constraint(equalTo: featuredView.bottomAnchor, constant: 0)
            featuredCollageCollectionViw.heightAnchor.constraint(equalToConstant: )
        
        ])
        
        
        
    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "hshhs", for: indexPath) as! hshhs
    }
    
}
