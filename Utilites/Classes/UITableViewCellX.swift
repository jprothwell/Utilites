//
//  UITableViewCellX.swift
//  Utilites
//
//  Created by LeonJing on 2018/10/30.
//
import UIKit

extension UITableViewCell {
    var tableView: UITableView? {
        return self.parentView(of: UITableView.self)
    }
}
