//
//  ContactsController.swift
//  inJob
//
//  Created by Михаил Мерешков on 08.11.2022.
//

import UIKit

final class ContactsController: UIViewController {

    // MARK: - Views

    private lazy var scrolView: UIView = {
        let image = UIView()
        image.backgroundColor = .gray
        image.layer.cornerRadius = 3
        image.clipsToBounds = true
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    private lazy var nameLabel: UILabel = {
        let label: UILabel = UILabel()
        label.font = .systemFont(ofSize: 26, weight: .regular)
        label.textColor = .black
        label.numberOfLines = 0
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var phoneLabel: UILabel = {
        let label: UILabel = UILabel()
        label.font = .systemFont(ofSize: 20, weight: .regular)
        label.textAlignment = .left
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var mailLabel: UILabel = {
        let label: UILabel = UILabel()
        label.font = .systemFont(ofSize: 20, weight: .regular)
        label.textAlignment = .left
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    // MARK: - Private properties

    private let viewModel: ContactsViewModelProtocol

    // MARK: - Initialization

    init(viewModel: ContactsViewModelProtocol) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("ContactsController ::: init(coder:) has not been implemented")
    }

    // MARK: - LifeCycle

    override func viewDidLoad() {
        super.viewDidLoad()
        setupAppearance()
    }

    // MARK: - Private functions

    private func setupAppearance() {
        view.backgroundColor = .white

        view.addSubview(scrolView)
        view.addSubview(nameLabel)
        view.addSubview(phoneLabel)
        view.addSubview(mailLabel)
        
        setupLabel()
        setupConstraints()
    }
    
    private func setupLabel() {
        nameLabel.text = viewModel.textName
        phoneLabel.text = "Телефон: \(viewModel.textPhone)"
        mailLabel.text = "Почта: \(viewModel.textMail)"
    }

    private func setupConstraints() {
        NSLayoutConstraint.activate([
            scrolView.topAnchor.constraint(equalTo: view.topAnchor, constant: 10),
            scrolView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            scrolView.heightAnchor.constraint(equalToConstant: 5),
            scrolView.widthAnchor.constraint(equalToConstant: 45),
            
            nameLabel.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 16),
            nameLabel.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -16),
            nameLabel.topAnchor.constraint(equalTo: scrolView.bottomAnchor, constant: 30),
            
            phoneLabel.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 16),
            phoneLabel.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -16),
            phoneLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 40),
            
            mailLabel.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 16),
            mailLabel.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -16),
            mailLabel.topAnchor.constraint(equalTo: phoneLabel.bottomAnchor, constant: 14),
        ])
    }

    // MARK: - Actions

    @objc
    private func backBarButtonDidTap() {
        //viewModel.dismiss()
    }

    @objc func didTapButton() {
        //viewModel.didTapAddButton()
    }
}

