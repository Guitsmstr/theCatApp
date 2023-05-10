//
//  ViewCatsViewController.swift
//  TheCatApp
//
//  Created by Guillermo on 10/05/23.
//

import UIKit

class ViewCatsViewController: UIViewController {
    
    let headerHeight: CGFloat = 100

    @IBOutlet weak var tableView: UITableView!
    
    var viewModel: CatListViewModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.tableView.register(CatTableViewCell.nib, forCellReuseIdentifier: CatTableViewCell.identifier)
        self.tableView.contentInset = UIEdgeInsets(top: -50, left: 0, bottom: 0, right: 0)
        bind()
        viewModel?.fetchCatBreeds()
    }
    func bind() {
        viewModel?.$cats
            .receive(on: DispatchQueue.main)
            .sink(receiveValue: { [weak self] _ in
                self?.tableView.reloadData()
            })
            .store(in: &viewModel!.cancellables)
    }

    

}

extension ViewCatsViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel?.cats.count ?? 0
    }

    func tableView(_ tableView: UITableView,
                   cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CatTableViewCell.identifier, for: indexPath) as! CatTableViewCell
        cell.setUp(with: viewModel?.cats[indexPath.row])
        return cell
    }
}
