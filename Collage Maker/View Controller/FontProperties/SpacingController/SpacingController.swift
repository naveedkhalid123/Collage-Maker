
//
//  SpacingController.swift
//  Collage Maker
//
//  Created by Naveed Khalid on 18/01/2025.
//

import UIKit

class SpacingController: UIViewController {
    
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
        label.text = "Spacing"
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
    
    private let lineSpacingLbl: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Line Spacing"
        label.font = UIFont.systemFont(ofSize: 12, weight: .medium)
        label.textColor = UIColor(named: "theme")
        return label
    }()
    
    private let spacingValueLbl: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "50 px"
        label.font = UIFont.systemFont(ofSize: 12, weight: .medium)
        label.textColor = UIColor.white
        label.textAlignment = .right
        return label
    }()
    
    private let lineSpacingSlider: UISlider = {
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
    
    private let latterSpacingLbl: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Latter Spacing"
        label.font = UIFont.systemFont(ofSize: 12, weight: .medium)
        label.textColor = UIColor(named: "theme")
        return label
    }()
    
    private let latterValueLbl: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "50 px"
        label.font = UIFont.systemFont(ofSize: 12, weight: .medium)
        label.textColor = UIColor.white
        label.textAlignment = .right
        return label
    }()
    
    private let latterSpacingSlider: UISlider = {
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
        
        setUpLineSpacingLbl()
        setUpSpacingValueLbl()
        setUpLineSpacingSlider()
        
        setUpLatterSpacingLbl()
        setUpLatterSpacingValueLbl()
        setUpLatterSpacingSlider()
    }
    
    private func setUpFormatView() {
        view.addSubview(formatView)
        NSLayoutConstraint.activate([
            formatView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
            formatView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0),
            formatView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0),
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
    
    private func setUpLineSpacingLbl() {
        formatView.addSubview(lineSpacingLbl)
        NSLayoutConstraint.activate([
            lineSpacingLbl.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 18),
            lineSpacingLbl.leadingAnchor.constraint(equalTo: formatView.leadingAnchor, constant: 15)
        ])
    }
    
    private func setUpSpacingValueLbl() {
        formatView.addSubview(spacingValueLbl)
        NSLayoutConstraint.activate([
            spacingValueLbl.centerYAnchor.constraint(equalTo: lineSpacingLbl.centerYAnchor),
            spacingValueLbl.trailingAnchor.constraint(equalTo: formatView.trailingAnchor, constant: -15),
            spacingValueLbl.widthAnchor.constraint(equalToConstant: 50)
        ])
    }
    
    private func setUpLineSpacingSlider() {
        formatView.addSubview(lineSpacingSlider)
        NSLayoutConstraint.activate([
            lineSpacingSlider.topAnchor.constraint(equalTo: lineSpacingLbl.bottomAnchor, constant: 10),
            lineSpacingSlider.leadingAnchor.constraint(equalTo: formatView.leadingAnchor, constant: 15),
            lineSpacingSlider.trailingAnchor.constraint(equalTo: formatView.trailingAnchor, constant: -15)
        ])
    }
    
    private func setUpLatterSpacingLbl() {
        formatView.addSubview(latterSpacingLbl)
        NSLayoutConstraint.activate([
            latterSpacingLbl.topAnchor.constraint(equalTo: lineSpacingSlider.bottomAnchor, constant: 18),
            latterSpacingLbl.leadingAnchor.constraint(equalTo: formatView.leadingAnchor, constant: 15)
        ])
    }
    
    private func setUpLatterSpacingValueLbl() {
        formatView.addSubview(latterValueLbl)
        NSLayoutConstraint.activate([
            latterValueLbl.centerYAnchor.constraint(equalTo: latterSpacingLbl.centerYAnchor),
            latterValueLbl.trailingAnchor.constraint(equalTo: formatView.trailingAnchor, constant: -15),
            latterValueLbl.widthAnchor.constraint(equalToConstant: 50)
        ])
    }
    
    private func setUpLatterSpacingSlider() {
        formatView.addSubview(latterSpacingSlider)
        NSLayoutConstraint.activate([
            latterSpacingSlider.topAnchor.constraint(equalTo: latterSpacingLbl.bottomAnchor, constant: 10),
            latterSpacingSlider.leadingAnchor.constraint(equalTo: formatView.leadingAnchor, constant: 15),
            latterSpacingSlider.trailingAnchor.constraint(equalTo: formatView.trailingAnchor, constant: -15)
        ])
    }
    
    private func configureSliders() {
        lineSpacingSlider.addTarget(self, action: #selector(lineSpacingSliderChanged(_:)), for: .valueChanged)
        latterSpacingSlider.addTarget(self, action: #selector(latterSpacingSliderChanged(_:)), for: .valueChanged)
    }
    
    // MARK: - Slider Actions
    @objc private func lineSpacingSliderChanged(_ sender: UISlider) {
        let lineSpacingValue = Int(sender.value)
        spacingValueLbl.text = "\(lineSpacingValue) px"
        print("Line spacing adjusted to: \(lineSpacingValue) px")
    }
    
    @objc private func latterSpacingSliderChanged(_ sender: UISlider) {
        let latterSpacingValue = Int(sender.value)
        latterValueLbl.text = "\(latterSpacingValue) px"
        print("Latter spacing adjusted to: \(latterSpacingValue) px")
    }
}
