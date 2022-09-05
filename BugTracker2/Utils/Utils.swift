//
//  Utils.swift
//  BugTracker2
//
//  Created by Felicitas Figueroa Fagalde on 05.09.22.
//

import Foundation
import UIKit

func successAlert( title: String, message: String, actionTitle: String, vc: UIViewController) {
    let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
    alertController.addAction(UIAlertAction(title: actionTitle, style: .default, handler:{_ in
      vc.navigationController?.popViewController(animated: true)
    }))
    vc.present(alertController, animated: true, completion: nil)
}

func errorAlert( title: String, message: String, actionTitle: String, vc: UIViewController) {
    var alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertController.Style.alert)
    alert.addAction(UIAlertAction(title: actionTitle, style: UIAlertAction.Style.default, handler: nil))
    vc.present(alert, animated: true, completion: nil)
}
