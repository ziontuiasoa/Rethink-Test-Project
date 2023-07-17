//
//  ContentView.swift
//  Rethink Test Project
//
//  Created by Zion Tuiasoa on 7/12/23.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var viewModel = ViewModel()
   
    var body: some View {
        List(viewModel.users?.map { $0.asListItem() } ?? [], children: \.children) { item in
            switch item.itemType {
            case .user(let user):
//                UserView(user: user)
                Text(user.name)
            case .post(let post):
                Text(post.title)
            case .comment(let comment):
                Text(comment.name)
            case .info(let info):
                Text(info)
            }
        }
        .listStyle(InsetGroupedListStyle())
        .listRowSeparator(.hidden)
        .task {
            await viewModel.fetchData()
        }.onTapGesture {
            print("tapped")
        }
    }
}

struct UserView: View {
    
    var user: User
    
    var body: some View {
        HStack {
            Text(user.name)
            Spacer()
            Button(action: {
                //
            }, label: {
                Image(systemName: "circle")
                    .foregroundColor(.black)
            })
        }
    }
}

struct PostView: View {
    
    var body: some View {
        HStack {
            Text("")
            Spacer()
            Button(action: {
                
            }, label: {
                /*@START_MENU_TOKEN@*/Text("Button")/*@END_MENU_TOKEN@*/
            })
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
