//
//  RootController.swift
//  inJob
//
//  Created by Михаил Мерешковв on 04.12.2023.
//

import UIKit

final class RootController: UITabBarController, UITabBarControllerDelegate {

    // MARK: - Properties

    private var selectedTabIndex: Int
    private(set) var tabControllers: [NavigationBar : UINavigationController] = [:]

    // MARK: - Constructor

    init(tabIndex: Int = NavigationBar.search.rawValue) {
        self.selectedTabIndex = tabIndex
        super.init(nibName: nil, bundle: nil)
        self.setupController()
    }

    @available(*, unavailable)
    required init?(coder aDecoder: NSCoder) {
        fatalError("RootController ::: init(coder:) has not been implemented")
    }

    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()

        delegate = self

        setupViewControllers()
        setupTabBarItems()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.isNavigationBarHidden = true
    }

    // MARK: - Functions
    
    private func setupController() {
        tabBar.barTintColor = UIColor.pureWhite.withAlphaComponent(0.8)
        tabBar.tintColor = .inJob
        tabBar.unselectedItemTintColor = .greyChateau
    }

    private func setupTabBarItems() {
        guard let barItems = tabBar.items else {
            return
        }

        for (index, barItem) in barItems.enumerated().lazy {
            guard let type = NavigationBar(rawValue: index) else {
                continue
            }

            barItem.image = UIImage(systemName: type.image)
            barItem.title = type.name
            barItem.tag = type.rawValue
        }

        selectedIndex = selectedTabIndex
    }

    private func setupViewControllers() {
        let searchController = UINavigationController(rootViewController: SearchBuilder.build())
        let favoritesController = UINavigationController(rootViewController: FavoritesBuilder.build())
        let addController = UINavigationController(rootViewController: AddBuilder.build())
        addController.interactivePopGestureRecognizer?.delegate = nil
        let responsesController = UINavigationController(rootViewController: ResponsesBuilder.build())
        let profileController = UINavigationController(rootViewController: ProfileBuilder.build())

        tabControllers[.search] = searchController
        tabControllers[.favorites] = favoritesController
        tabControllers[.add] = addController
        tabControllers[.responses] = responsesController
        tabControllers[.profile] = profileController

        let controllers = [
            searchController,
            favoritesController,
            addController,
            responsesController,
            profileController
        ]
        
        setViewControllers(controllers, animated: true)
    }

    // MARK: - UITabBarController Delegate


}
