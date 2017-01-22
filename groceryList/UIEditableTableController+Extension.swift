//
//  UIEditableTableController+Extension.swift
//  groceryList
//
//  Created by Profit, Holden on 1/22/17.
//  Copyright © 2017 Profit, Holden. All rights reserved.
//

import Foundation
import UIKit

enum TableState {
    case editing
    case normal
    
    var value: (isEditing: Bool, title: String) {
        switch self {
        case.normal:
            return (false, "Edit")
        case.editing:
            return (true, "Done")
        }
    }
    
    var opposite: TableState {
        switch self {
        case.normal:
            return .editing
        case.editing:
            return .normal
        }
    }
}

// MARK: - EditableTableController protocol

protocol EditableTableController {
    var state: TableState { get set }
    var tableView: UITableView? { get set }
    func edit(sender: UIBarButtonItem)
}

// MARK: - UIEditableTableController class

open class UIEditableTableController: UIViewController, EditableTableController {
    var state: TableState = .normal
    @IBOutlet var tableView: UITableView?
    
    @IBAction func edit(sender: UIBarButtonItem) {
        state = state.opposite
        tableView?.setEditing(state.value.isEditing, animated: UIView.areAnimationsEnabled)
        sender.title = state.value.title
    }
}
