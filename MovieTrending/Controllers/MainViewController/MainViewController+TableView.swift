//
//  MainViewController+TableView.swift
//  MovieTrending
//
//  Created by Ryszard Schossler on 28/03/2024.
//


import UIKit

extension MainViewController: UITableViewDataSource, UITableViewDelegate {
    
    func setupTableView() {
        self.tableView.delegate = self
        self.tableView.dataSource = self
        
        self.tableView.backgroundColor = .clear
        self.registerCells()
    }
    
    func registerCells() {
        tableView.register(MainMovieTableViewCell.register(), forCellReuseIdentifier: MainMovieTableViewCell.identifier)
    }
    
    func reloadTableView() {
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return viewModel.numberOfSections()
    }
    
    /// Number of rows
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfRows(in: section)
    }
    
    
    ///UI for single cell
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: MainMovieTableViewCell.identifier, for: indexPath) as? MainMovieTableViewCell else {
            return UITableViewCell()
        }
        let movieData = cellDataSourc[indexPath.row]
        cell.setupCell(viewModel: movieData)
        cell.selectionStyle = .none
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let movieId = cellDataSourc[indexPath.row].id
        self.openDetail(movieId: movieId)
    }
}
