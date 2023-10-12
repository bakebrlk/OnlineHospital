//
//  selectDataView.swift
//  OnlineHospitalApp
//
//  Created by bakebrlk on 08.10.2023.
//

import SwiftUI

private enum variants: String{
    case online
    case offline
}

struct selectDataView: View {
    
    @State private var format: variants = .online
    
    @StateObject private var dataDateOnline = PostViewModel(api: "https://phydoc-test-2d45590c9688.herokuapp.com/get_schedule?type=online")
    @StateObject private var dataDateOffline = PostViewModel(api: "https://phydoc-test-2d45590c9688.herokuapp.com/get_schedule?type=offline")
    
    @State private var id: Int = -1
    
    var body: some View {
        
        VStack(alignment: .leading){
            title
            
            warning
            
            selectFormat
            
            ZStack{
                ScrollView{
                    ForEach(dataDateOnline.posts.slots, id: \.self){ data in
                        if(dataDateOnline.indexes.contains(data.id)){
                            VStack(alignment: .leading){
                                let dateString = dateToString(index: data.id - 1, dataDate: dataDateOnline)
                                date(title: dateString)
                                
                                source(day: Int(data.datetime[8..<10]) ?? 0, dataDate: dataDateOnline)
                            }
                        }
                    }
                }
                .foregroundStyle(Color.clear).opacity(format == .online ? 1 : 0)

                ScrollView{
                    ForEach(dataDateOffline.posts.slots, id: \.self){ data in
                        if(dataDateOffline.indexes.contains(data.id)){
                            VStack(alignment: .leading){
                                let dateString = dateToString(index: data.id - 15, dataDate: dataDateOffline)
                                date(title: dateString)
                                
                                source(day: Int(data.datetime[8..<10]) ?? 0, dataDate: dataDateOffline)
                            }
                        }
                    }
                }
                .foregroundStyle(Color.clear).opacity(format == .offline ? 1 : 0)
                
            }
            Spacer()
            
            
        }.onAppear {
            dataDateOnline.fetchPosts()
            dataDateOffline.fetchPosts()
        }
        
    }
    
    private func source(day: Int, dataDate: PostViewModel) -> some View {
        
        ScrollView{
            
            VStack{
                LazyVGrid(columns: Array(repeating: GridItem(), count: 4)){
                    
                    ForEach(dataDate.posts.slots, id: \.self){ post in
                        if(Int(post.datetime[8..<10]) == day){
                            
                            VStack{
                                
                                ZStack{
                                    time(time: post.datetime[11..<16], price: "\(post.price)₸", id: post.id)
                                }
                            }
                        }
                    }
                }
            }
        }
        .padding()
    }
    
    private var title: some View {
        Text("Выберите дату и время")
            .font(.system(size: 38))
            .fontWeight(.semibold)
            .padding()
        
    }
    
    private var warning: some View {
        HStack(alignment: .top){
            Image(systemName: "exclamationmark.warninglight.fill")
                .foregroundColor(.orange)
                .padding(.top)
            VStack(alignment: .leading){
                Text("Отмена и изменение времени приема может стоит денег.")
                    .foregroundColor(.brown)
                    .font(.system(size: 20))
                Button(action: {
                    
                }, label: {
                    Text("Подробнее")
                        .foregroundStyle(Color.brown)
                        .bold()
                })
                .padding()
                .background(Color.white)
                .cornerRadius(16)
                .padding(.bottom)
                
            }
            .padding(.top)
        }
        .frame(maxWidth: .infinity)
        .background(Color("beige"))
        .cornerRadius(16)
        .padding()
    }
    
    private func dateFormat(dateOfData: String) -> String {
        let format = DateFormatter()
        format.dateFormat = Date().displayFormat
        
        
        let d = format.date(from: dateOfData)!
        return format.string(from: d)
    }
    
    
    private func dateToString(index: Int, dataDate: PostViewModel) -> String{
        
        let dateString = dataDate.posts.slots[index].datetime
        let dateFormat = DateFormatter()
        dateFormat.locale = Locale(identifier: "ru_RU")
        dateFormat.dateFormat = "yyyy-MM-dd'T'HH:mm:ss"
        let date = dateFormat.date(from: dateString)?.displayFormat ?? ""
        
        return date
    }
    
    private func date(title: String) -> some View {
        
        Text(title)
            .font(.system(size: 28))
            .fontWeight(.bold)
            .foregroundColor(.gray).opacity(0.8)
            .padding(.leading)
    }
    
    private func time(time: String, price: String, id: Int) -> some View{
        Button(action: {
            self.id = id
        }, label: {
            VStack{
                Text(time)
                    .fontWeight(.bold)
                    .foregroundColor( self.id == id ? .white : .black)
                    .padding(.top)
                Text(price)
                    .fontWeight(.bold)
                    .foregroundColor(self.id == id ? .white : .gray)
                    .frame(maxWidth: .infinity)
            }
            .padding(.bottom)
        })
        .background(self.id == id ? Color("MyCustomPurple") : Color.blue.opacity(0.06))
        .cornerRadius(16)
    }
    
    
     private var selectFormat : some View  {
         HStack{
             onlineBtn
             offlineBtn
         }
         .background(
             RoundedRectangle(cornerRadius: 16)
                 .fill(Color.clear)
         )
         .overlay(
             RoundedRectangle(cornerRadius: 16)
                 .stroke(Color.gray, lineWidth: 1)
         )
         .padding()
     }
    

    private var onlineBtn: some View {
        variantBtns(text: "Онлайн", index: .online)
    }
    
    private var offlineBtn: some View {
        variantBtns(text: "Оффлайн", index: .offline)
    }
    
    private func variantBtns(text: String, index: variants) -> some View{
        return Button(action: {
            format = index
        }, label: {
            Text(text)
                .frame(alignment: .center)
                .font(.system(size: 16, weight: .bold))
                .foregroundColor(format == index ? .white : .black)
                .padding()
                .frame(maxWidth: .infinity)
        })
        .background(format == index ? Color.blue : Color.white)
        .cornerRadius(16)
        .frame(maxWidth: .infinity)
        .padding(5)
    }
    
    
}

#Preview {
    selectDataView()
}

extension Date {
    var displayFormat: String{
        
        let dateFormatter = DateFormatter()
                dateFormatter.locale = Locale(identifier: "ru_RU")
                dateFormatter.setLocalizedDateFormatFromTemplate("dMMMMEEEE")
                return dateFormatter.string(from: self)
    }
}

extension String {

    var length: Int {
        return count
    }

    subscript (i: Int) -> String {
        return self[i ..< i + 1]
    }

    func substring(fromIndex: Int) -> String {
        return self[min(fromIndex, length) ..< length]
    }

    func substring(toIndex: Int) -> String {
        return self[0 ..< max(0, toIndex)]
    }

    subscript (r: Range<Int>) -> String {
        let range = Range(uncheckedBounds: (lower: max(0, min(length, r.lowerBound)),
                                            upper: min(length, max(0, r.upperBound))))
        let start = index(startIndex, offsetBy: range.lowerBound)
        let end = index(start, offsetBy: range.upperBound - range.lowerBound)
        return String(self[start ..< end])
    }
}
