//
//  ProfileController.swift
//  inJob
//
//  Created by Михаил Мерешков on 05.11.2022.
//

import UIKit

final class ProfileController: UIViewController {

    // MARK: - Views

    private lazy var backBarButton: UIBarButtonItem = {
        let barButton = UIBarButtonItem(image: #imageLiteral(resourceName: "nav_back"), style: .plain, target: self, action: #selector(backBarButtonDidTap))
        barButton.imageInsets = UIEdgeInsets(top: 0, left: -13.0, bottom: 0, right: 13.0)
        return barButton
    }()

    private lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.backgroundColor = .clear
        tableView.dataSource = self
        tableView.delegate = self
        tableView.separatorStyle = .none
        tableView.showsVerticalScrollIndicator = false
        tableView.translatesAutoresizingMaskIntoConstraints = false
        
        tableView.separatorInset = .init(top: 0, left: 16, bottom: 0, right: 16)

//        tableView.register(DepositViewCell.self)
//        tableView.register(DepositClinicsView.self)
//        tableView.register(DepositInfoStoryView.self)
//        tableView.register(DepositInfoPaymentView.self)
//        tableView.register(DepositNotReplenishView.self)

        return tableView
    }()

    // MARK: - Private properties

    private let viewModel: ProfileViewModelProtocol

    // MARK: - Initialization

    init(viewModel: ProfileViewModelProtocol) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
        self.title = "Профиль"
        self.tabBarItem.image = UIImage(systemName: "person.crop.circle")
    }

    required init?(coder: NSCoder) {
        fatalError("ProfileController ::: init(coder:) has not been implemented")
    }

    // MARK: - LifeCycle

    override func viewDidLoad() {
        super.viewDidLoad()
        setupAppearance()
    }

    // MARK: - Private functions

    private func setupAppearance() {
        view.backgroundColor = .white

        view.addSubview(tableView)
        
        setupConstraints()
    }

    private func setupConstraints() {
        NSLayoutConstraint.activate([
            tableView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 16),
            tableView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -16),
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
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


// MARK: - UITableViewDataSource

extension ProfileController: UITableViewDataSource {

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let item = viewModel.sections[indexPath.section].items[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: item.cellId, for: indexPath)
        if let cell = cell as? TableCellConfigurable {
            cell.setup(viewModel: item)
        }
        return cell
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.sections.element(at: section)?.items.count ?? 0
    }
}

// MARK: - UITableViewDelegate

extension ProfileController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //viewModel.didSelectItem(at: indexPath)
    }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 12
    }

    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        return UIView()
    }

    func numberOfSections(in tableView: UITableView) -> Int {
        return viewModel.sections.count
    }
}
