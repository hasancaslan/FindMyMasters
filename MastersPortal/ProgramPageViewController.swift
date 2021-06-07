//
//  ProgramPageViewController.swift
//  MastersPortal
//
//  Created by HASAN CAN on 7/6/21.
//

import UIKit

class ProgramPageViewController: UIViewController {
    typealias DataType = Program

    lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.backgroundColor = .systemBackground

        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "ProgramListCell")

        tableView.dataSource = self
        tableView.delegate = self

        return tableView
    }()

    var dataSource: [DataType]? = []
    let searchController = UISearchController(searchResultsController: nil)
    var filteredData: [DataType]? = []

    var isSearchBarEmpty: Bool {
        return searchController.searchBar.text?.isEmpty ?? true
    }

    var isFiltering: Bool {
        let searchBarScopeIsFiltering = searchController.searchBar.selectedScopeButtonIndex != 0
        return searchController.isActive && (!isSearchBarEmpty || searchBarScopeIsFiltering)
    }

    var categories: [String] {
        return ["name", "university", "duration", "language"]
    }

    init(title: String, dataSource: [DataType]?) {
        super.init(nibName: nil, bundle: nil)
        self.dataSource = dataSource
        self.title = title
    }

    @available(*, unavailable)
    required init?(coder _: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = nil
        configureSearchController()
        addTableView()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationItem.hidesSearchBarWhenScrolling = false
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        navigationItem.hidesSearchBarWhenScrolling = true
        searchController.isActive = true
    }

    private func addTableView() {
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.tableFooterView = UIView()
        view.addSubview(tableView)
        view.constrainToEdges(tableView)
    }

    private func configureSearchController() {
        searchController.searchResultsUpdater = self
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.searchBar.placeholder = "Search \(title ?? "")"
        navigationItem.searchController = searchController
        definesPresentationContext = true
        searchController.searchBar.delegate = self
        searchController.searchBar.scopeButtonTitles = categories
    }

    func filterContentForSearchText(
        _ searchText: String,
        category: DataType.CodingKeys? = .name
    ) {
        filteredData = dataSource?.filter { (data: DataType) -> Bool in
            switch category {
            case .university:
                return data.university.lowercased().contains(searchText.lowercased())

            case .name:
                return data.name.lowercased().contains(searchText.lowercased())

            case .duration:
                return data.duration.lowercased().contains(searchText.lowercased())

            case .language:
                return data.language.lowercased().contains(searchText.lowercased())

            default:
                return false
            }
        }

        tableView.reloadData()
    }
}

extension ProgramPageViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if isFiltering {
            guard let filtered = filteredData, !filtered.isEmpty
            else {
                tableView.setEmptyView(
                    title: "Program not found.",
                    message: "No program found based on your query.")
                return 0
            }

            tableView.restore()
            return filtered.count
        }

        guard let data = dataSource, !data.isEmpty
        else {
            tableView.setEmptyView(
                title: "Can't load program.",
                message: "There is no Master's Program.")
            return 0
        }

        tableView.restore()
        return data.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: UITableViewCell.CellStyle.subtitle, reuseIdentifier: "ProgramListCell")
        let data: DataType?

        if isFiltering {
            data = filteredData?[indexPath.row]
        } else {
            data = dataSource?[indexPath.row]
        }
        cell.textLabel?.text = data?.name
        cell.detailTextLabel?.text = data?.university
        return cell
    }
}

extension ProgramPageViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let data: DataType?
        if isFiltering {
            data = filteredData?[indexPath.row]
        } else {
            data = dataSource?[indexPath.row]
        }

        guard let data = data,
            let detail = DatabaseService.shared.getProgramDetails(name: data.name, university: data.university)
        else { return }

        let detailViewController = StoryboardScene.ProgramDetail.programDetailViewController.instantiate()
        detailViewController.model = detail
        present(detailViewController, animated: true)
    }
}

extension ProgramPageViewController: UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
        let searchBar = searchController.searchBar
        let category = DataType.CodingKeys.allCases[searchBar.selectedScopeButtonIndex]
        filterContentForSearchText(searchBar.text!, category: category)
    }
}

extension ProgramPageViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, selectedScopeButtonIndexDidChange selectedScope: Int) {
        let category = DataType.CodingKeys.allCases[selectedScope]
        filterContentForSearchText(searchBar.text!, category: category)
    }
}
