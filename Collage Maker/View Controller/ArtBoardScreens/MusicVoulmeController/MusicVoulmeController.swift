//
//  MusicVoulmeController.swift
//  Collage Maker
//
//  Created by Naveed Khalid on 17/01/2025.
//

import UIKit

class MusicVoulmeController: UIViewController {
    
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
        label.text = "Music Volume"
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
    
    private let volumeLbl: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Volume"
        label.font = UIFont.systemFont(ofSize: 12, weight: .medium)
        label.textColor = UIColor(named: "theme")
        return label
    }()
    
    private let volumeSlider: UISlider = {
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
    
    private let sliderView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor(named: "darkMain")
        view.layer.borderColor = UIColor(named: "white")?.cgColor
        view.layer.borderWidth = 1
        view.layer.cornerRadius = 4
        return view
    }()
    
    private let sliderValueLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "50"
        label.textColor = UIColor(named: "white")
        label.font = UIFont.systemFont(ofSize: 12, weight: .regular)
        label.textAlignment = .center
        return label
    }()
    
    
    private let toggleButton: UIButton = {
           let button = UIButton()
           button.translatesAutoresizingMaskIntoConstraints = false
           button.setImage(UIImage(named: "applyEmpty"), for: .normal)
           button.setImage(UIImage(named: "applyFill"), for: .selected)
           return button
       }()
    

    private let applyAudioLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Apply to all audio track"
        label.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        label.textColor = UIColor(named: "white")
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUp()
        volumeSlider.addTarget(self, action: #selector(volumeSliderChanged), for: .valueChanged)
        
    }
    
  
    private func setUp() {
        setUpFormatView()
        setUpLineView()
        setUpDoneBtn()
        setUpDismissBtn()
        setUpTitleLbl()
        setUpVolumeLbl()
        setUpVolumeSlider()
        setUpSliderView()
        setUpToggleButton()
        setUpApplyAudioLabel()
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
    
    private func setUpVolumeLbl() {
        formatView.addSubview(volumeLbl)
        NSLayoutConstraint.activate([
            volumeLbl.topAnchor.constraint(equalTo: doneBtn.bottomAnchor, constant: 41),
            volumeLbl.leadingAnchor.constraint(equalTo: formatView.leadingAnchor, constant: 15)
        ])
    }
    
    private func setUpVolumeSlider() {
        formatView.addSubview(volumeSlider)
        NSLayoutConstraint.activate([
            volumeSlider.topAnchor.constraint(equalTo: volumeLbl.bottomAnchor, constant: 9),
            volumeSlider.leadingAnchor.constraint(equalTo: formatView.leadingAnchor, constant: 15),
            volumeSlider.trailingAnchor.constraint(equalTo: formatView.trailingAnchor, constant: -80),
        ])
    }
    
    private func setUpSliderView() {
        formatView.addSubview(sliderView)
        sliderView.addSubview(sliderValueLabel)
        
        NSLayoutConstraint.activate([
            sliderView.trailingAnchor.constraint(equalTo: formatView.trailingAnchor, constant: -15),
            sliderView.centerYAnchor.constraint(equalTo: volumeSlider.centerYAnchor),
            sliderView.heightAnchor.constraint(equalToConstant: 40),
            sliderView.widthAnchor.constraint(equalToConstant: 40),
            
            sliderValueLabel.centerXAnchor.constraint(equalTo: sliderView.centerXAnchor),
            sliderValueLabel.centerYAnchor.constraint(equalTo: sliderView.centerYAnchor)
        ])
    }
    
    @objc private func volumeSliderChanged(_ sender: UISlider) {
        let sliderValue = Int(sender.value)
        sliderValueLabel.text = "\(sliderValue)"
    }
    
    
    private func setUpToggleButton() {
        
        formatView.addSubview(toggleButton)
        NSLayoutConstraint.activate([
            toggleButton.leadingAnchor.constraint(equalTo: formatView.leadingAnchor, constant: 15),
            toggleButton.topAnchor.constraint(equalTo: volumeSlider.bottomAnchor, constant: 56),
            toggleButton.bottomAnchor.constraint(equalTo: formatView.bottomAnchor, constant: -26),
            toggleButton.widthAnchor.constraint(equalToConstant: 18),
            toggleButton.heightAnchor.constraint(equalToConstant: 18)
        ])
           

           toggleButton.addTarget(self, action: #selector(toggleButtonTapped), for: .touchUpInside)
       }
    
    
    
    private func setUpApplyAudioLabel(){
        formatView.addSubview(applyAudioLabel)
        NSLayoutConstraint.activate([
            applyAudioLabel.leadingAnchor.constraint(equalTo: toggleButton.trailingAnchor, constant: 12),
            applyAudioLabel.centerYAnchor.constraint(equalTo: toggleButton.centerYAnchor)
        ])
    }
    
       
       // MARK: - Actions
       @objc private func toggleButtonTapped(_ sender: UIButton) {
           sender.isSelected.toggle()
       }
}

