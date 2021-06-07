//
//  MultiProgramSearchViewController.swift
//  MastersPortal
//
//  Created by HASAN CAN on 8/6/21.
//

import UIKit

class MultiProgramSearchViewController: UIViewController {
    typealias DataType = CheapProgramDataContainer

    lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.backgroundColor = .systemBackground

        tableView.register(UINib(nibName: CheapProgramCell.reuseIdentifier, bundle: nil), forCellReuseIdentifier: CheapProgramCell.reuseIdentifier)

        tableView.dataSource = self
        tableView.delegate = self

        return tableView
    }()

    let searchController = UISearchController(searchResultsController: nil)
    var filteredData: [String: [DataType]]? = [:]

    var isSearchBarEmpty: Bool {
        return searchController.searchBar.text?.isEmpty ?? true
    }

    init() {
        super.init(nibName: nil, bundle: nil)
        let title = "Cheapest in Country"
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
        searchController.searchBar.placeholder = "Search Field"
        searchController.searchBar.tintColor = .white
        navigationItem.searchController = searchController
        definesPresentationContext = true
        searchController.searchBar.delegate = self
    }

    func filterContentForSearchText(_ searchText: String) {
        guard searchText.count > 1,
              let result = DatabaseService.shared.getCheapestUniversitiesInField(field: searchText)
        else { return }

        filteredData = Dictionary(grouping: result, by: { $0.countryName })
        tableView.reloadData()
    }
}

extension MultiProgramSearchViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
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

    func tableView(_: UITableView, titleForHeaderInSection section: Int) -> String? {
        guard let filtered = filteredData else { return nil }
        return Array(filtered)[section].key
    }

    func tableView(_: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let filtered = filteredData else { return 0 }
        return Array(filtered)[section].value.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: CheapProgramCell.reuseIdentifier, for: indexPath) as? CheapProgramCell,
              let filtered = filteredData
        else { fatalError() }

        let data = Array(filtered)[indexPath.section].value[indexPath.row]
        cell.configure(data)
        return cell
    }
}

extension MultiProgramSearchViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)

        guard let filtered = filteredData else { return }

        let data = Array(filtered)[indexPath.section].value[indexPath.row]
        guard let detail = DatabaseService.shared.getProgramDetails(
            name: data.programName,
            university: data.universityName)
        else { return }

        let detailViewController = StoryboardScene.ProgramDetail.programDetailViewController.instantiate()
        detailViewController.model = detail
        present(detailViewController, animated: true)
    }
}

extension MultiProgramSearchViewController: UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
        let searchBar = searchController.searchBar
        filterContentForSearchText(searchBar.text!)
    }
}

extension MultiProgramSearchViewController: UISearchBarDelegate {}
