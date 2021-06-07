//
//  ExploreViewController.swift
//  MastersPortal
//
//  Created by HASAN CAN on 9/5/21.
//

import Parchment
import UIKit

class ExploreViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.configureNavigationBar()
        navigationItem.title = L10n.Explore.Navigation.title

        let countriesViewModel = SimpleListAdapterDataSource(CountriesViewModel().sections)
        let featuredViewModel = SimpleListAdapterDataSource(FeaturedViewModel().sections)
        let programsViewModel = DatabaseService.shared.getAllPrograms()
        let viewControllers = [
            ExplorePageViewController(title: "Featured", dataSource: featuredViewModel),
            ExplorePageViewController(title: "Countries", dataSource: countriesViewModel),
            UINavigationController(rootViewController: ProgramPageViewController(title: "Programs", dataSource: programsViewModel))
        ]

        let pagingViewController = PagingViewController(viewControllers: viewControllers)
        pagingViewController.menuItemSize = .sizeToFit(minWidth: 44, height: 55)
        pagingViewController.indicatorColor = Asset.Colors.primaryColor.color
        pagingViewController.selectedTextColor = Asset.Colors.primaryColor.color
        // Make sure you add the PagingViewController as a child view
        // controller and constrain it to the edges of the view.
        addChild(pagingViewController)
        view.addSubview(pagingViewController.view)
        view.constrainToEdges(pagingViewController.view)
        pagingViewController.didMove(toParent: self)
    }
}
