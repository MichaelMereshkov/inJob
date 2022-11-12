//
//  FavoritesController.swift
//  inJob
//
//  Created by Михаил Мерешков on 05.11.2022.
//

import UIKit

final class FavoritesController: UIViewController {

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

        tableView.register(SearchViewCell.self)

        return tableView
    }()

    // MARK: - Private properties

    private let viewModel: FavoritesViewModelProtocol

    // MARK: - Initialization
    
    init(viewModel: FavoritesViewModelProtocol) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
        self.title = "Избранные"
        self.tabBarItem.image = UIImage(systemName: "heart.fill")
    }

    required init?(coder: NSCoder) {
        fatalError("FavoritesController ::: init(coder:) has not been implemented")
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

// MARK: - UITableViewDataSource & UITableViewDelegate

extension FavoritesController: UITableViewDataSource, UITableViewDelegate {
    
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


