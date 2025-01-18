//
//  AddTransitionsController.swift
//  Collage Maker
//
//  Created by Naveed Khalid on 17/01/2025.
//

import UIKit

class AddTransitionsController: UIViewController {
    
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
        label.text = "Add Pages and Transitions"
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
    
    private let stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .horizontal
        stackView.alignment = .center
        stackView.distribution = .equalSpacing
        stackView.spacing = 22
        return stackView
    }()
    private func createClickableView(imageName: String, labelText: String) -> UIView {
        let containerView = UIView()
        containerView.translatesAutoresizingMaskIntoConstraints = false
        
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(named: imageName)
        imageView.contentMode = .scaleAspectFit
        
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = labelText
        label.font = UIFont.systemFont(ofSize: 12, weight: .medium)
        label.textColor = UIColor(named: "theme")
        label.textAlignment = .center
        
        containerView.addSubview(imageView)
        containerView.addSubview(label)
        
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: containerView.topAnchor),
            imageView.centerXAnchor.constraint(equalTo: containerView.centerXAnchor),
            imageView.heightAnchor.constraint(equalToConstant: 58),
            imageView.widthAnchor.constraint(equalToConstant: 58),
            
            label.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 8),
            label.centerXAnchor.constraint(equalTo: containerView.centerXAnchor),
            label.leadingAnchor.constraint(greaterThanOrEqualTo: containerView.leadingAnchor),
            label.trailingAnchor.constraint(lessThanOrEqualTo: containerView.trailingAnchor),
            label.bottomAnchor.constraint(equalTo: containerView.bottomAnchor)
        ])
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(handleTap(_:)))
        containerView.addGestureRecognizer(tapGesture)
        containerView.isUserInteractionEnabled = true
        
        return containerView
    }

    
    // MARK: - View Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setUp()
    }
    
    private func setUp() {
        setUpFormatView()
        setUpLineView()
        setUpDismissBtn()
        setUpTitleLbl()
        setUpStackView()
    }
    
    private func setUpFormatView() {
        view.addSubview(formatView)
        NSLayoutConstraint.activate([
            formatView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
            formatView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0),
            formatView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0),
           // formatView.heightAnchor.constraint(equalToConstant: 232)
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


   
    private func setUpStackView() {
        formatView.addSubview(stackView)
        
        let addPageView = createClickableView(imageName: "addPage", labelText: "Add Page")
        let transitionsView = createClickableView(imageName: "transition", labelText: "Transitions")
        
        stackView.addArrangedSubview(addPageView)
        stackView.addArrangedSubview(transitionsView)
        
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 40),
            stackView.bottomAnchor.constraint(equalTo: formatView.bottomAnchor, constant: -54),
            stackView.centerXAnchor.constraint(equalTo: formatView.centerXAnchor),
            
        ])
    }

    
    // MARK: - Actions
    @objc private func handleTap(_ sender: UITapGestureRecognizer) {
        guard let tappedView = sender.view else { return }
        // Handle tap event for each view
        if tappedView == stackView.arrangedSubviews[0] {
            print("Add Page tapped")
        } else if tappedView == stackView.arrangedSubviews[1] {
            print("Transitions tapped")
        }
    }
}
