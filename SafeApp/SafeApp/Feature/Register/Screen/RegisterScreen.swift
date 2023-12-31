//
//  RegisterScreen.swift
//  SafeApp
//
//  Created by Lucas Neves dos santos pompeu on 18/09/23.
//

import UIKit

protocol RegisterScreenDelegate: AnyObject {
    func tappedSignUpButton()
    func tappedLoginButton()
}

class RegisterScreen: UIView {
    
    private weak var delegate: RegisterScreenDelegate?
    
    public func delegate(delegate: RegisterScreenDelegate?) {
        self.delegate = delegate
    }
    
    lazy var rocketImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 16
        imageView.contentMode = .scaleAspectFill
        imageView.image = UIImage(named: "homem_com_dinheiro")
        return imageView
    }()
    
    lazy var loginLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Sign Up Now"
        label.textColor = .black
        label.font = UIFont.boldSystemFont(ofSize: 28)
        label.textAlignment = .center
        return label
    }()
    
    lazy var loginDescriptionLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .black.withAlphaComponent(0.7)
        label.text = "Please create a free account to use the app. "
        label.font = UIFont.systemFont(ofSize: 12)
        label.textAlignment = .center
        return label
    }()
    
    lazy var emailTextField: UITextField = {
        let tf = UITextField()
        tf.translatesAutoresizingMaskIntoConstraints = false
        tf.autocorrectionType = .no
        tf.backgroundColor = .white
        tf.borderStyle = .roundedRect
        tf.keyboardType = .emailAddress
        tf.attributedPlaceholder = NSAttributedString(string: "Email", attributes: [NSAttributedString.Key.foregroundColor: UIColor.darkGray.withAlphaComponent(0.6)])
        tf.textColor = .darkGray
        tf.clipsToBounds = true
        tf.layer.cornerRadius = 24
        tf.layer.borderWidth = 1.5
        tf.layer.borderColor = UIColor.darkGray.cgColor
        return tf
    }()
    
    lazy var passwordTextField: UITextField = {
        let tf = UITextField()
        tf.translatesAutoresizingMaskIntoConstraints = false
        tf.autocorrectionType = .no
        tf.backgroundColor = .white
        tf.borderStyle = .roundedRect
        tf.isSecureTextEntry = true
        tf.attributedPlaceholder = NSAttributedString(string: "Password", attributes: [NSAttributedString.Key.foregroundColor: UIColor.darkGray.withAlphaComponent(0.6)])
        tf.textColor = .darkGray
        tf.clipsToBounds = true
        tf.layer.cornerRadius = 24
        tf.layer.borderWidth = 1.5
        tf.layer.borderColor = UIColor.darkGray.cgColor
        return tf
    }()
    
    lazy var signUpButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = .black.withAlphaComponent(0.6)
        button.clipsToBounds = true
        button.layer.cornerRadius = 24
        button.setTitle("Sign Up", for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 26)
        button.addTarget(self, action: #selector(tappedSignUpButton), for: .touchUpInside)
        return button
    }()
    
    @objc
    func tappedSignUpButton() {
        delegate?.tappedSignUpButton()
    }
    
    lazy var loginButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Already have an account? Login", for: .normal)
        button.setTitleColor(.darkGray, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 14)
        button.addTarget(self, action: #selector(tappedLoginButton), for: .touchUpInside)
        return button
    }()
    
    @objc
    func tappedLoginButton() {
        delegate?.tappedLoginButton()
    }
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white
        addViews()
        configConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func addViews() {
        addSubview(rocketImageView)
        addSubview(loginLabel)
        addSubview(loginDescriptionLabel)
        addSubview(emailTextField)
        addSubview(passwordTextField)
        addSubview(loginButton)
        addSubview(signUpButton)
    }
    
    private func configConstraints() {
        NSLayoutConstraint.activate([
            rocketImageView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 35),
            rocketImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            rocketImageView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            rocketImageView.heightAnchor.constraint(equalToConstant: 250),
            
            loginLabel.topAnchor.constraint(equalTo: rocketImageView.bottomAnchor, constant: 35),
            loginLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            
            loginDescriptionLabel.topAnchor.constraint(equalTo: loginLabel.bottomAnchor, constant: 8),
            loginDescriptionLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            
            emailTextField.topAnchor.constraint(equalTo: loginDescriptionLabel.bottomAnchor, constant: 30),
            emailTextField.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 45),
            emailTextField.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -45),
            emailTextField.heightAnchor.constraint(equalToConstant: 55),
            
            passwordTextField.topAnchor.constraint(equalTo: emailTextField.bottomAnchor, constant: 25),
            passwordTextField.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 45),
            passwordTextField.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -45),
            passwordTextField.heightAnchor.constraint(equalToConstant: 55),
            
            signUpButton.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: 85),
            signUpButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 30),
            signUpButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -30),
            signUpButton.heightAnchor.constraint(equalToConstant: 60),
            
            loginButton.topAnchor.constraint(equalTo: signUpButton.bottomAnchor, constant: 15),
            loginButton.centerXAnchor.constraint(equalTo: centerXAnchor),
        ])
    }
    
    
}
