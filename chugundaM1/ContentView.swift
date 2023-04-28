//
//  ContentView.swift
//  chugundaM1
//
//  Created by Руслан Меланин on 29.03.2023.
//

import SwiftUI

struct ContentView: View {
    
    @State private var showingAlert = false
    
    @State var chugImage = "image11"
    @State var chugImage12 = "image12"
    @State var chugImage13 = "image13"
    
    @State var money = 1000
    @State var prevSpin = 0
    @State var message = ""

    
    var body: some View {
        
        ZStack {
            
            Image("ebany").resizable().ignoresSafeArea()
            
            VStack {
                
                Text("Чугунда 9D")
                    .font(.title)
                    .fontWeight(.semibold)
                    .multilineTextAlignment(.center)
                    .foregroundColor(Color.white)
                
                Spacer()
                
                HStack {
                    Text("Деньги:")
                        .font(.title2)
                        .foregroundColor(Color.white)
                    
                    Text(String(money)).foregroundColor(Color.white).font(.title2)

                }
                            
                Spacer()
                
                HStack {
                    
                    Spacer()

                    Image(chugImage).resizable().scaledToFit()
                    
                    Spacer()
                    
                    Image(chugImage12).resizable().scaledToFit()
                    
                    Spacer()

                    Image(chugImage13).resizable().scaledToFit()
                    
                    Spacer()

                }
                
                Spacer()
                
                HStack {
                    
                    Text(getMessage()).font(.title2).foregroundColor(Color.white)
                    Text(String(prevSpin)).font(.title2).foregroundColor(Color.white)
                    
                }
                
                
                Spacer()
                
                Button(action: {money += 1000}, label: { Text("Пополнить через Qiwi терминал \nв Продуктах 24")}).foregroundColor(.white).padding(20).opacity(money > 0 ? 0 : 1)
                
                Button(action: {
                    
                    if money <= 0 {
                        
                        showingAlert = true

                        return

                    }
                    roll()
                    
                    var spin = 0
                    var price = ["image13":100, "image14":70, "image12":300, "image11":-100]
                    
                    if chugImage == chugImage12 && chugImage12 == chugImage13 {
                        
                        spin = price[chugImage] ?? 50
                        
                    }
                    
                    else {
                        
                        spin = -20
                        
                    }
                    
                    money += spin
                    
                    prevSpin = spin
                    
                }, label: { Text("Ёкарный бабай ЖМИ")
                        .foregroundColor(Color.white)
                        .font(.title)
                        .fontWeight(.heavy)
                    .foregroundColor(Color.black)}).alert("ЁБАНЫЙ РОТ ЭТОГО КАЗИНО БЛЯДЬ", isPresented: $showingAlert) {
                        Button("OK", role: .cancel) { }
                    }
                
            }
            .padding()

        }
        
            }
    
    func roll() {
        
        var imaValue = Int.random(in: 11...14)
        chugImage = "image" + String(imaValue)
        
        var imaValue1 = Int.random(in: 11...14)
        chugImage12 = "image" + String(imaValue1)
        
        var imaValue2 = Int.random(in: 11...14)
        chugImage13 = "image" + String(imaValue2)
        
        }
    
    func getMessage() -> String {
        
        if prevSpin < 0 {
            
            return "Ty proebal"
            
        }
        
        return "Ty win"
        
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
