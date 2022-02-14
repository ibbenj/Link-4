//
//  ContentView.swift
//  ConnectFour
//
//  Created by Ilan Benjamin on 2022-02-12.
//

import SwiftUI

struct ContentView: View {
    
    @State var turn = "L" //L or R
    var column = ["1", "2", "3", "4", "5", "6", "7"]
    @State var grid = [["-","-","-","-","-","-"],["-","-","-","-","-","-"],["-","-","-","-","-","-"],["-","-","-","-","-","-"],["-","-","-","-","-","-"],["-","-","-","-","-","-"],["-","-","-","-","-","-"]]
    
     @State var lScore = 0
     @State var rScore = 0
    
    var body: some View {
        
        
        VStack{
            Spacer()
            HStack{
                Spacer()
                
                
                
                Text("L: "+String(lScore))
                Spacer()
                Text("L's Turn")
                Spacer()
                Text("R: "+String(rScore))
                Spacer()
            }
            Spacer()

                ForEach(0..<6){ j in
                    HStack{
                        Spacer()
                        ForEach(0..<7){ i in
                            Text(grid[i][j])
                            Spacer()
                        }
                    }
                    Spacer()
                }

            HStack{
                Spacer()
                ForEach(0..<7){ i in
                    Button {
                        //Add to correspodning column if space avaliable
                        for j in (0...5).reversed() {
                            if(grid[i][j]=="-"){
                                grid[i][j] = turn
                                break;
                            }
                        }
                        
                        
                        var winner = false
                        //Check if anyone won
                        
                        //Horizontal check
                        for j in 0...5 {
                            for i in 0...3 {
                                if(grid[i][j]==turn && grid[i+1][j]==turn && grid[i+2][j]==turn && grid[i+3][j]==turn){
                                    winner = true
                                }
                            }
                        }
                        
                        for j in 0...2 {
                            for i in 0...6 {
                                if(grid[i][j]==turn && grid[i][j+1]==turn && grid[i][j+2]==turn && grid[i][j+3]==turn){
                                    winner = true
                                }
                            }
                        }
                        
                        for j in 0...2 {
                            for i in 0...3 {
                                if(grid[i][j]==turn && grid[i+1][j+1]==turn && grid[i+2][j+2]==turn && grid[i+3][j+3]==turn){
                                    winner = true
                                }
                            }
                        }
                        
                        for j in 0...2 {
                            for i in 0...3 {
                                if(grid[i][j+3]==turn && grid[i+1][j+2]==turn && grid[i+2][j+1]==turn && grid[i+3][j]==turn){
                                    winner = true
                                }
                            }
                        }
                        
                        //Vertical check

                        
                        
                        //Diagonal check
                        
                        
                        
                        //If someone won restart game and increment score
                        if(winner){
                            //Increment score
                            if(turn=="L"){
                                lScore += 1
                            }
                            else{
                                rScore += 1
                            }
                            
                            //Clear board
                            for j in 0...5 {
                                for i in 0...6 {
                                    grid[i][j] = "-"
                                }
                            }
                        }
                        
                        
                        //If nobody won then switch players and carry on
                        if(turn=="L"){
                            turn = "R"
                        }
                        else{
                            turn = "L"
                        }
                        
                        
                        
                        
                        //Make it so it finds the lowest one to check
                    } label : {
                        Text(column[i])
                    }
                    Spacer()
                }
            }
            Spacer()
            Text(turn+"'s Turn")
            Spacer()
            Text("LINK_4").font(.system(size: 31, weight: .bold))
            Spacer()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
