//
//  SearchController.swift
//  inJob
//
//  Created by Михаил Мерешков on 05.11.2022.
//

import UIKit

final class SearchController: UIViewController {

    // MARK: - Views
    
    private lazy var searchController: UISearchController = {
        let search = UISearchController(searchResultsController: nil)
        search.resignFirstResponder()
        search.searchResultsUpdater = self
        search.obscuresBackgroundDuringPresentation = false
        search.searchBar.placeholder = "Введите название или категорию"
        
        return search
    }()

    private lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.backgroundColor = .clear
        tableView.dataSource = self
        tableView.delegate = self
        tableView.keyboardDismissMode = .onDrag
        tableView.separatorStyle = .none
        tableView.showsVerticalScrollIndicator = false
        tableView.translatesAutoresizingMaskIntoConstraints = false

        tableView.register(SearchViewCell.self)

        return tableView
    }()

    // MARK: - Private properties

    private let viewModel: SearchViewModelProtocol
    
    private var searchIsEmpty: Bool {
        guard let text = searchController.searchBar.text else { return false }
        return text.isEmpty
    }
    
    private var isFiltering: Bool {
        return searchController.isActive && !searchIsEmpty
    }

    // MARK: - Initialization

    init(viewModel: SearchViewModelProtocol) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
        self.title = "inJob"
        self.tabBarItem.title = "Поиск"
        self.tabBarItem.image = UIImage(systemName: "magnifyingglass")
    }

    required init?(coder: NSCoder) {
        fatalError("SearchController ::: init(coder:) has not been implemented")
    }

    // MARK: - LifeCycle
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
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
        navigationItem.searchController = searchController
        definesPresentationContext = true
        view.backgroundColor = .white
        //self.searchController.searchBar.endEditing(true)

        view.addSubview(tableView)
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        view.addGestureRecognizer(tap)
        
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
    func dismissKeyboard (_ sender: UITapGestureRecognizer) {
        searchController.resignFirstResponder()
        }
}

// MARK: - UITableViewDataSource & UITableViewDelegate

extension SearchController: UITableViewDataSource, UITableViewDelegate {

    func numberOfSections(in tableView: UITableView) -> Int {
        return viewModel.items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var item: TableCellViewModelProtocol
        var cell: UITableViewCell
        
        if isFiltering {
            guard let itemSearch = viewModel.searchItems.element(at: indexPath.section) else { return UITableViewCell() }
            item = itemSearch
            cell = tableView.dequeueReusableCell(withIdentifier: itemSearch.cellId, for: indexPath)
        } else {
            guard let itemSearch = viewModel.items.element(at: indexPath.section) else { return UITableViewCell() }
            item = itemSearch
            cell = tableView.dequeueReusableCell(withIdentifier: itemSearch.cellId, for: indexPath)
            }
        
        if let cell = cell as? TableCellConfigurable {
            cell.setup(viewModel: item)
        }

        return cell
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
}

// MARK: - UISearchResultsUpdating

extension SearchController: UISearchResultsUpdating {
    
    func updateSearchResults(for searchController: UISearchController) {
        viewModel.filterContentForSearchText(searchController.searchBar.text!)
        tableView.reloadData()
    }
}


