//
//  ContentView.swift
//  ConnectFour
//
//  Created by Ilan Benjamin on 2022-02-12.
//

/*
 NEXT UP
 1) Create signup/login page to get to connect 4
 2) Show your name in the game
 3) Set up database and only let you play if you input a proper username
 4) Make second player AI? (machine learn + multiple levels of difficulty)
 */

import SwiftUI
var curUsername = ""
var curPassword = ""
var loginStatus = ""

struct ConnectFourView: View {
    @State var turn = "L" //L or R
    @State var turnName = curUsername
    var column = ["1", "2", "3", "4", "5", "6", "7"]
    @State var grid = [["-","-","-","-","-","-"],["-","-","-","-","-","-"],["-","-","-","-","-","-"],["-","-","-","-","-","-"],["-","-","-","-","-","-"],["-","-","-","-","-","-"],["-","-","-","-","-","-"]]
    
     @State var lScore = 0
     @State var rScore = 0
    
    var body: some View {
        VStack{
            //Spacer()
            NavigationLink(destination: ContentView().navigationBarTitle("")
                            .navigationBarHidden(true)){
                Text("Log Out")
                    .foregroundColor(.white)
                    .bold()
                    .padding(6)
            }
            .background(Color.black)
            .cornerRadius(4)
            
            Spacer()
            HStack{
                Spacer()
                Text(curUsername+": "+String(lScore))
                Spacer()
                //Text(curUsername+"'s Turn")
                Spacer()
                Text("Opponent: "+String(rScore))
                Spacer()
            }
            Spacer()
                ForEach(0..<6){ j in
                    HStack{
                        Spacer()
                        ForEach(0..<7){ i in
                            Text(grid[i][j]).padding().border(Color.black, width: 2)
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
                        var spotFilled = false
                        for j in (0...5).reversed() {
                            if(grid[i][j]=="-"){
                                grid[i][j] = turn
                                spotFilled = true
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
                        
                        
                        //Check for Tie
                        var full = true
                        for j in 0...5 {
                            for i in 0...6 {
                                if(grid[i][j] == "-"){
                                    full = false
                                }
                            }
                        }
                        
                        if(full == true){
                            for j in 0...5 {
                                for i in 0...6 {
                                    grid[i][j] = "-"
                                }
                            }
                        }
                        
                        
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
                        if(spotFilled){
                            if(turn=="L"){
                                turn = "R"
                                turnName = "Oponnent"
                            }
                            else{
                                turn = "L"
                                turnName = curUsername
                            }
                        }
                    
  
                        //Make it so it finds the lowest one to check
                    } label : {
                        Text(column[i])
                    }
                    Spacer()
                }
            }
            Spacer()
            Text(turnName+"'s Turn")
            Spacer()
            Text("LINK_4").font(.system(size: 31, weight: .bold))
            //Spacer()
        }
    }
}

struct ContentView: View {
    var body: some View {
        VStack{
            NavigationView() {
                VStack{
                    Text("LINK_4").font(.system(size: 31, weight: .bold))
                    
                    Spacer()
                    
                    /*NavigationLink(destination: ConnectFourView().navigationBarTitle("")
                                    .navigationBarHidden(true)){
                        Text("Connect 4")
                            .foregroundColor(.white)
                            .bold()
                            .padding(6)
                    }
                    .background(Color.black)
                    .cornerRadius(4)*/
                    
                    HStack{
                        Spacer()
                        
                        NavigationLink(destination: SignUp().navigationBarTitle("")
                                        .navigationBarHidden(true)){
                            Text("Sign Up")
                                .foregroundColor(.white)
                                .bold()
                                .padding(6)
                        }
                        .background(Color.black)
                        .cornerRadius(4)
                        
                        Spacer()
                        
                        NavigationLink(destination: SignIn().navigationBarTitle("")
                                        .navigationBarHidden(true)){
                            Text("Sign In")
                                .foregroundColor(.white)
                                .bold()
                                .padding(6)
                        }
                        .background(Color.black)
                        .cornerRadius(4)
                        
                        Spacer()
                    }
                    
                    
                    
                    
                    
                    /*NavigationLink(destination: RedGreenLight()){
                        Text("Red Green Light")
                            .foregroundColor(.white)
                            .bold()
                            .padding(6)
                    }
                    .background(Color.black)
                    .cornerRadius(4)*/
                    
                    
                    //ADD @ LEAST 2 MORE GAMES
                    // match game
                    // card game
                    // color lightup game (two player - every click changes color)
                    // 
                    
                    
                    
                    Spacer()
                }
            }
        }
    }
}

struct UsernameTextField : View {
    @Binding var username: String
    var body: some View {
        return TextField("Username", text: $username)
    }
}

struct PasswordTextField : View {
    @Binding var password: String
    var body: some View {
        return SecureField("Password", text: $password)
    }
}

struct SignIn: View {
    @State var username: String = ""
    @State var password: String = ""
    var body: some View {
        
         VStack{
             NavigationLink(destination: ContentView().navigationBarTitle("")
                             .navigationBarHidden(true)){
                 Text("HOME")
                     .foregroundColor(.white)
                     .bold()
                     .padding(6)
             }
             .background(Color.black)
             .cornerRadius(4)
             
             Spacer()
             
             Text("Sign in")
                 .font(.system(size: 20.0))
                 .bold()
             
                 //.background(Color.gray)
             
             HStack{
                 Spacer()
                 TextField("Username", text: $username)
                     .multilineTextAlignment(.center)
                     .border(Color.black)
                     .padding(6)
                 Spacer()
             }
             HStack{
                 Spacer()
                 SecureField("Password", text: $password)
                     .multilineTextAlignment(.center)
                     .border(Color.black)
                     .padding(6)
                 Spacer()
             }
             
             NavigationLink(destination: {
                 VStack{
                     if(curUsername == username && curPassword == password) {
                         //ConnectFourView()
                         //loginStatus = ""
                         
                         ConnectFourView().navigationBarTitle("")
                             .navigationBarHidden(true)
                     }
                     else{
                         //Text("Wrong username and/or password")
                         //SignIn()
                         //loginStatus = "Wrong username and/or password."
                         
                         SignIn().navigationBarTitle("")
                             .navigationBarHidden(true)
                     }
                 }
                 
             }()){
                 Text("Login")
                     .foregroundColor(.white)
                     .bold()
                     .padding(6)
             }.simultaneousGesture(TapGesture().onEnded{
                 if(curUsername == username && curPassword == password) {
                     loginStatus = ""
                 }
                 else{
                     loginStatus = "Wrong username and/or password."
                 }
             })
             .background(Color.black)
             .cornerRadius(4)
                
             
             Text(loginStatus)
                 .foregroundColor(.red)
                 .bold()
                 .padding(6)
                 .font(.system(size: 10.0))
             
            Spacer()
             
            }
            
        }
}



struct SignUp: View {
    @State var username: String = ""
    @State var password: String = ""
    var body: some View {
        VStack{
            NavigationLink(destination: ContentView().navigationBarTitle("")
                            .navigationBarHidden(true)){
                Text("HOME")
                    .foregroundColor(.white)
                    .bold()
                    .padding(6)
            }
            .background(Color.black)
            .cornerRadius(4)
            
            Spacer()
            
            Text("Sign-Up")
                .font(.system(size: 20.0))
                .bold()
            
            HStack{
                Spacer()
                UsernameTextField(username: $username)
                    .multilineTextAlignment(.center)
                    .border(Color.black)
                    .padding(6)
                Spacer()
            }
            HStack{
                Spacer()
                PasswordTextField(password: $password)
                    .multilineTextAlignment(.center)
                    .border(Color.black)
                    .padding(6)
                Spacer()
            }
                        
            NavigationLink(destination: SignIn().navigationBarTitle("")
                            .navigationBarHidden(true)){
                Text("Create Account")
                    .foregroundColor(.white)
                    .bold()
                    .padding(6)
            }.simultaneousGesture(TapGesture().onEnded{
                //Store hash in .txt document (note that the has may be different each time you runt he program so I should delete the file and redo it after every time I run the program)
 
                curUsername = username
                curPassword = password
            })
            .background(Color.black)
            .cornerRadius(4)
            
            NavigationLink(destination: SignIn().navigationBarTitle("")
                            .navigationBarHidden(true)){
                Text("Already have an account?")
                    .foregroundColor(.black)
                    .padding(6)
                    .font(.system(size: 10.0))
            }
            
            Spacer()
            
        }//.navigationBarBackButtonHidden(true)
    }
}




/*
 struct RedGreenLight: View {
     @State var time = 0.0
     @State var buttonPressed = false
     @State var buttonText = "CLICK ME!"
     @State var delay = 0.0
     @State var rxnTime = 0.0
     
     let timer = Timer.publish(every: 0.1, on: .main, in: .common).autoconnect()
     
     var body: some View {
         VStack {
             Spacer()
             Text(String(floor(10*rxnTime)/10))
             .onReceive(timer){ time in
                 if !buttonPressed {
                     rxnTime += 0.1
                 }
            }
             Spacer()
             Button {
                 buttonPressed = true
                 sleep(5)
                 rxnTime = 0.0
                 sleep(UInt32(delay))
                 DispatchQueue.main.asyncAfter(deadline: .now() + delay) { }
                 buttonPressed = false
                 buttonText = "CLICK ME!"
             } label : {
                 Text(buttonText)
             }
         }
     }
 }
 */

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
        //SignUp()
    }
}
