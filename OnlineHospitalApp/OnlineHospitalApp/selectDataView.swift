//
//  selectDataView.swift
//  OnlineHospitalApp
//
//  Created by bakebrlk on 08.10.2023.
//

import SwiftUI

struct selectDataView: View {

    
    @StateObject private var dataDate = PostViewModel()
    @State private var id: Int = -1

    var body: some View {
       
        
        VStack(alignment: .leading){
            title

            warning
            ScrollView{
                
                ForEach(dataDate.posts.slots, id: \.self){ data in
                    if(dataDate.indexes.contains(data.id)){
                        VStack(alignment: .leading){
                            let dateString = dateToString(index: data.id - 1)
                            date(title: dateString)
                            
                            source(day: Int(data.datetime[8..<10]) ?? 0)
                        }
                    }
                }
                
            }
            Spacer()
            
            moreBtn
            
        }.onAppear {
            dataDate.fetchPosts()
            
        }
       
    }
    
    private func source(day: Int) -> some View {
        
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
  
    
    private func dateToString(index: Int) -> String{
        
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
    
    private var moreBtn : some View = {
        return Button(action: {
            
        }, label: {
            Text("Показать еще")
                .frame(maxWidth: .infinity)
                .fontWeight(.bold)
                .foregroundColor(.black)
                .padding()
        })
        .background(
            RoundedRectangle(cornerRadius: 30)
                .fill(Color.clear)
        )
        .overlay(
            RoundedRectangle(cornerRadius: 30)
                .stroke(Color.gray, lineWidth: 2)
        )
        .padding()
    }()
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
