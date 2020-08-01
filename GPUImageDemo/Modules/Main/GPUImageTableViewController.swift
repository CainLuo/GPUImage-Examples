//
//  GPUImageTableViewController.swift
//  GPUImageDemo
//
//  Created by CainLuo on 2020/8/1.
//  Copyright © 2020 CainLuo. All rights reserved.
//

import UIKit

class GPUImageTableViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

// MARK: UITableViewDataSource
extension GPUImageTableViewController {
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return filterOperations.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "UITableViewCell", for: indexPath)
        let filterInList: FilterOperationInterface = filterOperations[indexPath.row]
        cell.textLabel?.text = filterInList.listName
        return cell
    }
}

extension GPUImageTableViewController {
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let filter = filterOperations[indexPath.row]

        let alertController = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
        alertController.addAction(UIAlertAction(title: "Image", style: .default, handler: { _ in
            let vc = ImageOperationViewController.configureWith()
            self.navigationController?.pushViewController(vc, animated: true)
        }))

        alertController.addAction(UIAlertAction(title: "Video", style: .default, handler: { _ in
            let vc = VideoOperationViewController.configureWith()
            self.navigationController?.pushViewController(vc, animated: true)
        }))

        alertController.addAction(UIAlertAction(title: "Camera", style: .default, handler: { _ in
            let vc = CameraOperationController.configureWith()
            vc.filterOperation = filter
            self.navigationController?.pushViewController(vc, animated: true)
        }))

        alertController.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: { _ in }))
        
        present(alertController, animated: true, completion: nil)
    }
}

