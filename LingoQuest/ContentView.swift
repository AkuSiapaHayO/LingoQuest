//
//  ContentView.swift
//  LingoQuest
//
//  Created by MacBook Pro on 06/06/24.
//

import SwiftUI

struct ContentView: View {
    @State private var selectedView: SelectedView?
    
    enum SelectedView: Identifiable {
        case crosswordLevels
        case pronunciationLevels
        case blankSpaceLevels
        
        var id: Int {
            hashValue
        }
    }
    
    var body: some View {
        VStack(alignment: .center, spacing: 90) {
            VStack {
                Text("Welcome To")
                    .font(
                        Font.custom("Poppins", size: 32)
                            .weight(.semibold)
                    )
                    .multilineTextAlignment(.center)
                    .frame(width: 211, height: 43, alignment: .top)
                
                Text("LingoQuest")
                    .font(
                        Font.custom("Poppins", size: 40)
                            .weight(.bold)
                    )
                    .multilineTextAlignment(.center)
                    .frame(width: 241, height: 55, alignment: .top)
            }
            
            VStack(spacing: 15) {
                
                Button(action: {
                    selectedView = .crosswordLevels
                }) {
                    HStack(spacing: 10) {
                        Rectangle()
                            .foregroundColor(.clear)
                            .frame(width: 25, height: 25)
                            .background(
                                LinearGradient(
                                    gradient: Gradient(colors: [Color(red: 1, green: 171/255, blue: 171/255), Color(red: 1, green: 0, blue: 0)]),
                                    startPoint: .top,
                                    endPoint: .bottom
                                )
                            )
                            .cornerRadius(6)
                            .shadow(color: Color(red: 0, green: 0.16, blue: 0.48).opacity(0.25), radius: 5, x: 0, y: 0)
                            .padding(.trailing, 25)
                        
                        Text("Crossword")
                            .font(.title)
                            .fontWeight(.bold)
                            .multilineTextAlignment(.center)
                            .foregroundColor(.white)
                            .padding(.vertical, 12)
                            .padding(.trailing, 15)
                    }
                    .padding(.vertical, 10)
                    .padding(.horizontal, 45)
                    .background(
                        LinearGradient(
                            gradient: Gradient(colors: [Color.red.opacity(0.8), Color(red: 1, green: 0, blue: 0)]),
                            startPoint: .top,
                            endPoint: .bottom
                        )
                    )
                    .cornerRadius(90)
                    .shadow(color: Color(red: 0, green: 0.16, blue: 0.48).opacity(0.25), radius: 5, x: 0, y: 0)
                }
                
                Button(action: {
                    selectedView = .pronunciationLevels
                }) {
                    HStack(spacing: 10) {
                        Rectangle()
                            .foregroundColor(.clear)
                            .frame(width: 25, height: 25)
                            .background(
                                LinearGradient(
                                    gradient: Gradient(colors: [Color(red: 1, green: 233/255, blue: 172/255), Color(red: 1, green: 0.59, blue: 0)]),
                                    startPoint: .top,
                                    endPoint: .bottom
                                )
                            )
                            .cornerRadius(6)
                            .shadow(color: Color(red: 0, green: 0.16, blue: 0.48).opacity(0.25), radius: 5, x: 0, y: 0)
                            .padding(.trailing, 4)
                        
                        Text("Say The Word")
                            .font(.title)
                            .fontWeight(.bold)
                            .multilineTextAlignment(.center)
                            .foregroundColor(.white)
                            .padding(.vertical, 12)
                    }
                    .padding(.vertical, 10)
                    .padding(.horizontal, 45)
                    .background(
                        LinearGradient(
                            gradient: Gradient(colors: [Color.orange.opacity(0.8), Color(red: 1, green: 0.59, blue: 0)]),
                            startPoint: .top,
                            endPoint: .bottom
                        )
                    )
                    .cornerRadius(90)
                    .shadow(color: Color(red: 0, green: 0.16, blue: 0.48).opacity(0.25), radius: 5, x: 0, y: 0)
                }
                
                Button(action: {
                    selectedView = .blankSpaceLevels
                }) {
                    
                    HStack(spacing: 10) {
                        Rectangle()
                            .foregroundColor(.clear)
                            .frame(width: 25, height: 25)
                            .background(
                                LinearGradient(
                                    gradient: Gradient(colors: [Color(red: 184/255, green: 1, blue: 168/255), Color(red: 0.12, green: 0.7, blue: 0.03)]),
                                    startPoint: .top,
                                    endPoint: .bottom
                                )
                            )
                            .cornerRadius(6)
                            .shadow(color: Color(red: 0, green: 0.16, blue: 0.48).opacity(0.25), radius: 5, x: 0, y: 0)
                            .padding(.trailing, 20)
                        
                        Text("Blank Space")
                            .font(.title)
                            .fontWeight(.bold)
                            .multilineTextAlignment(.center)
                            .foregroundColor(.white)
                            .padding(.vertical, 12)
                    }
                    .padding(.vertical, 10)
                    .padding(.horizontal, 45)
                    .background(
                        LinearGradient(
                            gradient: Gradient(colors: [Color.green.opacity(0.8), Color(red: 0.12, green: 0.7, blue: 0.03)]),
                            startPoint: .top,
                            endPoint: .bottom
                        )
                    )
                    .cornerRadius(90)
                    .shadow(color: Color(red: 0, green: 0.16, blue: 0.48).opacity(0.25), radius: 5, x: 0, y: 0)
                    
                }
            }
        }
        .padding(15)
        .fullScreenCover(item: $selectedView) { view in
            switch view {
            case .crosswordLevels:
                NavigationView {
                    CrosswordLevelsView(viewModel: CrosswordLevelsViewModel())
                        .navigationBarItems(leading: Button(action: {
                            selectedView = nil
                        }) {
                            Image(systemName: "arrow.left")
                                .foregroundColor(.blue)
                            Text("Back")
                                .foregroundColor(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/)
                        })
                }
            case .pronunciationLevels:
                NavigationView {
                    LevelsView(levelsViewModel: LevelViewModel())
                        .navigationBarItems(leading: Button(action: {
                            selectedView = nil
                        }) {
                            Image(systemName: "arrow.left")
                                .foregroundColor(.blue)
                            Text("Back")
                                .foregroundColor(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/)
                        })
                }
            case .blankSpaceLevels:
                NavigationView {
                    LevelView(viewModel: BlankSpaceLevelViewModel())
                        .navigationBarItems(leading: Button(action: {
                            selectedView = nil
                        }) {
                            Image(systemName: "arrow.left")
                                .foregroundColor(.blue)
                            Text("Back")
                                .foregroundColor(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/)
                        })
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
