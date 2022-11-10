//
//  SearchController.swift
//  inJob
//
//  Created by Михаил Мерешков on 05.11.2022.
//

import UIKit

final class SearchController: UIViewController {

    // MARK: - Views

    private lazy var imageLog: UIImageView = {
        let image = UIImageView()
        image.image = #imageLiteral(resourceName: "log_search")
        image.contentMode = .scaleAspectFill
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()

    private lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.backgroundColor = .clear
        tableView.dataSource = self
        tableView.delegate = self
        tableView.separatorStyle = .none
        tableView.showsVerticalScrollIndicator = false
        tableView.translatesAutoresizingMaskIntoConstraints = false
        
        //tableView.separatorInset = .init(top: 0, left: 16, bottom: 0, right: 16)

        tableView.register(SearchViewCell.self)
//        tableView.register(DepositClinicsView.self)
//        tableView.register(DepositInfoStoryView.self)
//        tableView.register(DepositInfoPaymentView.self)
//        tableView.register(DepositNotReplenishView.self)

        return tableView
    }()

    // MARK: - Private properties

    private let viewModel: SearchViewModelProtocol

    // MARK: - Initialization

    init(viewModel: SearchViewModelProtocol) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
        self.title = "Поиск"
        self.tabBarItem.image = UIImage(systemName: "magnifyingglass")
    }

    required init?(coder: NSCoder) {
        fatalError("SearchController ::: init(coder:) has not been implemented")
    }

    // MARK: - LifeCycle
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        //viewModel.fetch()
        viewModel.saveItems()
        tableView.reloadData()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        //viewModel.saveItems()
        setupAppearance()
    }

    // MARK: - Private functions

    private func setupAppearance() {
        view.backgroundColor = .white

        view.addSubview(imageLog)
        view.addSubview(tableView)
        
        setupConstraints()
    }

    private func setupConstraints() {
        NSLayoutConstraint.activate([
            imageLog.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            imageLog.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            imageLog.widthAnchor.constraint(equalToConstant: 70),
            imageLog.heightAnchor.constraint(equalToConstant: 30),
            
            tableView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 16),
            tableView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -16),
            tableView.topAnchor.constraint(equalTo: imageLog.bottomAnchor),
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

extension SearchController: UITableViewDataSource {

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

extension SearchController: UITableViewDelegate {
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

