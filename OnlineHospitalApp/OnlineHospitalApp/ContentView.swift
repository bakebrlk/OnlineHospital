//
//  ContentView.swift
//  OnlineHospitalApp
//
//  Created by bakebrlk on 05.10.2023.
//

import SwiftUI

enum pages{
    case format
    case record
    case date
    case confirm
    case successfully
}

struct ContentView: View {
    
    
    var body: some View {
        
        VStack(alignment: .leading) {
            topPage
            
            title
            
        
            Spacer()
            
            btns
        }
        .padding()
    }
    
    
    private var topPage: some View{
        
        HStack{
            Spacer()
            
            firstPage
            
            secondPage
            
            thirdPage
            
            Spacer()
        }
        .padding()
    }
    
    private var firstPage: some View {
        pages()
    }
    private var secondPage: some View {
        pages()
    }
    private var thirdPage: some View {
        pages()
    }
    
    private func pages() -> some View {
        return Text("")
                    .frame(width: 35, height: 10)
                    .background(Color.gray.opacity(0.5))
                    .cornerRadius(8)

    }
    
    private var title: some View {
        Text("Выберите формат \nприема")
            .font(.system(size: 32))
            .fontWeight(.semibold)
    }
    
    
    private var btns: some View {
        HStack{
            btnBack

            btnNext
                .padding(.leading)
        }
        .padding(.leading)
    }
    
    private var btnBack: some View{
        Button(action: {
            print("Back")
            
        }, label: {
            HStack{
                Image(systemName: "arrowshape.backward.fill")
                    .foregroundColor(.black)
                Text("Назад")
                    .foregroundStyle(Color.black)
                    .font(.system(size: 18))
                    .fontWeight(.bold)
            }
        })
        .frame(width: 114,height: 56)
        .background(
            RoundedRectangle(cornerRadius: 30)
                .fill(Color.clear)
        )
        .overlay(
            RoundedRectangle(cornerRadius: 30)
                .stroke(Color.gray, lineWidth: 2)
        )
      
    }
    
    private var btnNext: some View {
        Button(action: {
            print("next")
        }, label: {
            Text("Дальше")
                .foregroundStyle(Color.white)
                .font(.system(size: 18))
                .fontWeight(.bold)
        })
            .frame(width: 194,height: 56)
            .background(
                RoundedRectangle(cornerRadius: 30)
                    .fill(Color.blue)
            )
            .overlay(
                RoundedRectangle(cornerRadius: 30)
                    .stroke(Color.gray, lineWidth: 2)
            )
    }
    

}

#Preview {
    ContentView()
}
