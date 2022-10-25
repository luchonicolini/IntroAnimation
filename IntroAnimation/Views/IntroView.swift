//
//  IntroView.swift
//  IntroAnimation
//
//  Created by Luciano Nicolini on 24/10/2022.
//

import SwiftUI

struct IntroView: View {
    //propiedades animaciones
    @State var showWalkThroughScreens: Bool = false
    @State var currentIndex: Int = 0
    @State var showHomeView: Bool = false
    
    var body: some View {
        ZStack {
            if showHomeView {
                HomeView()
                    .transition(.move(edge: .trailing))
            } else {
                ZStack {
                    Color("ColorFondo").ignoresSafeArea()
                    IntroScreen()
                    WalkThroughScreens()
                    Navbar()
                    
                }
                .animation(.interactiveSpring(response: 1.1,dampingFraction: 0.85,blendDuration: 0.85), value: showWalkThroughScreens)
                .transition(.move(edge: .leading))
            }
        }
        .animation(.easeInOut(duration: 0.35), value: showHomeView)
    }
    
   
    @ViewBuilder
    func WalkThroughScreens()-> some View {
        let isLast = currentIndex == intros.count
        GeometryReader {
            let size = $0.size
            ZStack {
                ForEach(intros.indices,id: \.self) { index in
                    ScreenView(size: size, index: index)
                    
                }
                WelcomeView(size: size, index: intros.count)
            }
            .frame(maxWidth: .infinity,maxHeight: .infinity)
            
            .overlay(alignment: .bottom) {
                ZStack {
                    Image(systemName: "chevron.right")
                        .font(.title3)
                        .fontWeight(.semibold)
                        .scaleEffect(!isLast ? 1 : 0.001)
                        .opacity(!isLast ? 1 : 0)
                    
                    
                    HStack {
                        Text("Sign Up")
                            .font(.system(size: 15, design: .rounded))
                            .foregroundColor(.white)
                            .frame(maxWidth: .infinity,alignment: .leading)
                        Image(systemName: "arrow.right")
                            .font(.title3)
                            .fontWeight(.semibold)
                            .foregroundColor(.white)
                    }
                    .padding(.horizontal,15)
                    .scaleEffect(isLast ? 1 : 0.001)
                    .frame(height: isLast ? nil: 0)
                    .opacity(isLast ? 1 : 0)
                }
                .frame(width: isLast ? size.width / 1.5 : 55,height: isLast ? 50 : 55)
                .foregroundColor(.white)
                .background {
                    RoundedRectangle(cornerRadius: isLast ? 10 :30, style: isLast ? .continuous : .circular)
                        .fill(Color.blue)
                }
                .onTapGesture {
                    if currentIndex == intros.count {
                        showHomeView = true
                    } else {
                        currentIndex += 1
                    }
                }
                .offset(y: isLast ? -40 : -90)
                //animation
                .animation(.interactiveSpring(response: 0.9,dampingFraction: 0.8,blendDuration: 0.5), value: isLast)
            }
            .overlay(alignment: .bottom, content:  {
                let isLast = currentIndex == intros.count
                HStack(spacing: 5) {
                    Text("Lorem ipsum dolor sit amet")
                        .font(.system(size: 18, design: .rounded))
                        .foregroundColor(.gray)
                    Button("Login") {
                        
                    }
                    .font(.system(size: 18, design: .rounded))
                    .foregroundColor(Color.blue)
                }
                .offset(y: isLast ? -12 : 100)
                .animation(.interactiveSpring(response: 0.9,dampingFraction: 0.8,blendDuration: 0.5), value: isLast)
            })
            .offset(y: showWalkThroughScreens ? 0 : size.height)
        }
    }
    
