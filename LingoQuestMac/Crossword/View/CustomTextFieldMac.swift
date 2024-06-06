//
//  CustomTextFieldMac.swift
//  LingoQuest_Mac
//
//  Created by MacBook Pro on 06/06/24.
//
import SwiftUI

struct CustomTextFieldMac: View {
    @Binding var text: String
    @Binding var isEditing: Bool
    var onCommit: () -> Void

    var body: some View {
        TextField("", text: $text, onEditingChanged: { editing in
            isEditing = editing
        }, onCommit: {
            onCommit()
        })
        .onChange(of: text) { newValue in
            if newValue.count > 1 {
                text = String(newValue.prefix(1)).uppercased()
            } else {
                text = newValue.uppercased()
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .multilineTextAlignment(.center)
        .background(Color.clear)
        .textFieldStyle(PlainTextFieldStyle())
    }
}
