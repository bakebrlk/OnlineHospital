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

enum variants: String{
    case none
    case online
    case offline
    case home
}

struct ContentView: View {
    
    @State private var page: pages = .format
    @State private var formatConsultation: variants = .none
    
    var body: some View {
        VStack(alignment: .leading) {
            topPage
            
            if(page == .format){
                FormatView(buttonPressed: $formatConsultation)
            }else if(page == .record){
                recordView()
            }else if(page == .date){
                selectDataView()
            }else if(page == .confirm){
                confirmView()
            }else if(page == .successfully){
                finishRegestrationView()
            }
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
                    .background(page.rawValue >= index.rawValue ? Color("MyCustomPurple"): Color.gray.opacity(0.5))
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
                
                if(page == .record){
                    page = .format
                }else if(page == .date){
                    page = .record
                }else if(page == .confirm){
                    page = .date
                }else if(page == .successfully){
                    page = .confirm
                }
                
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
                if(page == .format){
                    page = .record
                }else if(page == .record){
                    page = .date
                }else if(page == .date){
                    page = .confirm
                }else if(page == .confirm){
                    page = .successfully
                }
            }, label: {
                if(page == .confirm){
                    NavigationLink(destination: finishRegestrationView().navigationBarHidden(true)){
                        Text("Дальше")
                            .foregroundStyle(Color.white)
                            .font(.system(size: 18))
                            .fontWeight(.bold)
                    }
                    
                }else{
                    Text("Дальше")
                        .foregroundStyle(Color.white)
                        .font(.system(size: 18))
                        .fontWeight(.bold)
                }
            })
            .frame(width: 194,height: 56)
            .background(
                RoundedRectangle(cornerRadius: 30)
                    .fill(Color("MyCustomPurple"))
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
