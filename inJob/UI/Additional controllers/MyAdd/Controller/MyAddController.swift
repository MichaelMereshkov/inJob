//
//  MyAddController.swift
//  inJob
//
//  Created by Михаил Мерешков on 10.11.2022.
//

import UIKit

final class MyAddController: UIViewController {

    // MARK: - Views

    private lazy var backBarButton: UIBarButtonItem = {
        let barButton = UIBarButtonItem(image: UIImage(systemName: "chevron.left"), style: .plain, target: self, action: #selector(backBarButtonDidTap))
        barButton.tintColor = .darkGray
        return barButton
    }()

    private lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.backgroundColor = .clear
        tableView.dataSource = self
        tableView.separatorStyle = .none
        tableView.showsVerticalScrollIndicator = false
        tableView.translatesAutoresizingMaskIntoConstraints = false
        
        tableView.register(SearchViewCell.self)

        return tableView
    }()

    // MARK: - Private properties

    private let viewModel: MyAddViewModelProtocol

    // MARK: - Initialization

    init(viewModel: MyAddViewModelProtocol) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("MyAddController ::: init(coder:) has not been implemented")
    }

    // MARK: - LifeCycle
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        viewModel.saveItems()
        tableView.reloadData()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setupAppearance()
    }

    // MARK: - Private functions

    private func setupAppearance() {
        view.backgroundColor = .white
        navigationItem.title = "Мои объявления"
        navigationItem.leftBarButtonItem = backBarButton
        navigationItem.leftBarButtonItem?.title = ""
        navigationItem.leftBarButtonItem?.tintColor = .darkText

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
        navigationController?.popViewController(animated: true)
    }
}

// MARK: - UITableViewDataSource & UITableViewDelegate

extension MyAddController: UITableViewDataSource, UITableViewDelegate {

    func numberOfSections(in tableView: UITableView) -> Int {
        return viewModel.items.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let item = viewModel.items.element(at: indexPath.section) else { return UITableViewCell() }

        let cell = tableView.dequeueReusableCell(withIdentifier: item.cellId, for: indexPath)
        if let cell = cell as? TableCellConfigurable {
            cell.setup(viewModel: item)
        }

        return cell
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
}
