//
//  Coordinator.swift
//  LingoQuest
//
//  Created by MacBook Pro on 07/06/24.
//
import SwiftUI
class Coordinator: NSObject, UITextFieldDelegate {
    var parent: CustomTextField

    init(parent: CustomTextField) {
        self.parent = parent
    }

    func textFieldDidEndEditing(_ textField: UITextField) {
        self.parent.isEditing = false
        self.parent.onCommit()
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        self.parent.isEditing = true
    }
    
    @objc func textFieldDidChange(_ textField: UITextField) {
        if let text = textField.text {
            // Limit the text to a single character
            if text.count > 1 {
                textField.text = String(text.prefix(1))
            }
            self.parent.text = textField.text ?? ""
        }
    }
}
