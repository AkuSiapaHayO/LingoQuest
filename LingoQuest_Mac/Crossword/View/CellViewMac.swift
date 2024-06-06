//
//  CellViewMac.swift
//  LingoQuest_Mac
//
//  Created by MacBook Pro on 06/06/24.
//
import SwiftUI

struct CellViewMac: View {
    @ObservedObject var cell: CrosswordCell
    var isSelected: Bool
    var onTap: () -> Void
    var onCommit: () -> Void
    var showTopBorder: Bool
    var showLeadingBorder: Bool
    var showBottomBorder: Bool
    var showTrailingBorder: Bool

    @State private var isEditing = false
    @FocusState private var isFocused: Bool

    var body: some View {
        GeometryReader { geometry in
            ZStack(alignment: .topLeading) {
                Rectangle()
                    .fill(self.cell.isEditable ? Color.white : Color.clear)
                    .border(self.isSelected ? Color.blue : Color.clear, width: 2)
                    .frame(width: geometry.size.width, height: geometry.size.height)

                if self.cell.isEditable {
                    CustomTextFieldMac(text: self.$cell.letter, isEditing: self.$isEditing, onCommit: {
                        self.onCommit()
                    })
                    .frame(width: geometry.size.width, height: geometry.size.height)
                    .background(Color.white)
                    .border(Color.blue, width: isFocused ? 2 : 0) // Border for text field focus
                    .focused($isFocused)
                    .onTapGesture {
                        self.isFocused = true
                        self.onTap()
                    }
                } else if !self.cell.letter.isEmpty {
                    Text(self.cell.letter)
                        .font(Font.system(size: 20))
                        .frame(width: geometry.size.width, height: geometry.size.height)
                        .background(Color.clear)
                }

                if let label = self.cell.label {
                    Text(label)
                        .font(.caption)
                        .padding(2)
                        .background(Color.white)
                        .cornerRadius(2)
                        .offset(x: 2, y: 2)
                }

                if showTopBorder {
                    Rectangle()
                        .frame(height: 1)
                        .foregroundColor(.black)
                        .offset(y: -0.5)
                }
                if showLeadingBorder {
                    Rectangle()
                        .frame(width: 1)
                        .foregroundColor(.black)
                        .offset(x: -0.5)
                }
                if showBottomBorder {
                    Rectangle()
                        .frame(height: 1)
                        .foregroundColor(.black)
                        .offset(y: geometry.size.height - 0.5)
                }
                if showTrailingBorder {
                    Rectangle()
                        .frame(width: 1)
                        .foregroundColor(.black)
                        .offset(x: geometry.size.width - 0.5)
                }
            }
            .onTapGesture {
                self.isFocused = true
                self.onTap()
            }
        }
        .aspectRatio(1, contentMode: .fit)
        .frame(minWidth: 40, minHeight: 40)
    }
}
