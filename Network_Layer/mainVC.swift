//
//  mainVC.swift
//  Network_Layer
//
//  Created by Егор Уваров on 27.03.2021.
//

import UIKit

class mainVC: UIViewController {
    
    private var tableView = UITableView()
    private var models: [String]?{
        didSet{
            tableView.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        view.addSubview(tableView)
        
        grabData{
            [weak self] model in
            self?.models = model?.map({ $0.firstName + " " +  $0.lastName })
            
        }
        tableView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
        ])
        
        tableView.register(customCell.self, forCellReuseIdentifier: customCell.reuseId)
        tableView.dataSource = self
        tableView.delegate = self
        
    }
}

extension mainVC: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        models?.count ?? 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: customCell.reuseId, for: indexPath) as? customCell else {
            return customCell()
        }
        cell.name = models?[indexPath.row] ?? "null"
        return cell
    }
    
    
}

extension mainVC: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
}

// network layer
extension mainVC {
    func grabData(onGrabbed: @escaping ((Model?) -> ())) {
        if let path = Bundle.main.path(forResource: "MOCK_DATA", ofType: "json") {
            do {
                let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
                guard let model = try? JSONDecoder().decode(Model.self, from: data) else { return }
                onGrabbed(model)
              } catch {
                   return
              }
        }
        return
    }
}