    @ViewBuilder
    func WelcomeView(size: CGSize, index: Int)-> some View {
        
        VStack(spacing: 10) {
            Image("img1")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(height: 250,alignment: .top)
                .padding(.horizontal,20)
                .offset(x: -size.width * CGFloat(currentIndex - index))
                .animation(.interactiveSpring(response: 0.9,dampingFraction: 0.8 ,blendDuration: 0.5).delay(currentIndex == index ? 0 : 0.2).delay(currentIndex == index ? 0.1 : 0), value: currentIndex)
            
            Text("Welcome")
                .font(.system(size: 28, weight: .bold, design: .rounded))
                .offset(x: -size.width * CGFloat(currentIndex - index))
            //add animation
            //add delay to elements
                .animation(.interactiveSpring(response: 0.9,dampingFraction: 0.8 ,blendDuration: 0.5).delay(currentIndex == index ? 0.2 : 0).delay(currentIndex == index ? 0.1 : 0), value: currentIndex)
            
            
            Text("Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis")
                .font(.system(size: 18, design: .rounded))
                .multilineTextAlignment(.center)
                .padding(.horizontal,30)
                .offset(x: -size.width * CGFloat(currentIndex - index))
                .animation(.interactiveSpring(response: 0.9,dampingFraction: 0.8 ,blendDuration: 0.5).delay(0.1).delay(currentIndex == index ? 0.2 : 0), value: currentIndex)
            
            
        }
        .offset(y: -30)
    }
    
    
    @ViewBuilder
    func ScreenView(size: CGSize,index: Int)-> some View {
        let intro = intros[index]
        VStack(spacing: 10) {
            Text(intro.title)
                .font(.system(size: 28, weight: .bold, design: .rounded))
                .offset(x: -size.width * CGFloat(currentIndex - index))
            //add animation
            //add delay to elements
                .animation(.interactiveSpring(response: 0.9,dampingFraction: 0.8 ,blendDuration: 0.5).delay(currentIndex == index ? 0.2 : 0).delay(currentIndex == index ? 0.2 : 0), value: currentIndex)
            
            
            Text("Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis")
                .font(.system(size: 18, design: .rounded))
                .multilineTextAlignment(.center)
                .padding(.horizontal,30)
                .offset(x: -size.width * CGFloat(currentIndex - index))
                .animation(.interactiveSpring(response: 0.9,dampingFraction: 0.8 ,blendDuration: 0.5).delay(0.1).delay(currentIndex == index ? 0.2 : 0), value: currentIndex)
            
            Image(intro.imageName)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(height: 250,alignment: .top)
                .padding(.horizontal,20)
                .offset(x: -size.width * CGFloat(currentIndex - index))
                .animation(.interactiveSpring(response: 0.9,dampingFraction: 0.8 ,blendDuration: 0.5).delay(currentIndex == index ? 0 : 0.2).delay(currentIndex == index ? 0.2 : 0), value: currentIndex)
        }
    }
    
    //Navbar
    @ViewBuilder
    func Navbar()-> some View {
        let isLast = currentIndex == intros.count
        HStack {
            Button {
                //showWalkThroughScreens.toggle()
                if currentIndex > 0 {
                    currentIndex -= 1
                } else  {
                    showWalkThroughScreens.toggle()
                }
            } label: {
                Image(systemName: "chevron.left")
                    .font(.title3)
                    .fontWeight(.semibold)
                    .foregroundColor(Color.blue)
                    
            }
            Spacer()
            
            Button("Skip") {
                currentIndex = intros.count
            }
            .font(.system(size: 14, weight: .bold, design: .rounded))
            .foregroundColor(Color.blue)
            .opacity(isLast ? 0 : 1)
            .animation(.easeInOut, value: isLast)
        }
        .padding(.horizontal,15)
        .padding(.top,10)
        .frame(maxHeight: .infinity,alignment: .top)
        .offset(y: showWalkThroughScreens ? 0: -120)
    }
    
    @ViewBuilder
    func IntroScreen()-> some View {
        GeometryReader {
            let size = $0.size
            VStack(spacing: 10) {
                
                Image("img1")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: size.width, height: size.height / 2)
                
                Text("Welcome")
                    .font(.system(size: 30, weight: .medium, design: .rounded))
                    .padding(.top,55)
                
                Text("Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis")
                    .font(.system(size: 14, design: .rounded))
                    .multilineTextAlignment(.center)
                    .padding(.horizontal,30)
                
                Text("Lets Begin")
                    .font(.system(size: 14, weight: .bold, design: .rounded))
                    .padding(.horizontal,40)
                    .padding(.vertical,14)
                    .foregroundColor(.white)
                    .background {
                        Capsule()
                            .fill(Color.blue)
                    }
                    .onTapGesture {
                        showWalkThroughScreens.toggle()
                    }
                    .padding(.top,30)
                
            }
            .frame(maxWidth: .infinity,maxHeight: .infinity,alignment: .top)
            .offset(y: showWalkThroughScreens ? -size.height : 0)
        }
        .ignoresSafeArea()
    }
}

struct IntroView_Previews: PreviewProvider {
    static var previews: some View {
        IntroView()
    }
}
