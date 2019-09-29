//
//  UITableViewCellX.swift
//  Utilites
//
//  Created by LeonJing on 2018/10/30.
//
import UIKit

@objc public extension UITableViewCell {
    @objc var tableView: UITableView? {
        return self.parentView(of: UITableView.self)
    }
}
