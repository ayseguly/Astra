//
//  ContentView.swift
//  astra
//
//  Created by Ayşegül Yurtdakal on 17.02.2023.
//

import SwiftUI
import CoreData

struct ContentView: View {
    let Background = Image("background")
    let darkBackground = UIColor(red: 0.189, green: 0.187, blue: 0.256, alpha: 1.0)


    @Environment(\.managedObjectContext) private var viewContext
    @ObservedObject var tabItems = TabItems.shared
        
        @State private var circleSize: CGFloat = 50
        @State private var iconeSize: CGFloat = 30
        @State private var selectedItem = Tab.First
    
    private enum Tab{
        case First, Second, Third, Fourth, Fifth
    }
    
    
    var body: some View {
        NavigationView{
            ZStack{
                VStack {
                    Spacer()
                    Image("siri").frame(width: 40,height: 40).padding(.top,500)
                    Spacer()
                    
                    
                    ZStack {
                        Bar(tab: tabItems.selectedTabIndex)
                            .foregroundColor(.gray).blur(radius: 10)
                            .frame(width: UIScreen.main.bounds.width, height: 100)
                        HStack(spacing: (UIScreen.main.bounds.width - (CGFloat(TabItems.shared.items.count + 1) * self.circleSize)) / (CGFloat(TabItems.shared.items.count) + 1)) {
                            ForEach(0..<tabItems.items.count, id: \.self) { i in
                                ZStack {
                                    Circle()
                                        .frame(width: self.circleSize, height: self.circleSize)
                                        .foregroundColor(.white.opacity(0.7))
                                        .blur(radius: 8)
                                        .onTapGesture {
                                            
                                            self.tabItems.select(1)
                                            settView()
                                            
                                            //NavigationLink("",destination: navigationScreen(), isActive: self.tabItems.select(1))
                                                
                                                //i(tabItems.select(1))
                                            // Code to change tab screen can go here...
                                            
                                        }
                                    Image(systemName: self.tabItems.items[i].imageName)
                                        .resizable()
                                        .foregroundColor(Color.black)
                                        .frame(width: self.iconeSize, height: self.iconeSize)
                                        .opacity(self.tabItems.items[i].opacity)
                                }
                                .offset(y: self.tabItems.items[i].offset)
                                
                            }
                        }
                        Image("astra").resizable().frame(width: 50,height: 50).offset(y: -10)
                    }
                }
                .edgesIgnoringSafeArea(.all)
            }.background(Image("background"))
            
        }
    }
        
}
struct settView: View {
    var body: some View {
        NavigationView {
            VStack {
                NavigationLink(destination: navigationScreen()) {
                    Text("Show Detail View")
                }.navigationBarTitle("Navigation")
            }
        }
    }
}
    
    
    struct ContentView_Previews: PreviewProvider {
        static var previews: some View {
            ContentView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)

        }
    }
    
//background(Image("background"))
