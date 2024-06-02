//
//  ContentView.swift
//  LingoQuest
//
//  Created by MacBook Pro on 24/05/24.
//
import SwiftUI

struct ContentView: View {
    var body: some View {
        CrosswordView(levelNumber: 1,levelsViewModel: CrosswordLevelViewModel())
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

