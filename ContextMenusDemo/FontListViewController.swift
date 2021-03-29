//
//  FontListViewController.swift
//  ContextMenusDemo
//
//  Created by Ben Scheirman on 3/23/21.
//

import UIKit

class FontListViewController: UITableViewController {
    var fonts: [UIFont]! {
        didSet {
            tableView.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "fontCell")
        fonts = UIFont.familyNames.compactMap { family in
            UIFont(name: family, size: 16)
        }
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        fonts.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "fontCell", for: indexPath)
        cell.textLabel?.text = fonts[indexPath.row].familyName
        cell.textLabel?.font = fonts[indexPath.row]
        return cell
    }
}
