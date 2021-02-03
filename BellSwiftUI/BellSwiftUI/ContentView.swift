//
//  ContentView.swift
//  BellSwiftUI
//
//  Created by Shreyas Vilaschandra Bhike on 03/02/21.
//  The App Wizard
//  Instagram : theappwizard2408

import SwiftUI

struct ContentView: View {
   
    var body: some View {
        ZStack {
            Color("Color").edgesIgnoringSafeArea(.all)
            
            ArrowView()
            BellView()
                .offset( y: -65)
            
            CountView()
                .offset(x : 30 , y: -85)
           
            VStack{
                
                Spacer().frame( height: 300, alignment: .center)
                
                Text("The App Wizard")
                    .fontWeight(.thin)
                    .foregroundColor(Color.white)
                
            }
          
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}






















struct ArrowView: View {
   
    @State private var arrowname = false
    
    var body: some View {
    
        ZStack{
        Circle()
            .foregroundColor(.clear)
            .frame(width: 200, height: 200, alignment: .center)
            .overlay(
                Circle()
                            .strokeBorder(
                                style: StrokeStyle(
                                    lineWidth: 2,
                                    dash: [10]
                                )
                            )
                            .foregroundColor(.white)
            )
            
            
            Image(systemName: "location.north.fill")
                .resizable()
                .foregroundColor(.red)
                .offset( x : 100 )
                .shadow(color: .black, radius: 1, x: 0.0, y: 0.0)
                .frame(width: 40, height: 40, alignment: .center)
                .rotationEffect(.degrees(arrowname ? -360 : 0))
                .animation(Animation.easeInOut(duration: 5).repeatCount(1))
                                   .onAppear() {
                                       self.arrowname.toggle()
                                 }
            
        }.rotationEffect(.degrees(260))
    }
}


struct BellView: View {
   
    @State private var bodyAnim = false
    @State private var clap = false
    
    var body: some View {
    
        ZStack{
            Image("innerb")
                .resizable()
                .shadow(color: .black, radius: 5, x: 0.0, y: 0.0)
                .frame(width: 200, height: 200, alignment: .center)
                .offset(x: clap ? -7 : -10, y: clap ? 20 : 20)
                .animation(Animation.interpolatingSpring(stiffness: 170, damping: 5).repeatCount(1).delay(4))
                .onAppear() {
                    self.clap.toggle()
                }.offset(x : 5 ,y : -30)
            
            Image("body")
                .resizable()
                .frame(width: 200, height: 200, alignment: .center)
                .shadow(color: .black, radius: 5, x: 0.0, y: 0.0)
                .rotationEffect(.degrees(bodyAnim ? 0 : 10))
                .animation(Animation.interpolatingSpring(stiffness: 150, damping: 5).repeatCount(1).delay(4))
                    .onAppear() {
                        self.bodyAnim.toggle()
                }
            
        }
    }
}

struct CountView: View {
   
    @State private var countt = false
    
    
    var body: some View {
    
        ZStack{
            Circle()
                .frame(width: 50, height: 50, alignment: .center)
                .foregroundColor(.red)
            
            Text("25")
                .font(.title)
                .fontWeight(.bold)
                .foregroundColor(Color.white)
            
        }.opacity(countt ? 1 : 0)
        .rotationEffect(.degrees(countt ? 0 : 10))
        .animation(Animation.interpolatingSpring(stiffness: 150, damping: 5).repeatCount(1).delay(5))
        .onAppear() {
                self.countt.toggle()
        }
         
    
    }

    
}
