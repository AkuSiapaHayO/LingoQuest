//
//  CustomTextFieldMac.swift
//  LingoQuest_Mac
//
//  Created by MacBook Pro on 06/06/24.
//
import SwiftUI
import AppKit

struct CustomTextFieldMac: NSViewRepresentable {
    class Coordinator: NSObject, NSTextFieldDelegate {
        var parent: CustomTextFieldMac

        init(parent: CustomTextFieldMac) {
            self.parent = parent
        }

        func controlTextDidEndEditing(_ obj: Notification) {
            self.parent.isEditing = false
            self.parent.onCommit()
        }

        func controlTextDidBeginEditing(_ obj: Notification) {
            self.parent.isEditing = true
        }

        @objc func textFieldDidChange(_ textField: NSTextField) {
            let text = textField.stringValue
            // Limit the text to a single character
            if text.count > 1 {
                textField.stringValue = String(text.prefix(1))
            }
            self.parent.text = textField.stringValue
        }
    }

    @Binding var text: String
    @Binding var isEditing: Bool
    var onCommit: () -> Void

    func makeNSView(context: Context) -> NSTextField {
        let textField = NSTextField(frame: .zero)
        textField.delegate = context.coordinator
        textField.target = context.coordinator
        textField.action = #selector(context.coordinator.textFieldDidChange(_:))
        textField.font = NSFont.systemFont(ofSize: 20)
        textField.alignment = .center
        textField.isBordered = false
        textField.backgroundColor = .clear
        textField.wantsLayer = true
        return textField
    }

    func updateNSView(_ nsView: NSTextField, context: Context) {
        nsView.stringValue = text
        if isEditing {
            nsView.becomeFirstResponder()
        } else {
            nsView.resignFirstResponder()
        }
    }

    func makeCoordinator() -> Coordinator {
        Coordinator(parent: self)
    }
}
