//
//  GraphicsControllerViewController.swift
//  Collage Maker
//
//  Created by Naveed Khalid on 20/01/2025.
//

import UIKit

class GraphicsController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    


}





//
//  FontSizeController.swift
//  Collage Maker
//
//  Created by Naveed Khalid on 18/01/2025.
//

import UIKit

class FontSizeController: UIViewController {
    
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
        label.text = "Font Size"
        label.font = UIFont.systemFont(ofSize: 14, weight: .bold)
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
    
    private let fontSizeLbl: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Font Size"
        label.font = UIFont.systemFont(ofSize: 12, weight: .medium)
        label.textColor = UIColor(named: "theme")
        return label
    }()
    
    private let fontValueLbl: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "50px"
        label.font = UIFont.systemFont(ofSize: 12, weight: .medium)
        label.textColor = UIColor.white
        label.textAlignment = .right
        return label
    }()
    
    private let fontSizeSlider: UISlider = {
        let slider = UISlider()
        slider.translatesAutoresizingMaskIntoConstraints = false
        slider.minimumValue = 0
        slider.maximumValue = 100
        slider.value = 50
        slider.minimumTrackTintColor = .white
        slider.maximumTrackTintColor = UIColor(named: "darkMain")
        if let thumbImage = UIImage(named: "thumb") {
            slider.setThumbImage(thumbImage, for: .normal)
        }
        return slider
    }()
    
    private let fontRotationLbl: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Font Rotation"
        label.font = UIFont.systemFont(ofSize: 12, weight: .medium)
        label.textColor = UIColor(named: "theme")
        return label
    }()
    
    private let fontRotationValueLbl: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "50°"
        label.font = UIFont.systemFont(ofSize: 12, weight: .medium)
        label.textColor = UIColor.white
        label.textAlignment = .right
        return label
    }()
    
    private let fontRotationSlider: UISlider = {
        let slider = UISlider()
        slider.translatesAutoresizingMaskIntoConstraints = false
        slider.minimumValue = 0
        slider.maximumValue = 100
        slider.value = 50
        slider.minimumTrackTintColor = .white
        slider.maximumTrackTintColor = UIColor(named: "darkMain")
        if let thumbImage = UIImage(named: "thumb") {
            slider.setThumbImage(thumbImage, for: .normal)
        }
        return slider
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUp()
        configureSliders()
    }
    
    private func setUp() {
        setUpFormatView()
        setUpLineView()
        setUpDismissBtn()
        setUpTitleLbl()
        
        setUpFontSizeLbl()
        setUpFontValueLbl()
        setUpFontSizeSlider()
        
        setUpFontRotationLbl()
        setUpFontRotationValueLbl()
        setUpFontRotationSlider()
    }
    
    private func setUpFormatView() {
        view.addSubview(formatView)
        NSLayoutConstraint.activate([
            formatView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            formatView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            formatView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
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
    
    private func setUpFontSizeLbl() {
        formatView.addSubview(fontSizeLbl)
        NSLayoutConstraint.activate([
            fontSizeLbl.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 18),
            fontSizeLbl.leadingAnchor.constraint(equalTo: formatView.leadingAnchor, constant: 15)
        ])
    }
    
    private func setUpFontValueLbl() {
        formatView.addSubview(fontValueLbl)
        NSLayoutConstraint.activate([
            fontValueLbl.centerYAnchor.constraint(equalTo: fontSizeLbl.centerYAnchor),
            fontValueLbl.trailingAnchor.constraint(equalTo: formatView.trailingAnchor, constant: -15),
            fontValueLbl.widthAnchor.constraint(equalToConstant: 50)
        ])
    }
    
    private func setUpFontSizeSlider() {
        formatView.addSubview(fontSizeSlider)
        NSLayoutConstraint.activate([
            fontSizeSlider.topAnchor.constraint(equalTo: fontSizeLbl.bottomAnchor, constant: 10),
            fontSizeSlider.leadingAnchor.constraint(equalTo: formatView.leadingAnchor, constant: 15),
            fontSizeSlider.trailingAnchor.constraint(equalTo: formatView.trailingAnchor, constant: -15)
        ])
    }
    
    private func setUpFontRotationLbl() {
        formatView.addSubview(fontRotationLbl)
        NSLayoutConstraint.activate([
            fontRotationLbl.topAnchor.constraint(equalTo: fontSizeSlider.bottomAnchor, constant: 18),
            fontRotationLbl.leadingAnchor.constraint(equalTo: formatView.leadingAnchor, constant: 15)
        ])
    }
    
    private func setUpFontRotationValueLbl() {
        formatView.addSubview(fontRotationValueLbl)
        NSLayoutConstraint.activate([
            fontRotationValueLbl.centerYAnchor.constraint(equalTo: fontRotationLbl.centerYAnchor),
            fontRotationValueLbl.trailingAnchor.constraint(equalTo: formatView.trailingAnchor, constant: -15),
            fontRotationValueLbl.widthAnchor.constraint(equalToConstant: 50)
        ])
    }
    
    private func setUpFontRotationSlider() {
        formatView.addSubview(fontRotationSlider)
        NSLayoutConstraint.activate([
            fontRotationSlider.topAnchor.constraint(equalTo: fontRotationLbl.bottomAnchor, constant: 10),
            fontRotationSlider.leadingAnchor.constraint(equalTo: formatView.leadingAnchor, constant: 15),
            fontRotationSlider.trailingAnchor.constraint(equalTo: formatView.trailingAnchor, constant: -15)
        ])
    }
    
    private func configureSliders() {
        fontSizeSlider.addTarget(self, action: #selector(lineSpacingSliderChanged(_:)), for: .valueChanged)
        fontRotationSlider.addTarget(self, action: #selector(latterSpacingSliderChanged(_:)), for: .valueChanged)
    }
    
    // MARK: - Slider Actions
    @objc private func lineSpacingSliderChanged(_ sender: UISlider) {
        let lineSpacingValue = Int(sender.value)
        fontValueLbl.text = "\(lineSpacingValue)px"
    }
    
    @objc private func latterSpacingSliderChanged(_ sender: UISlider) {
        let latterSpacingValue = Int(sender.value)
        fontRotationValueLbl.text = "\(latterSpacingValue)°"
    }
}
 
