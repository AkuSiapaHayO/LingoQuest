//
//  CrosswordViewMac.swift
//  LingoQuest_Mac
//
//  Created by MacBook Pro on 06/06/24.
//
import SwiftUI

struct CrosswordViewMac: View {
    @StateObject private var viewModel: CrosswordViewModel
    @ObservedObject var levelsViewModel: CrosswordLevelsViewModel
    @State private var showCompletionAlert = false
    
    init(levelNumber: Int, levelsViewModel: CrosswordLevelsViewModel) {
        _viewModel = StateObject(wrappedValue: CrosswordViewModel(levelNumber: levelNumber))
        self.levelsViewModel = levelsViewModel
    }
    
    var body: some View {
        VStack {
            Text("Level \(viewModel.currentLevel)")
                .font(.largeTitle)
                .bold()
                .padding(.top, 50)
            
            VStack(spacing: 0) {
                ForEach(viewModel.crosswordGrid.indices, id: \.self) { rowIndex in
                    HStack(spacing: 0) {
                        ForEach(viewModel.crosswordGrid[rowIndex].indices, id: \.self) { colIndex in
                            let cell = viewModel.crosswordGrid[rowIndex][colIndex]
                            CellViewMac(
                                cell: cell,
                                isSelected: viewModel.selectedCell?.id == cell.id,
                                onTap: {
                                    viewModel.selectedCell = cell
                                },
                                onCommit: {
                                    viewModel.checkForWin()
                                },
                                showTopBorder: showBorder(row: rowIndex, col: colIndex, direction: .top),
                                showLeadingBorder: showBorder(row: rowIndex, col: colIndex, direction: .leading),
                                showBottomBorder: showBorder(row: rowIndex, col: colIndex, direction: .bottom),
                                showTrailingBorder: showBorder(row: rowIndex, col: colIndex, direction: .trailing)
                            )
                        }
                    }
                }
            }
            .padding()
            .alert(isPresented: $showCompletionAlert) {
                Alert(
                    title: Text("Congratulations!"),
                    message: Text("You completed the crossword for level \(viewModel.currentLevel)!"),
                    dismissButton: .default(Text("OK")) {
                        levelsViewModel.unlockNextLevel(after: viewModel.currentLevel)
                    }
                )
            }
            
            List(viewModel.questions) { question in
                VStack(alignment: .leading) {
                    Text(question.direction)
                        .font(.headline)
                    Text(question.question)
                        .font(.body)
                }
                .padding()
                .background(Color.white.opacity(0.8))
                .cornerRadius(10)
            }
            .padding()
            .background(Color.white.opacity(0.2))
            .cornerRadius(10)
            .padding()
        }
        .background(
            LinearGradient(gradient: Gradient(colors: [Color.blue.opacity(0.6), Color.purple.opacity(0.6)]), startPoint: .top, endPoint: .bottom)
                .edgesIgnoringSafeArea(.all)
        )
        .onReceive(viewModel.$showingAlert) { showingAlert in
            if showingAlert {
                showCompletionAlert = true
            }
        }
    }
    
    private func showBorder(row: Int, col: Int, direction: Edge) -> Bool {
        switch direction {
        case .top:
            return row > 0 && viewModel.crosswordGrid[row - 1][col].isEditable
        case .leading:
            return col > 0 && viewModel.crosswordGrid[row][col - 1].isEditable
        case .bottom:
            return row < viewModel.crosswordGrid.count - 1 && viewModel.crosswordGrid[row + 1][col].isEditable
        case .trailing:
            return col < viewModel.crosswordGrid[row].count - 1 && viewModel.crosswordGrid[row][col + 1].isEditable
        }
    }
}


struct CrosswordViewMac_Previews: PreviewProvider {
    static var previews: some View {
        let levelsViewModel = CrosswordLevelsViewModel()
        CrosswordViewMac(levelNumber: 1, levelsViewModel: levelsViewModel)
    }
}
