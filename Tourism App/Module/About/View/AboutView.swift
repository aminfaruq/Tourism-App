//
//  AboutView.swift
//  Tourism App
//
//  Created by Amin faruq on 02/11/20.
//

import SwiftUI

struct AboutView: View {
    var body: some View {
        VStack {
            Image("profile")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
                .frame(width: 150, height: 150)
                .overlay(
                    Circle()
                        .stroke(Color.gray, lineWidth: 4)
                .shadow(radius: 10))
                .padding(.bottom, 12)

            CardName(text: "My name is amin faruq")
            CardName(text: "i'am ios Developer")
        }
        .padding(.bottom , 200)
    }
    
    struct AboutView_Previews: PreviewProvider {
        static var previews: some View {
            AboutView()
        }
    }
    
    
    struct CardName: View {
        var text : String

        var body: some View {
            VStack {
                Text(text)
                    .font(.body)
                    .fontWeight(.regular)
                    .foregroundColor(Color.black)
                    .frame(width: 200)
            }
            .padding(.horizontal ,16)
            .padding(.vertical ,16)
            .background(Color.black.opacity(0.1))
            .background(Color.white.opacity(0.1))
            .cornerRadius(12)
            .shadow(radius: 20 )
            .frame(width: 240, height: 60, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
        }
    }
}
