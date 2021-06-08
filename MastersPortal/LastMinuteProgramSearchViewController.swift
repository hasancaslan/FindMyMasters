//
//  LastMinuteProgramSearchViewController.swift
//  MastersPortal
//
//  Created by HASAN CAN on 8/6/21.
//

import UIKit

class LastMinuteProgramSearchViewController: UIViewController {
    typealias DataType = ProgramDetailDataContainer

    lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.backgroundColor = .systemBackground

        tableView.register(UINib(nibName: ProgramDetailListCell.reuseIdentifier, bundle: nil), forCellReuseIdentifier: ProgramDetailListCell.reuseIdentifier)

        tableView.dataSource = self
        tableView.delegate = self

        return tableView
    }()

    let searchController = UISearchController(searchResultsController: nil)
    var filteredData: [DataType]? = []

    var isSearchBarEmpty: Bool {
        return searchController.searchBar.text?.isEmpty ?? true
    }

    init() {
        super.init(nibName: nil, bundle: nil)
        let title = "Quick & Last Minute"
        self.title = title
        navigationItem.title = title
    }

    @available(*, unavailable)
    required init?(coder _: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.configureNavigationBar()

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
        searchController.searchBar.placeholder = "IELTS Score"
        searchController.searchBar.tintColor = .white
        navigationItem.searchController = searchController
        definesPresentationContext = true
        searchController.searchBar.delegate = self
        searchController.searchBar.scopeButtonTitles = ["12 months", "24 months"]
    }

    func filterContentForSearchText(_ searchText: String, duration: String) {
        filteredData = DatabaseService.shared.getProgramsWithDurationAndIELTSScore(score: Double(searchText) ?? 6.0, duration: duration)
        tableView.reloadData()
    }
}

extension LastMinuteProgramSearchViewController: UITableViewDataSource {
    func tableView(_: UITableView, numberOfRowsInSection _: Int) -> Int {
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

    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        182.0
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: ProgramDetailListCell.reuseIdentifier, for: indexPath) as? ProgramDetailListCell,
            let filtered = filteredData
        else { fatalError() }

        let data = filtered[indexPath.row]
        cell.configure(data)
        return cell
    }
}

extension LastMinuteProgramSearchViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)

        guard let filtered = filteredData else { return }

        let data = filtered[indexPath.row]
        guard
            let detail = DatabaseService.shared.getProgramDetails(
                name: data.programName,
                university: data.universityName)
        else { return }

        let detailViewController = StoryboardScene.ProgramDetail.programDetailViewController.instantiate()
        detailViewController.model = detail
        present(detailViewController, animated: true)
    }
}

extension LastMinuteProgramSearchViewController: UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
        let searchBar = searchController.searchBar
        let duration = searchController.searchBar.scopeButtonTitles![searchBar.selectedScopeButtonIndex]
        filterContentForSearchText(searchBar.text!, duration: duration.lowercased())
    }
}

extension LastMinuteProgramSearchViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, selectedScopeButtonIndexDidChange selectedScope: Int) {
        let duration = searchController.searchBar.scopeButtonTitles![selectedScope]
        filterContentForSearchText(searchBar.text!, duration: duration.lowercased())
    }
}
