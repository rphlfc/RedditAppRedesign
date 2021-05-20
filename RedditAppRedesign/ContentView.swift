//
//  ContentView.swift
//  RedditAppRedesign
//
//  Created by Raphael Cerqueira on 19/05/21.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        LoginView()
    }
}

struct LoginView: View {
    @State var username = ""
    @State var password = ""
    
    var body: some View {
        ZStack(alignment: .bottom) {
            VStack {
                Image("background")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .ignoresSafeArea(.all, edges: .top)
                
                Spacer()
            }
            
            VStack(alignment: .leading) {
                HStack {
                    Text("The best")
                        .font(.system(size: 37))
                        .fontWeight(.bold)
                    
                    Text("Reddit")
                        .font(.system(size: 37))
                        .fontWeight(.bold)
                        .foregroundColor(Color(#colorLiteral(red: 0.914072752, green: 0.3077585399, blue: 0.08124504238, alpha: 1)))
                    
                    Spacer()
                }
                
                Text("Experience")
                    .font(.system(size: 37))
                    .fontWeight(.bold)
                
                CustomFieldView(text: $username, label: "Username")
                    .padding(.top, 30)
                
                CustomFieldView(text: $password, isSecure: true, label: "Password")
                    .padding(.top, 30)
                
                HStack {
                    VStack(alignment: .leading) {
                        Text("New to Reddit?")
                            .fontWeight(.semibold)
                            .foregroundColor(.gray)
                        
                        Button(action: {}, label: {
                            Text("Sign up")
                                .font(.system(size: 21))
                                .fontWeight(.semibold)
                            
                            Image(systemName: "arrowtriangle.right.fill")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 10)
                        })
                        .foregroundColor(.black)
                    }
                    
                    Spacer()
                    
                    Button(action: {}, label: {
                        Text("Log In")
                            .font(.title)
                            .foregroundColor(.white)
                            .background(
                                Circle()
                                    .fill(LinearGradient(gradient: Gradient(colors: [Color(#colorLiteral(red: 0.9690257907, green: 0.3196148276, blue: 0.04541049153, alpha: 1)), Color(#colorLiteral(red: 1, green: 0.4362443089, blue: 0.1200051084, alpha: 1))]), startPoint: .topLeading, endPoint: .bottomTrailing))
                                    .frame(width: 120, height: 120)
                            )
                            .padding(20)
                            .shadow(color: Color(#colorLiteral(red: 0.9690257907, green: 0.3196148276, blue: 0.04541049153, alpha: 1)).opacity(0.5), radius: 20, x: 0, y: 10)
                            .padding(.bottom)
                    })
                }
                .padding(.top, 60)
            }
            .padding(.vertical, 40)
            .padding(.horizontal, 20)
            .background(Color.white)
            .cornerRadius(30)
        }
    }
}

struct CustomFieldView: View {
    @Binding var text: String
    var isSecure = false
    var label: String
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(label)
                .fontWeight(.bold)
                .foregroundColor(.gray)
            
            if isSecure {
                SecureField("", text: $text)
            } else {
                TextField("", text: $text)
                    .keyboardType(.emailAddress)
                    .autocapitalization(.none)
            }
            
            Rectangle()
                .frame(maxWidth: .infinity)
                .frame(height: 2)
                .foregroundColor(.gray.opacity(0.7))
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
