//
//  CreateFormatsControllerViewController.swift
//  Collage Maker
//
//  Created by Naveed Khalid on 15/01/2025.
//



import UIKit

class CreateFormatsController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource , UICollectionViewDelegateFlowLayout{
  
    
    // MARK: - UI Components
    private let formatView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor(named: "theme")
        view.layer.cornerRadius = 16
        return view
    }()
    
    private let lineView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor(named: "main")
        view.layer.cornerRadius = 3
        return view
    }()
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Formats"
        label.font = UIFont.systemFont(ofSize: 14, weight: .bold)
        label.textColor = UIColor(named: "black")
        return label
    }()
    
    private let doneBtn: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(named: "tick"), for: .normal)
        button.contentMode = .scaleAspectFill
      
        return button
    }()
    
    private let dismissBtn: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(named: "dismissIcon"), for: .normal)
        button.contentMode = .scaleAspectFill
        return button
    }()
    
    private let formatsLbl: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Starts From Formats"
        label.font = UIFont.systemFont(ofSize: 14, weight: .bold)
        label.textColor = UIColor(named: "black")
        return label
    }()
    
    private let mediaLbl: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Starts From Media"
        label.font = UIFont.systemFont(ofSize: 14, weight: .bold)
        label.textColor = UIColor(named: "black")
        return label
    }()
    
    
    var formatsArr = [["img1":"createFormat","img2":""],["img1":"instaFormat","img2":""],["img1":"instaFormat","img2":"lock"],["img1":"instaFormat","img2":"lock"],["img1":"instaFormat","img2":""],["img1":"instaFormat","img2":"lock"],["img1":"instaFormat","img2":"lock"],]
    
    private let formatsCollectionViw: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = 6
        layout.minimumInteritemSpacing = 6

        let formatsCollectionViw = UICollectionView(frame: .zero, collectionViewLayout: layout)
        formatsCollectionViw.translatesAutoresizingMaskIntoConstraints = false
        formatsCollectionViw.backgroundColor = .clear
        formatsCollectionViw.showsHorizontalScrollIndicator = false
        return formatsCollectionViw
    }()
    
    
    
    private let buttonStack: UIStackView = {
        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .horizontal
        stack.distribution = .fillEqually
        stack.spacing = 10
        return stack
    }()

    private let galleryView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor(named: "main")
        view.layer.cornerRadius = 8
        return view
    }()

    private let blockView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor =  UIColor(named: "main")
        view.layer.cornerRadius = 8
        return view
    }()

    private let galleryImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(named: "gallery")
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()

    private let galleryLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Gallery"
        label.font = UIFont.systemFont(ofSize: 12, weight: .regular)
        label.textColor = .white
        label.textAlignment = .center
        return label
    }()

    private let blockImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(named: "black")
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()

    private let blockLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Black"
        label.font = UIFont.systemFont(ofSize: 12, weight: .regular)
        label.textColor = .white
        label.textAlignment = .center
        return label
    }()


    
    // MARK: - Lifecycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    
        formatsCollectionViw.delegate = self
        formatsCollectionViw.dataSource = self
        formatsCollectionViw.register(FormatsCollectionViewCell.self, forCellWithReuseIdentifier: "FormatsCollectionViewCell")

    }
    
    // MARK: - UI Setup Methods
    private func configureUI() {
        setUpFormatView()
        setUpLineView()
        setUpDoneBtn()
        setUpDismissBtn()
        setUpTitleLbl()
        setUpFormatsLbl()
        setUpFormatsCollectionView()
        setUpMediaLbl()
        setUpButtonStack()
    }
    
    private func setUpFormatView() {
        view.addSubview(formatView)
        NSLayoutConstraint.activate([
            formatView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            formatView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            formatView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            formatView.heightAnchor.constraint(equalToConstant: 292)
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
    
    private func setUpFormatsLbl(){
        formatView.addSubview(formatsLbl)
        NSLayoutConstraint.activate([
            formatsLbl.leadingAnchor.constraint(equalTo: formatView.leadingAnchor, constant: 15),
            formatsLbl.topAnchor.constraint(equalTo: doneBtn.bottomAnchor, constant: 17)
        ])
    }
    
    private func setUpFormatsCollectionView(){
        formatView.addSubview(formatsCollectionViw)
        NSLayoutConstraint.activate([
            formatsCollectionViw.topAnchor.constraint(equalTo: formatsLbl.bottomAnchor, constant: 4),
            formatsCollectionViw.leadingAnchor.constraint(equalTo: formatView.leadingAnchor, constant: 15),
            formatsCollectionViw.trailingAnchor.constraint(equalTo: formatView.trailingAnchor, constant: 0),
            formatsCollectionViw.heightAnchor.constraint(equalToConstant: 100)
        ])
    }
    
    private func  setUpMediaLbl(){
        formatView.addSubview(mediaLbl)
        NSLayoutConstraint.activate([
            mediaLbl.leadingAnchor.constraint(equalTo: formatView.leadingAnchor, constant: 15),
            mediaLbl.topAnchor.constraint(equalTo: formatsCollectionViw.bottomAnchor, constant: 14)
        ])
    }
    
    
    
    
    private func setUpButtonStack() {
        formatView.addSubview(buttonStack)
        
        // Add views to the stack
        buttonStack.addArrangedSubview(galleryView)
        buttonStack.addArrangedSubview(blockView)
        
        // Debugging Background Colors
        galleryView.backgroundColor = UIColor(named: "main")
        blockView.backgroundColor = UIColor(named: "main")
        
        // Set up gallery view content
        galleryView.addSubview(galleryImageView)
        galleryView.addSubview(galleryLabel)
        
        NSLayoutConstraint.activate([
            galleryImageView.leadingAnchor.constraint(equalTo: galleryView.leadingAnchor, constant: 52),
            galleryImageView.centerYAnchor.constraint(equalTo: galleryView.centerYAnchor),
            galleryImageView.widthAnchor.constraint(equalToConstant: 20),
            galleryImageView.heightAnchor.constraint(equalToConstant: 20),
            
            galleryLabel.leadingAnchor.constraint(equalTo: galleryImageView.trailingAnchor, constant: 10),
            galleryLabel.centerYAnchor.constraint(equalTo: galleryImageView.centerYAnchor)
          
        ])
        
        // Set up block view content
        blockView.addSubview(blockImageView)
        blockView.addSubview(blockLabel)
        
        NSLayoutConstraint.activate([
            blockImageView.leadingAnchor.constraint(equalTo: blockView.leadingAnchor, constant: 52),
            blockImageView.centerYAnchor.constraint(equalTo: blockView.centerYAnchor),
            blockImageView.widthAnchor.constraint(equalToConstant: 20),
            blockImageView.heightAnchor.constraint(equalToConstant: 20),
            
            blockLabel.leadingAnchor.constraint(equalTo: blockImageView.trailingAnchor, constant: 10),
            blockLabel.centerYAnchor.constraint(equalTo: blockImageView.centerYAnchor),
          
        ])
        
        // Set up stack constraints
        NSLayoutConstraint.activate([
            buttonStack.leadingAnchor.constraint(equalTo: formatView.leadingAnchor, constant: 15),
            buttonStack.trailingAnchor.constraint(equalTo: formatView.trailingAnchor, constant: -15),
            buttonStack.topAnchor.constraint(equalTo: mediaLbl.bottomAnchor, constant: 14),
            buttonStack.heightAnchor.constraint(equalToConstant: 37)
        ])
    }

    
    
    // MARK: - UI Setup Collection View
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return formatsArr.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "FormatsCollectionViewCell", for: indexPath) as! FormatsCollectionViewCell
        cell.formatImageView.image = UIImage(named: formatsArr[indexPath.row]["img1"] ?? "")
        cell.lockImageView.image = UIImage(named: formatsArr[indexPath.row]["img2"] ?? "")
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let cell = CGSize(width: collectionView.frame.width / 3.5, height: 100)
        return cell
    }
}



