//
//  DecideViewController.swift
//  MastersPortal
//
//  Created by HASAN CAN on 9/5/21.
//

import Parchment
import UIKit

class DecideViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.configureNavigationBar()
        navigationItem.title = L10n.Decide.Navigation.title

        let viewControllers = [
            ContentViewController(index: 0),
            ContentViewController(index: 1),
            ContentViewController(index: 2),
            ContentViewController(index: 3),
        ]

        let pagingViewController = PagingViewController(viewControllers: viewControllers)

        // Make sure you add the PagingViewController as a child view
        // controller and constrain it to the edges of the view.
        addChild(pagingViewController)
        view.addSubview(pagingViewController.view)
        view.constrainToEdges(pagingViewController.view)
        pagingViewController.didMove(toParent: self)
    }
}

final class ContentViewController: UIViewController {
    convenience init(index: Int) {
        self.init(title: "View \(index)", content: "\(index)")
    }

    convenience init(title: String) {
        self.init(title: title, content: title)
    }

    init(title: String, content: String) {
        super.init(nibName: nil, bundle: nil)
        self.title = title

        let label = UILabel(frame: .zero)
        label.font = UIFont.systemFont(ofSize: 50, weight: UIFont.Weight.thin)
        label.textColor = UIColor(red: 95 / 255, green: 102 / 255, blue: 108 / 255, alpha: 1)
        label.textAlignment = .center
        label.text = content
        label.sizeToFit()

        view.addSubview(label)
        view.constrainToEdges(label)
        view.backgroundColor = .white
    }

    @available(*, unavailable)
    required init?(coder _: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
