//
//  SignInViewController.swift
//  Collage Maker
//
//  Created by Naveed Khalid on 09/01/2025.
//

import UIKit

class SignInViewController: UIViewController {
    
    private let scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.showsVerticalScrollIndicator = false
        return scrollView
    }()
    
    
    private let centerViw: UIView = {
        let centerViw = UIView()
        centerViw.translatesAutoresizingMaskIntoConstraints = false
        return centerViw
    }()
    
    
    private let signUpView: UIView = {
        let signUpView = UIView()
        signUpView.translatesAutoresizingMaskIntoConstraints = false
        signUpView.backgroundColor = UIColor(named: "viewColor")
        signUpView.layer.cornerRadius = 6
        return signUpView
    }()
    
    
    private let signUpButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Sign In", for: .normal)
        button.backgroundColor = UIColor(named: "main")
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        button.layer.cornerRadius = 6
        return button
    }()
    
    
    private let usernameLbl: UILabel = {
        let userNamelbl = UILabel()
        userNamelbl.translatesAutoresizingMaskIntoConstraints = false
        userNamelbl.text = "User Name"
        userNamelbl.font = UIFont.systemFont(ofSize: 14, weight: .bold)
        return userNamelbl
    }()
    
    
    private let tfuserName: UITextField = {
        let tfuserName = UITextField()
        tfuserName.translatesAutoresizingMaskIntoConstraints = false
        tfuserName.backgroundColor = .white
        tfuserName.font = UIFont.systemFont(ofSize: 12)
        tfuserName.layer.cornerRadius = 6
        tfuserName.attributedPlaceholder = NSAttributedString(
            string: "Enter User Name",
            attributes: [
                .foregroundColor: UIColor.lightGray,
                .font: UIFont.systemFont(ofSize: 14, weight: .medium)
            ]
        )

        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: tfuserName.frame.height))
        tfuserName.leftView = paddingView
        tfuserName.leftViewMode = .always
        
        let rightPaddingView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: tfuserName.frame.height))
        tfuserName.rightView = rightPaddingView
        tfuserName.rightViewMode = .always
        
        return tfuserName
    
    }()
    
    
    private let passwordLbl : UILabel = {
        let passwordLbl = UILabel()
        passwordLbl.translatesAutoresizingMaskIntoConstraints = false
        passwordLbl.text = "Password"
        passwordLbl.font =  UIFont.systemFont(ofSize: 14, weight: .bold)
        return passwordLbl
    }()
    
    
    private let tfPassword: UITextField = {
        let tfPassword = UITextField()
        tfPassword.translatesAutoresizingMaskIntoConstraints = false
        tfPassword.backgroundColor = .white
        tfPassword.font = UIFont.systemFont(ofSize: 12)
        tfPassword.layer.cornerRadius = 6
        
        tfPassword.attributedPlaceholder = NSAttributedString(
            string: "Enter Password",
            attributes: [
                .foregroundColor: UIColor.lightGray,
                .font: UIFont.systemFont(ofSize: 14, weight: .medium)
            ]
        )

     
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: tfPassword.frame.height))
        tfPassword.leftView = paddingView
        tfPassword.leftViewMode = .always
        
        let rightPaddingView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: tfPassword.frame.height))
        tfPassword.rightView = rightPaddingView
        tfPassword.rightViewMode = .always
        
        return tfPassword
        
    }()
    
    private let forgotPassBtn: UIButton = {
        let forgotPassBtn = UIButton()
        forgotPassBtn.translatesAutoresizingMaskIntoConstraints = false
        let attributedString = NSAttributedString(
            string: "Forgot password",
            attributes: [
                .foregroundColor: UIColor(named: "main") ?? UIColor.black,
                .font: UIFont.systemFont(ofSize: 12, weight: .regular),
                .underlineStyle: NSUnderlineStyle.single.rawValue      
            ]
        )
        forgotPassBtn.setAttributedTitle(attributedString, for: .normal)
        
        return forgotPassBtn
    }()


    
    private let signInBtn: UIButton = {
        let signInBtn = UIButton()
        signInBtn.setTitle("Sign In", for: .normal)
        signInBtn.translatesAutoresizingMaskIntoConstraints = false
        signInBtn.backgroundColor =  UIColor(named: "main")
        signInBtn.layer.cornerRadius = 6
        signInBtn.setTitleColor(.white, for: .normal)
        signInBtn.titleLabel?.font = UIFont.systemFont(ofSize: 12, weight: .bold)
        return signInBtn
        
    }()
    
    private let signInWith : UILabel = {
        let signInWith = UILabel()
        signInWith.translatesAutoresizingMaskIntoConstraints = false
        signInWith.text = "Sign Up With Using"
        signInWith.textColor = UIColor(named: "black")
        signInWith.font = UIFont.systemFont(ofSize: 12, weight: .regular)
        return signInWith
    }()
    
    
    private let appleView : UIView = {
        let appleView = UIView()
        appleView.translatesAutoresizingMaskIntoConstraints = false
        appleView.backgroundColor = UIColor(named: "viewColor")
        appleView.layer.cornerRadius = 6
        return appleView
    }()
    
    private let appleLbl : UILabel = {
        let appleLbl = UILabel()
        appleLbl.translatesAutoresizingMaskIntoConstraints = false
        appleLbl.text = "Continue With Apple"
        appleLbl.textColor = UIColor(named: "black")
        appleLbl.font = UIFont.systemFont(ofSize: 12, weight: .regular)
        return appleLbl
    }()
    
    private let appleImage: UIImageView = {
        let appleImage = UIImageView()
        appleImage.image = UIImage(named: "apple")
        appleImage.contentMode = .scaleAspectFill
        appleImage.translatesAutoresizingMaskIntoConstraints = false
        return appleImage
    }()

    
    private let googleView : UIView = {
        let googleView = UIView()
        googleView.translatesAutoresizingMaskIntoConstraints = false
        googleView.backgroundColor = UIColor(named: "viewColor")
        googleView.layer.cornerRadius = 6
        return googleView
    }()
    
    private let googleLbl : UILabel = {
        let googleLbl = UILabel()
        googleLbl.translatesAutoresizingMaskIntoConstraints = false
        googleLbl.text = "Continue With Google"
        googleLbl.textColor = UIColor(named: "black")
        googleLbl.font = UIFont.systemFont(ofSize: 12, weight: .regular)
        return googleLbl
    }()
    
    private let googleImage: UIImageView = {
        let googleImage = UIImageView()
        googleImage.image = UIImage(named: "google")
        googleImage.contentMode = .scaleAspectFill
        googleImage.translatesAutoresizingMaskIntoConstraints = false
        return googleImage
    }()
    
    private let fbView : UIView = {
        let fbView = UIView()
        fbView.translatesAutoresizingMaskIntoConstraints = false
        fbView.backgroundColor = UIColor(named: "viewColor")
        fbView.layer.cornerRadius = 6
        return fbView
    }()
    
    private let fbLbl : UILabel = {
        let fbLbl = UILabel()
        fbLbl.translatesAutoresizingMaskIntoConstraints = false
        fbLbl.text = "Continue With Facebook"
        fbLbl.textColor = UIColor(named: "black")
        fbLbl.font = UIFont.systemFont(ofSize: 12, weight: .regular)
        return fbLbl
    }()
    
    private let fbImage: UIImageView = {
        let fbImage = UIImageView()
        fbImage.image = UIImage(named: "fb")
        fbImage.contentMode = .scaleAspectFill
        fbImage.translatesAutoresizingMaskIntoConstraints = false
        return fbImage
    }()
    
    
    private let guestView : UIView = {
        let guestView = UIView()
        guestView.translatesAutoresizingMaskIntoConstraints = false
        guestView.backgroundColor = UIColor(named: "viewColor")
        guestView.layer.cornerRadius = 6
        return guestView
    }()
    
    private let guestLbl : UILabel = {
        let guestLbl = UILabel()
        guestLbl.translatesAutoresizingMaskIntoConstraints = false
        guestLbl.text = "Continue as a Guest"
        guestLbl.textColor = UIColor(named: "black")
        guestLbl.font = UIFont.systemFont(ofSize: 12, weight: .regular)
        return guestLbl
    }()
    
    private let guestImage: UIImageView = {
        let guestImage = UIImageView()
        guestImage.image = UIImage(named: "guest")
        guestImage.contentMode = .scaleAspectFill
        guestImage.translatesAutoresizingMaskIntoConstraints = false
        return guestImage
    }()
    
    
    private let accountMessageview : UIView = {
        let accountMessageview = UIView()
        accountMessageview.translatesAutoresizingMaskIntoConstraints = false
        return accountMessageview
    }()
    
    
    private let notAccountLbl : UILabel = {
        let notAccountLbl = UILabel()
        notAccountLbl.translatesAutoresizingMaskIntoConstraints = false
        notAccountLbl.text = "Don't have an account?"
        notAccountLbl.textColor = UIColor(named: "subHead")
        notAccountLbl.font = UIFont.systemFont(ofSize: 12, weight: .regular)
        return notAccountLbl
    }()
    
    
    private let signUpBtn: UIButton = {
        let signUpBtn = UIButton()
        signUpBtn.translatesAutoresizingMaskIntoConstraints = false
        
      
        let attributedTitle = NSAttributedString(
            string: "Sign Up",
            attributes: [
                .foregroundColor: UIColor.main,
                .font: UIFont.systemFont(ofSize: 12, weight: .regular),
            ]
        )
        signUpBtn.setAttributedTitle(attributedTitle, for: .normal)
        return signUpBtn
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(named: "theme")
        setupScrollView()
        setUpCenterView()
        setUpSignUpView()
        setupSignUpButton()
        setupUserNameLabel()
        setupUserNameTextField()
        setupPasswordLbl()
        setupPasswordTextField()
        setupForgotPassBtn()
        setupSignInBtn()
        setupsignInWithLBl()
        setupAppleView()
        setupAppleLbl()
        setupAppleImage()
        setupGoogleView()
        setupGoogleLbl()
        setupGoogleImage()
        setupFbView()
        setupFbLbl()
        setupFbImage()
        setupGuestView()
        setupGuestLbl()
        setupGuestImage()
        setupaccountMessageview()
        setupNotAccountLbl()
        setupsignUpBtn()
    }
    
    private func setupScrollView() {
        view.addSubview(scrollView)
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: view.topAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
    }
    
    private func setUpCenterView(){
        scrollView.addSubview(centerViw)
        NSLayoutConstraint.activate([
            centerViw.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 47),
            centerViw.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -47),
            centerViw.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor),
            centerViw.centerYAnchor.constraint(equalTo: scrollView.centerYAnchor),
            // for making the view in the center , remove the top and bottom , and give it horizontally and vertically center
            centerViw.widthAnchor.constraint(equalToConstant: 279),
            centerViw.heightAnchor.constraint(equalToConstant: 560),
        ])
    }
    
    private func setUpSignUpView() {
        centerViw.addSubview(signUpView)
        NSLayoutConstraint.activate([
            signUpView.topAnchor.constraint(equalTo: centerViw.topAnchor, constant: 0),
            signUpView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 47),
            signUpView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -47),
            signUpView.centerXAnchor.constraint(equalTo: centerViw.centerXAnchor),
            signUpView.widthAnchor.constraint(equalToConstant: 279),
            signUpView.heightAnchor.constraint(equalToConstant: 280)
        ])
    }
    
    
    
    private func setupSignUpButton() {
        signUpView.addSubview(signUpButton)
        NSLayoutConstraint.activate([
            signUpButton.centerXAnchor.constraint(equalTo: signUpView.centerXAnchor),
            signUpButton.topAnchor.constraint(equalTo: signUpView.topAnchor, constant: -27),
            signUpButton.widthAnchor.constraint(equalToConstant: 185),
            signUpButton.heightAnchor.constraint(equalToConstant: 56)
        ])
        signUpButton.addTarget(self, action: #selector(signUpButtonTapped), for: .touchUpInside)
    }
    
    
    
    private func setupUserNameLabel() {
        signUpView.addSubview(usernameLbl)
        NSLayoutConstraint.activate([
            usernameLbl.leadingAnchor.constraint(equalTo: signUpView.leadingAnchor, constant: 22),
            usernameLbl.topAnchor.constraint(equalTo: signUpView.topAnchor, constant: 45)
        ])
    }
    
    
    private func setupUserNameTextField() {
        signUpView.addSubview(tfuserName)
        NSLayoutConstraint.activate([
                tfuserName.topAnchor.constraint(equalTo: usernameLbl.bottomAnchor, constant: 6),
                tfuserName.leadingAnchor.constraint(equalTo: signUpView.leadingAnchor, constant: 22),
                tfuserName.trailingAnchor.constraint(equalTo: signUpView.trailingAnchor, constant: -22),
                tfuserName.heightAnchor.constraint(equalToConstant: 36)
            ])

    }
    
    private func setupPasswordLbl() {
        signUpView.addSubview(passwordLbl)
        NSLayoutConstraint.activate([
            passwordLbl.topAnchor.constraint(equalTo: tfuserName.bottomAnchor, constant: 10),
            passwordLbl.leadingAnchor.constraint(equalTo: signUpView.leadingAnchor, constant: 22),
        ])
    }

    
    private func setupPasswordTextField(){
        signUpView.addSubview(tfPassword)
        NSLayoutConstraint.activate([
            tfPassword.topAnchor.constraint(equalTo:passwordLbl.bottomAnchor , constant: 6),
            tfPassword.leadingAnchor.constraint(equalTo: signUpView.leadingAnchor, constant: 22),
            tfPassword.trailingAnchor.constraint(equalTo: signUpView.trailingAnchor, constant: -22),
            tfPassword.heightAnchor.constraint(equalToConstant: 36),
            
    
        ])
    }
    
    
    private func setupForgotPassBtn(){
        signUpView.addSubview(forgotPassBtn)
        NSLayoutConstraint.activate([
            forgotPassBtn.topAnchor.constraint(equalTo: tfPassword.bottomAnchor, constant: 6),
            forgotPassBtn.trailingAnchor.constraint(equalTo: signUpView.trailingAnchor, constant: -22)
        ])
    }
    
    private func setupSignInBtn(){
        signUpView.addSubview(signInBtn)
        NSLayoutConstraint.activate([
            signInBtn.topAnchor.constraint(equalTo: forgotPassBtn.bottomAnchor, constant: 20),
            signInBtn.leadingAnchor.constraint(equalTo: signUpView.leadingAnchor, constant: 20),
            signInBtn.trailingAnchor.constraint(equalTo: signUpView.trailingAnchor, constant: -20),
            signInBtn.widthAnchor.constraint(equalToConstant: 235),
            signInBtn.heightAnchor.constraint(equalToConstant: 36),
        ])
    }
    
    
    private func setupsignInWithLBl() {
        view.addSubview(signInWith)
        NSLayoutConstraint.activate([
            signInWith.topAnchor.constraint(equalTo: signUpView.bottomAnchor, constant: 15),
            signInWith.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
    }

    
    private func setupAppleView(){
        view.addSubview(appleView)
        NSLayoutConstraint.activate([
            appleView.topAnchor.constraint(equalTo: signInWith.bottomAnchor, constant: 17),
            appleView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 47),
            appleView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -47),
            appleView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            appleView.widthAnchor.constraint(equalToConstant: 279),
            appleView.heightAnchor.constraint(equalToConstant: 36)
        ])
    }
    
    
    private func setupAppleLbl(){
        appleView.addSubview(appleLbl)
        NSLayoutConstraint.activate([
            appleLbl.leadingAnchor.constraint(equalTo: appleView.leadingAnchor, constant: 8),
            appleLbl.centerYAnchor.constraint(equalTo: appleView.centerYAnchor)
        ])
    }
    
    
    private func setupAppleImage(){
        appleView.addSubview(appleImage)
        NSLayoutConstraint.activate([
            appleImage.trailingAnchor.constraint(equalTo: appleView.trailingAnchor, constant: -8),
            appleImage.centerYAnchor.constraint(equalTo: appleView.centerYAnchor)
        ])
    }
    
    private func setupGoogleView(){
        view.addSubview(googleView)
        NSLayoutConstraint.activate([
            googleView.topAnchor.constraint(equalTo: appleView.bottomAnchor, constant: 12),
            googleView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 47),
            googleView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -47),
            googleView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            googleView.widthAnchor.constraint(equalToConstant: 279),
            googleView.heightAnchor.constraint(equalToConstant: 36)
        ])
    }
    
    private func setupGoogleLbl(){
        googleView.addSubview(googleLbl)
        NSLayoutConstraint.activate([
            googleLbl.leadingAnchor.constraint(equalTo: googleView.leadingAnchor, constant: 8),
            googleLbl.centerYAnchor.constraint(equalTo: googleView.centerYAnchor)
        ])
    }
    
    
    private func setupGoogleImage(){
        googleView.addSubview(googleImage)
        NSLayoutConstraint.activate([
            googleImage.trailingAnchor.constraint(equalTo: googleView.trailingAnchor, constant: -8),
            googleImage.centerYAnchor.constraint(equalTo: googleView.centerYAnchor)
        ])
    }
    
    private func setupFbView(){
        view.addSubview(fbView)
        NSLayoutConstraint.activate([
            fbView.topAnchor.constraint(equalTo: googleView.bottomAnchor, constant: 12),
            fbView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 47),
            fbView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -47),
            fbView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            fbView.widthAnchor.constraint(equalToConstant: 279),
            fbView.heightAnchor.constraint(equalToConstant: 36)
        ])
    }
    
    
    private func setupFbLbl(){
        fbView.addSubview(fbLbl)
        NSLayoutConstraint.activate([
            fbLbl.leadingAnchor.constraint(equalTo: fbView.leadingAnchor, constant: 8),
            fbLbl.centerYAnchor.constraint(equalTo: fbView.centerYAnchor)
        ])
    }
    
    
    private func setupFbImage(){
        fbView.addSubview(fbImage)
        NSLayoutConstraint.activate([
            fbImage.trailingAnchor.constraint(equalTo: fbView.trailingAnchor, constant: -8),
            fbImage.centerYAnchor.constraint(equalTo: fbView.centerYAnchor)
        ])
    }
    
    
    private func setupGuestView(){
        view.addSubview(guestView)
        NSLayoutConstraint.activate([
            guestView.topAnchor.constraint(equalTo: fbView.bottomAnchor, constant: 12),
            guestView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 47),
            guestView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -47),
            guestView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            guestView.widthAnchor.constraint(equalToConstant: 279),
            guestView.heightAnchor.constraint(equalToConstant: 36)
            
        ])
    }
    
    private func setupGuestLbl(){
        guestView.addSubview(guestLbl)
        NSLayoutConstraint.activate([
            guestLbl.leadingAnchor.constraint(equalTo: guestView.leadingAnchor, constant: 8),
            guestLbl.centerYAnchor.constraint(equalTo: guestView.centerYAnchor)
        ])
    }
    
    private func setupGuestImage(){
        guestView.addSubview(guestImage)
        NSLayoutConstraint.activate([
            guestImage.trailingAnchor.constraint(equalTo: guestView.trailingAnchor, constant: -8),
            guestImage.centerYAnchor.constraint(equalTo: guestView.centerYAnchor)
        ])
    }
    
    
    private func setupaccountMessageview() {
        signUpView.addSubview(accountMessageview)
        NSLayoutConstraint.activate([
            accountMessageview.topAnchor.constraint(equalTo: guestLbl.bottomAnchor, constant: 20),
            accountMessageview.bottomAnchor.constraint(equalTo: centerViw.bottomAnchor, constant: 2),
            accountMessageview.centerXAnchor.constraint(equalTo: signUpView.centerXAnchor),
            accountMessageview.heightAnchor.constraint(equalToConstant: 17),
            accountMessageview.widthAnchor.constraint(equalToConstant: 190),
        ])
    }

    
    
    private func setupNotAccountLbl() {
        accountMessageview.addSubview(notAccountLbl)
        NSLayoutConstraint.activate([
            notAccountLbl.leadingAnchor.constraint(equalTo: accountMessageview.leadingAnchor, constant:2),
            notAccountLbl.centerYAnchor.constraint(equalTo: accountMessageview.centerYAnchor)
        ])
    }

    private func setupsignUpBtn(){
        accountMessageview.addSubview(signUpBtn)
        NSLayoutConstraint.activate([
            signUpBtn.leadingAnchor.constraint(equalTo: notAccountLbl.trailingAnchor , constant: 2),
            signUpBtn.centerYAnchor.constraint(equalTo: accountMessageview.centerYAnchor),
        ])
    }
    // Action for Sign-Up Button
    @objc private func signUpButtonTapped() {
        print("Sign-Up button tapped!")
    }
    
}



