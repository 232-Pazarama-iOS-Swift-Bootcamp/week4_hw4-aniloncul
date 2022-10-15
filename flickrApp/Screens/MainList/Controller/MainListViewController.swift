//
//  MainListViewController.swift
//  flickrApp
//
//  Created by Anıl Öncül on 11.10.2022.
//

import UIKit

final class MainListViewController: UIViewController {
    private var viewModel: MainListViewModel
    
    @IBOutlet private weak var tableView: UITableView!
    
    // MARK: -Init
    init(viewModel: MainListViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: -Lifecycle
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        
        viewModel.fetchImage()
        
        viewModel.changeHandler = {change in
            switch change {
            case .didFetchImages:
                self.tableView.reloadData()
            case .didErrorOccurred(let error):
                print(error.localizedDescription)
                
            }
        }
        
    }
    
}

// MARK: - UITableViewDelegate
extension MainListViewController: UITableViewDelegate{
    
}
// MARK: - UITableViewDelegate
extension MainListViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfRows
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        //cell.textLabel?.text = viewModel.imageForIndexPath(indexPath)?.title
        return cell
    }
    
}


