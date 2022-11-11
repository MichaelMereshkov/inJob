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
        let barButton = UIBarButtonItem(image: #imageLiteral(resourceName: "nav_back"), style: .plain, target: self, action: #selector(backBarButtonDidTap))
        barButton.imageInsets = UIEdgeInsets(top: 0, left: -13.0, bottom: 0, right: 13.0)
        return barButton
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
        
        setupConstraints()
    }

    private func setupConstraints() {
        NSLayoutConstraint.activate([
            
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
