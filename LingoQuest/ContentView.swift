//
//  ContentView.swift
//  LingoQuest
//
//  Created by MacBook Pro on 06/06/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
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
                    
                    
                    
                    CustomButton(
                        action: {
                            // Goto page
                        },
                        spacing: 40,
                        rectangleSize: 30,
                        text: "Crossword",
                        size: 24,
                        backgroundRectangle: LinearGradient(
                            stops: [
                                Gradient.Stop(color: Color(red: 0.92, green: 0.97, blue: 1), location: 0.17),
                                Gradient.Stop(color: Color(red: 1, green: 0.14, blue: 0.14), location: 1.00),
                            ],
                            startPoint: UnitPoint(x: 0.49, y: 0),
                            endPoint: UnitPoint(x: 0.5, y: 1)
                        ),
                        shadow: Color(red: 0, green: 0.16, blue: 0.48).opacity(0.25),
                        stroke: Color(red: 0.81, green: 0.24, blue: 0.24),
                        paddingStart: 40,
                        paddingEnd: 80,
                        backgroundBox: LinearGradient(
                            stops: [
                                Gradient.Stop(color: .white, location: 0.27),
                                Gradient.Stop(color: Color(red: 1, green: 0, blue: 0), location: 0.59),
                            ],
                            startPoint: UnitPoint(x: 0.86, y: -3.28),
                            endPoint: UnitPoint(x: 0.86, y: 4.27)
                        ),
                        topBottomPadding: 20
                    )
                    
                    NavigationLink(destination: LevelsView(levelsViewModel: LevelViewModel())) {
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
                            
                            Text("Pronunciation")
                                .font(.title)
                                .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
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
                    
//                    CustomButton(
//                        action: {
//                            
//                        },
//                        spacing: 30,
//                        rectangleSize: 30,
//                        text: "Pronunciation",
//                        size: 24,
//                        backgroundRectangle: LinearGradient(
//                            stops: [
//                                Gradient.Stop(color: Color(red: 0.92, green: 0.97, blue: 1), location: 0.17),
//                                Gradient.Stop(color: Color(red: 0.97, green: 0.66, blue: 0.21), location: 1.00),
//                            ],
//                            startPoint: UnitPoint(x: 0.49, y: 0),
//                            endPoint: UnitPoint(x: 0.5, y: 1)
//                        ),
//                        shadow: Color(red: 0, green: 0.16, blue: 0.48).opacity(0.25),
//                        stroke: Color(red: 0.9, green: 0.62, blue: 0.21),
//                        paddingStart: 40,
//                        paddingEnd: 60,
//                        backgroundBox: LinearGradient(
//                            stops: [
//                                Gradient.Stop(color: .white, location: 0.26),
//                                Gradient.Stop(color: Color(red: 1, green: 0.59, blue: 0), location: 0.59),
//                            ],
//                            startPoint: UnitPoint(x: 0.86, y: -3.28),
//                            endPoint: UnitPoint(x: 0.86, y: 4.27)
//                        ),
//                        topBottomPadding: 20
//                    )
                    
                    
                    
                    NavigationLink(destination: LevelView(viewModel: BlankSpaceLevelViewModel())) {
                        
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
                                .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
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
                    
//                    CustomButton(
//                        action: {
//                            // Goto page
//                        },
//                        spacing: 53,
//                        rectangleSize: 30,
//                        text: "Calendar",
//                        size: 24,
//                        backgroundRectangle: LinearGradient(
//                            stops: [
//                                Gradient.Stop(color: Color(red: 0.92, green: 0.97, blue: 1), location: 0.17),
//                                Gradient.Stop(color: Color(red: 0.14, green: 0.59, blue: 1), location: 1.00),
//                            ],
//                            startPoint: UnitPoint(x: 0.49, y: 0),
//                            endPoint: UnitPoint(x: 0.5, y: 1)
//                        ),
//                        shadow: Color(red: 0, green: 0.16, blue: 0.48).opacity(0.25),
//                        stroke: Color(red: 0.24, green: 0.5, blue: 0.81),
//                        paddingStart: 40,
//                        paddingEnd: 80,
//                        backgroundBox: LinearGradient(
//                            stops: [
//                                Gradient.Stop(color: .white, location: 0.29),
//                                Gradient.Stop(color: Color(red: 0, green: 0.46, blue: 1), location: 0.56),
//                            ],
//                            startPoint: UnitPoint(x: 0.86, y: -3.28),
//                            endPoint: UnitPoint(x: 0.86, y: 4.27)
//                        ),
//                        topBottomPadding: 20
//                    )
                }
            }
            .padding(0)
        }
    }
}

#Preview {
    ContentView()
}
