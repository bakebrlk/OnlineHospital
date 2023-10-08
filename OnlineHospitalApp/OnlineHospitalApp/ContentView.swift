//
//  ContentView.swift
//  OnlineHospitalApp
//
//  Created by bakebrlk on 05.10.2023.
//

import SwiftUI

enum pages: Int{
    case none = 0
    case format = 1
    case record = 2
    case date = 3
    case confirm = 4
    case successfully = 5
}

struct ContentView: View {
    
    @State private var page: pages = .format
    
    var body: some View {
        
        VStack(alignment: .leading) {
            topPage
            
            FormatView()
            
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
        pages(index: .format)
    }
    private var secondPage: some View {
        pages(index: .record)
    }
    private var thirdPage: some View {
        pages(index: .date)
    }
    
    private func pages(index: pages) -> some View {
        
        return Text("")
                    .frame(width: 35, height: 10)
                    .background(page.rawValue >= index.rawValue ? Color("Purple"): Color.gray.opacity(0.5))
                    .cornerRadius(8)

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
                    .fill(Color("Purple"))
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
