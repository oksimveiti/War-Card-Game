//
//  ContentView.swift
//  war Card Game UI
//
//  Created by Semih on 29.05.2022.
//

import SwiftUI

struct ContentView: View {
    
    @State private var playerCard = "card5"
    @State private var cpuCard = "card9"
    @State private var playerScore:Int = 0
    @State private var cpuScore:Int = 0
    @State private var annoncement:String = ""
    
    
    var body: some View {
        
        ZStack {
            Image("background")
                .ignoresSafeArea()
            

            
            VStack {
                Spacer()
                Image("logo")
                Spacer()
                HStack {
                    Spacer()
                    Image(playerCard)
                    
                    Spacer()
                    
                    Image(cpuCard)
                    Spacer()
                }

                Spacer()
                Button(action: {
                    
                    // Generate a random number between 2 and 14
                    let playerRand = Int.random(in: 2...14)
                    let cpuRand = Int.random(in: 2...14)
                    
                    // Update the cards
                    playerCard = "card" + String(playerRand)
                    cpuCard = "card" + String(cpuRand)
                    
                    // Update the score and annoncement
                    if playerRand > cpuRand {
                        playerScore += 1
                        annoncement = "Player got 1 point"
                    } else if cpuRand > playerRand {
                        cpuScore += 1
                        annoncement = "CPU got 1 point"
                    } else if cpuRand == playerRand {
                        annoncement = "Tie"
                    }
                    


                    
                }, label: {
                    Image("dealbutton")
                })
                Text(annoncement)
                    .foregroundColor(.white)
                Spacer()
                
                HStack{
                    Spacer()
                    VStack{
                        Text("Player")
                            .font(.headline)
                            .padding(.bottom, 5)
                        Text(String(playerScore))
                            .font(.largeTitle)
                    }
                    Spacer()
                    VStack{
                        Text("CPU")
                            .font(.headline)
                            .multilineTextAlignment(.leading)
                            .padding(.bottom, 5)
                        Text(String(cpuScore))
                            .font(.largeTitle)
                    }
                    Spacer()
                }
                    .foregroundColor(.white)
                
                
                    
                Spacer()
            }
            
        }

    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
