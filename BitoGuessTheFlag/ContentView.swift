//
//  ContentView.swift
//  BitoGuessTheFlag
//
//  Created by Alberto Alegre Bravo on 30/11/21.
//

import SwiftUI

struct ContentView: View {
    
    @State var showingScore = false
    @State var scoreTitle = ""
    
    @State private var countries = ["Estonia", "France", "Germany", "Ireland", "Italy", "Nigeria", "Poland", "Russia", "Spain", "UK", "US"].shuffled()
    
    @State private var correctaAnswer = Int.random(in: 0...2)
    
    @State private var score = 0
    
    
    var body: some View {
        ZStack{
            Color.mint
                .ignoresSafeArea()
            VStack{
                Spacer()
                Text("GUESS THE FLAG")
                    .font(.largeTitle.bold())
                    .foregroundColor(.white)
                Spacer()
                VStack (spacing: 20){
                    VStack {
                        Text("Tap the flag of")
                            .foregroundColor(.white)
                            .font(.subheadline.weight(.heavy))
                        Text(countries[correctaAnswer])
                            .foregroundColor(.white)
                            .font(.largeTitle.weight(.semibold))
                    }
                    
                    
                    ForEach(0..<3) { number in
                        Button {
                            flagTapped(number)
                        } label: {
                            Image(countries[number])
                                .renderingMode(.original)
                                .clipShape(Capsule())
                                .shadow(radius: 5)
                        }
                    }
                }
                Spacer()
                VStack{
                    Text("Your Score Is: \(score)")
                        .font(.title)
                        .foregroundColor(.white)
                }
                Spacer()
            }
        }
        .alert(scoreTitle, isPresented: $showingScore) {
            Button("Continue", action: askQuestion)
        } message: {
            Text("Your Score is \(score)")
        }
    }
    
    func flagTapped(_ number: Int)  {
        if number == correctaAnswer {
            scoreTitle = "Correct"
            score += 1
        } else {
            scoreTitle = "Wrong"
            score -= 1
        }
        
        showingScore = true
    }
    
    func askQuestion() {
        countries.shuffle()
        correctaAnswer = Int.random(in: 0...2)
    }
    
    
}
    
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

