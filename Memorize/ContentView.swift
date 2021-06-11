//
//  ContentView.swift
//  Memorize
//
//  Created by iresh sharma on 10/06/21.
//

import SwiftUI

struct ContentView: View {
    var emojis: [String] = (0..<40).map { "🚀 \($0)"}
    
    
    @State var emojiCount: Int = 10
    @State var removeEnable = true
    @State var addEnable = true
    
    
    var body: some View {
        VStack {
            Text("Memorize").font(.largeTitle).fontWeight(.black).foregroundColor(.red).underline()
            ScrollView {
                LazyVGrid(columns: [GridItem(.adaptive(minimum: 100, maximum: 300))], content: {
                    ForEach(emojis[0..<emojiCount], id: \.self) { emoji in
                        CardView(emoji: emoji).aspectRatio(2/3, contentMode: .fit)
                    }.foregroundColor(.red)
                })
            }
            HStack {
                remove
                Spacer()
                Text("@Iresharma").font(/*@START_MENU_TOKEN@*/.headline/*@END_MENU_TOKEN@*/).fontWeight(.black).foregroundColor(Color.blue)
                Spacer()
                add
            }.padding(.horizontal).font(.largeTitle)
        }.padding()
    }
    
    
    
//  REMOVE BUTTON
    var remove: some View {
        Button{
            if(emojiCount > 1) {
                emojiCount -= 1
                removeEnable = true
            } else {
                removeEnable = false
            }
            if(emojiCount < emojis.count){
                addEnable = true
            }
        } label: {
            Image(systemName: "minus.circle")
        }.disabled(!removeEnable)
    }
    
    
    
//  ADD BUTTON
    var add: some View {
        Button{
            if(emojiCount < emojis.count) {
                emojiCount += 1
                addEnable = true
            } else {
                addEnable = false
            }
            if(emojiCount > 0) {
                removeEnable = true
            }
        } label: {
            Image(systemName: "plus.circle")
        }.disabled(!addEnable)
    }
}



// CARDVIEW
struct CardView: View {
    @State var isFaceUp: Bool = true
    var emoji: String
    var body: some View {
        ZStack {
            let shape = RoundedRectangle(cornerRadius: 10)
            if isFaceUp {
                shape.fill().foregroundColor(.white)
                shape.stroke(lineWidth: 5)
                Text(emoji).font(.largeTitle)
            } else {
                shape.fill()
            }
        }.onTapGesture {
            isFaceUp = !isFaceUp
        }.padding(3.0)
    }
}

//struct CoolScreen: View {
//    var body: some View {
//        ZStack {
//            RoundedRectangle(cornerRadius: /*@START_MENU_TOKEN@*/25.0/*@END_MENU_TOKEN@*/)
//                .stroke(lineWidth: 5)
//                .padding()
//                .foregroundColor(/*@START_MENU_TOKEN@*/.red/*@END_MENU_TOKEN@*/)
//            RoundedRectangle(cornerRadius: /*@START_MENU_TOKEN@*/25.0/*@END_MENU_TOKEN@*/)
//                .stroke(lineWidth: 5)
//                .padding(40)
//                .foregroundColor(.blue)
//            RoundedRectangle(cornerRadius: /*@START_MENU_TOKEN@*/25.0/*@END_MENU_TOKEN@*/)
//                .stroke(lineWidth: 5)
//                .padding(60)
//                .foregroundColor(.green)
//            RoundedRectangle(cornerRadius: /*@START_MENU_TOKEN@*/25.0/*@END_MENU_TOKEN@*/)
//                .stroke(lineWidth: 5)
//                .padding(80)
//                .foregroundColor(/*@START_MENU_TOKEN@*/.red/*@END_MENU_TOKEN@*/)
//            RoundedRectangle(cornerRadius: /*@START_MENU_TOKEN@*/25.0/*@END_MENU_TOKEN@*/)
//                .stroke(lineWidth: 5)
//                .padding(100)
//                .foregroundColor(.blue)
//            RoundedRectangle(cornerRadius: /*@START_MENU_TOKEN@*/25.0/*@END_MENU_TOKEN@*/)
//                .stroke(lineWidth: 5)
//                .padding(120)
//                .foregroundColor(.green)
//            HelloText()
//        }
//    }
//}
//
//struct HelloText: View {
//    var body: some View {
//        VStack(alignment: .center, spacing: 3.0) {
//            Text("Hello, world!")
//                .fontWeight(.black)
//                .foregroundColor(.black).font(/*@START_MENU_TOKEN@*/.largeTitle/*@END_MENU_TOKEN@*/)
//                .padding()
//            Text("Me, Iresh is learning Swift again!")
//                .fontWeight(.semibold)
//                .foregroundColor(.red).font(.title3)
//        }
//    }
//}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
//        ContentView()
//            .preferredColorScheme(.light)
        ContentView()
            .preferredColorScheme(.dark)
    }
}
