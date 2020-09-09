//
//  ContentView.swift
//  SlotDemo
//
//  Created by Axel Tringa on 2020-09-07.
//
// Tutorial https://www.youtube.com/watch?v=VlhcNR7Qrno
// Modified by Axel Tringa

// image slot https://iconscout.com/icons/slot
// image apple https://iconscout.com/icon/apple-fruit-food-vitamin-healthy
// image cherry https://iconscout.com/icon/cherry-36
// image crown https://iconscout.com/icon/crown-castle-clothing-king-queen

import SwiftUI

struct ContentView: View {
    
    private var symbols = ["apple","cherry","crown"]
    @State private var numbers = [0, 1, 2, 0, 1, 2, 0, 1]
    @State private var credits = 1000
    @State private var betAmount = 50

    
    
    var body: some View {
        
        ZStack{
            // Background
            Rectangle()
                .foregroundColor(Color(red: 106/255, green: 90/255, blue: 205/255))
                .edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
            Rectangle()
                .foregroundColor(Color(red: 150/255, green: 90/255, blue: 205/255))
                .rotationEffect(Angle(degrees: 45))
                .edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
            
            VStack{
                
                Spacer()
                
                //Title
                HStack{
                    
                    Image(systemName: "bitcoinsign.square.fill")
                        .foregroundColor(.yellow)
                        .cornerRadius(20)
                    
                    Text("SLOT DEMO")
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                    
                    Image(systemName: "bitcoinsign.square.fill")
                        .foregroundColor(.yellow)
                        .cornerRadius(20)
                    
                    
                    
                }.scaleEffect(2)
                
                Spacer()
                
                //Credit
                Text("Credits : " + String(credits))
                    .foregroundColor(.black)
                    .padding(.all, 10)
                    .background(Color.white.opacity(0.5))
                    .cornerRadius(20)
                
                Spacer()
                
                // Card
                VStack{
                    HStack{
                        Spacer()
                        
                        Image(symbols[numbers[0]])
                            .resizable()
                            .aspectRatio(1,contentMode: .fit)
                            .background(Color.white.opacity(0.5))
                            .cornerRadius(20)
                        Image(symbols[numbers[1]])
                            .resizable()
                            .aspectRatio(1,contentMode: .fit)
                            .background(Color.white.opacity(0.5))
                            .cornerRadius(20)
                        Image(symbols[numbers[2]])
                            .resizable()
                            .aspectRatio(1,contentMode: .fit)
                            .background(Color.white.opacity(0.5))
                            .cornerRadius(20)
                        Image(symbols[numbers[3]])
                            .resizable()
                            .aspectRatio(1,contentMode: .fit)
                            .background(Color.white.opacity(0.5))
                            .cornerRadius(20)
                        
                        Spacer()
                        
                    }.padding(.bottom)
                    
                    HStack{
                        Spacer()
                        
                        Image(symbols[numbers[4]])
                            .resizable()
                            .aspectRatio(1,contentMode: .fit)
                            .background(Color.white.opacity(0.5))
                            .cornerRadius(20)
                        Image(symbols[numbers[5]])
                            .resizable()
                            .aspectRatio(1,contentMode: .fit)
                            .background(Color.white.opacity(0.5))
                            .cornerRadius(20)
                        Image(symbols[numbers[6]])
                            .resizable()
                            .aspectRatio(1,contentMode: .fit)
                            .background(Color.white.opacity(0.5))
                            .cornerRadius(20)
                        Image(symbols[numbers[7]])
                            .resizable()
                            .aspectRatio(1,contentMode: .fit)
                            .background(Color.white.opacity(0.5))
                            .cornerRadius(20)
                        
                        Spacer()
                        
                    }
                }
                
                Spacer()
                
                
                VStack{
                    Button(action:
                            {
                                if self.credits <= 0 {
                                    self.credits = 1000
                                } else {
                                    // Change the images
                                    
                                    for i in 0 ... 7 {
                                        self.numbers[i] = Int.random(in: 0...self.symbols.count - 1)
                                    }
                                    
                                    // check winnings
                                    if self.numbers[0] == self.numbers[1] &&
                                        self.numbers[1] == self.numbers[2] &&
                                        self.numbers[2] == self.numbers[3]  &&
                                        self.numbers[4] == self.numbers[5] &&
                                        self.numbers[5] == self.numbers[6] &&
                                        self.numbers[6] == self.numbers[7]{
                                        // Extra Won
                                        self.credits += self.betAmount * 100
                                    } else if self.numbers[0] == self.numbers[1] &&
                                                self.numbers[1] == self.numbers[2] &&
                                                self.numbers[2] == self.numbers[3]  ||
                                                self.numbers[4] == self.numbers[5] &&
                                                self.numbers[5] == self.numbers[6] &&
                                                self.numbers[6] == self.numbers[7]{
                                        // Classic won
                                        self.credits += self.betAmount * 10
                                    } else {
                                        // loose
                                        self.credits -= self.betAmount
                                    }
                                }
                            }){
                        
                        Text("Spin")
                            .bold()
                            .foregroundColor(.white)
                            .padding(.all, 10)
                            .padding([.leading , .trailing], 30)
                            .background(Color.pink)
                            .cornerRadius(20)
                        
                    }.padding(.bottom)
                    
                    HStack{
                        
                        // Button
                        
                        Button(action: {
                            
                            self.betAmount = 50
                        }){
                            Text("BET 50")
                                .bold()
                                .foregroundColor(.white)
                                .padding(.all, 10)
                                .padding([.leading , .trailing], 20)
                                .background(Color.pink)
                                .cornerRadius(20)
                        }
                        Button(action: {
                            
                            self.betAmount = 100
                        }){
                            Text("BET 100")
                                .bold()
                                .foregroundColor(.white)
                                .padding(.all, 10)
                                .padding([.leading , .trailing], 20)
                                .background(Color.pink)
                                .cornerRadius(20)
                        }
                    }
                    
                }
                Spacer()
                
                Button(action: {
                    UIApplication.shared.open(URL(string: "http://github.com/TringaAxel")!)
                }) {
                    Image(systemName: "person.fill")
                        .foregroundColor(Color.black)
                    Text("Developed by Axel Tringa")
                        .font(.headline)
                        .foregroundColor(Color(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)))
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
