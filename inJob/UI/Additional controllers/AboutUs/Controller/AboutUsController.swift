//
//  AboutUsController.swift
//  inJob
//
//  Created by Михаил Мерешков on 10.11.2022.
//

import UIKit

final class AboutUsController: UIViewController {

    // MARK: - Views

    private lazy var backBarButton: UIBarButtonItem = {
        let barButton = UIBarButtonItem(image: UIImage(systemName: "chevron.left"), style: .plain, target: self, action: #selector(backBarButtonDidTap))
        barButton.tintColor = .darkGray
        return barButton
    }()
    
    private lazy var iconImageView: UIImageView = {
        let iconImageView = UIImageView()
        iconImageView.image = #imageLiteral(resourceName: "log_search")
        iconImageView.contentMode = .scaleAspectFit
        iconImageView.translatesAutoresizingMaskIntoConstraints = false
        
        return iconImageView
    }()
    
    private lazy var titleLabel: UILabel = {
        let label: UILabel = UILabel()
        label.font = .systemFont(ofSize: 20, weight: .regular)
        label.numberOfLines = 0
        label.textAlignment = .center
        label.textColor = .darkText
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()


    // MARK: - Private properties

    private let viewModel: AboutUsViewModelProtocol

    // MARK: - Initialization

    init(viewModel: AboutUsViewModelProtocol) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("AboutUsController ::: init(coder:) has not been implemented")
    }

    // MARK: - LifeCycle

    override func viewDidLoad() {
        super.viewDidLoad()
        setupAppearance()
    }

    // MARK: - Private functions

    private func setupAppearance() {
        view.backgroundColor = .white
        navigationItem.title = "О приложении"
        navigationItem.leftBarButtonItem = backBarButton
        navigationItem.leftBarButtonItem?.title = ""
        navigationItem.leftBarButtonItem?.tintColor = .darkText
        
        view.addSubview(iconImageView)
        view.addSubview(titleLabel)
        
        titleLabel.text = "Мы - команда Android и iOS разработчиков:\nМерешков Магомед, \nМерешков Магомед-Амин, \nЧаниев Магомед-Амин. \nПодготовили прототип приложения для хакатона, который устраивает Министерство промышленности и цифрового развития Республики Ингушетия, на тему:\n «Разработка полезного сервиса для Республики Ингушетия»."
        
        setupConstraints()
    }

    private func setupConstraints() {
        NSLayoutConstraint.activate([
            iconImageView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 100),
            iconImageView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -100),
            iconImageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 32),
            iconImageView.heightAnchor.constraint(equalTo: iconImageView.widthAnchor),
            
            titleLabel.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 16),
            titleLabel.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -16),
            titleLabel.topAnchor.constraint(equalTo: iconImageView.bottomAnchor, constant: 32),
        ])
    }
    
    // MARK: - Actions

    @objc
    private func backBarButtonDidTap() {
        navigationController?.popViewController(animated: true)
    }
}
