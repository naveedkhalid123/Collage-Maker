//
//  SelectColorsController.swift
//  Collage Maker
//
//  Created by Naveed Khalid on 17/01/2025.
//

import UIKit

class SelectColorsController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
   
    
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
        label.text = "Colors"
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
    
    var transitionsArr: [Any] = ["nullColor", "selectColor", "#91CCFF", "#FFC670", "#C84F54", "#F5F5F5", "#FF8669", "#F5F5F5", "#FF8669", "#C84F54", "#FF3478", "#337AFF", "#91CCFF", "#FFC670", "#E4D1FF", "#E4D1FF", "#E4D1FF", "#E4D1FF", "#E4D1FF", "#E4D1FF", "#E4D1FF", "#E4D1FF", "#E4D1FF", "#E4D1FF", "#E4D1FF","#E4D1FF", "#E4D1FF", "#E4D1FF", "#E4D1FF", "#E4D1FF"]




    
    private let colorsCollectionViw: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        
        layout.minimumLineSpacing = 6
        layout.minimumInteritemSpacing = 6

        let colorsCollectionViw = UICollectionView(frame: .zero, collectionViewLayout: layout)
        colorsCollectionViw.translatesAutoresizingMaskIntoConstraints = false
        colorsCollectionViw.backgroundColor = .clear
        colorsCollectionViw.showsVerticalScrollIndicator = false

        return colorsCollectionViw
    }()
    
    
  
    
    // MARK: - View Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        colorsCollectionViw.delegate = self
        colorsCollectionViw.dataSource = self
        colorsCollectionViw.register(AddColorsCollectionViewCell.self, forCellWithReuseIdentifier: "AddColorsCollectionViewCell")
        
        setUp()
    }
    
    private func setUp() {
        setUpFormatView()
        setUpLineView()
        setUpDismissBtn()
        setUpTitleLbl()
        setUpColorsCollectionViw()
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

    
    
    private func setUpColorsCollectionViw(){
        formatView.addSubview(colorsCollectionViw)
        NSLayoutConstraint.activate([
            colorsCollectionViw.leadingAnchor.constraint(equalTo: formatView.leadingAnchor, constant: 15),
            colorsCollectionViw.trailingAnchor.constraint(equalTo: formatView.trailingAnchor, constant: -15),
            colorsCollectionViw.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 12),
            colorsCollectionViw.bottomAnchor.constraint(equalTo: formatView.bottomAnchor, constant: 0),
            colorsCollectionViw.heightAnchor.constraint(equalToConstant: 190)
        ])
    }

    
    
    // MARK: Transition Collection View Set UP
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return transitionsArr.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "AddColorsCollectionViewCell", for: indexPath) as? AddColorsCollectionViewCell else {
            return UICollectionViewCell()
        }
        let item = transitionsArr[indexPath.item]
        
        if let imageName = item as? String, UIImage(named: imageName) != nil {
            cell.configureCell(image: UIImage(named: imageName), backgroundColor: nil)
        } else if let colorString = item as? String, let color = UIColor.fromHex(colorString) {
            cell.configureCell(image: nil, backgroundColor: color)
        }
        
        return cell
    }



    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let screenWidth = UIScreen.main.bounds.width
        let numberOfCells = 7
        let totalSpacing = CGFloat(numberOfCells - 1) * 10
        let itemWidth = (screenWidth - totalSpacing - 30) / CGFloat(numberOfCells)
        let cell = CGSize(width: itemWidth, height: 40)
        return cell
    }
        
    
    
}
    

extension UIColor {
    static func fromHex(_ hex: String) -> UIColor? {
        var hexSanitized = hex.trimmingCharacters(in: .whitespacesAndNewlines)
        hexSanitized = hexSanitized.hasPrefix("#") ? String(hexSanitized.dropFirst()) : hexSanitized
        
        guard let rgbValue = UInt64(hexSanitized, radix: 16) else { return nil }
        
        let red = CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0
        let green = CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0
        let blue = CGFloat(rgbValue & 0x0000FF) / 255.0
        
        return UIColor(red: red, green: green, blue: blue, alpha: 1.0)
    }
}


