//
//  ContentView.swift
//  Rethink Test Project
//
//  Created by Zion Tuiasoa on 7/12/23.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var viewModel = ViewModel()
    @State private var showAlert = false
   
    var body: some View {
        NavigationView {
            List(viewModel.users?.map { $0.asListItem() } ?? [], children: \.children) { item in
                switch item.itemType {
                case .user(let user):
                    UserView(user: user)
                case .post(let post):
                    PostView(post: post)
                case .comment(let comment):
                    CommentView(comment: comment)
                case .info(let info):
                    Text(info)
                }
            }
            .tint(.orange)
            .listRowSeparator(.hidden)
            .listStyle(InsetGroupedListStyle())
            .task {
                await viewModel.fetchData()
            }
            .navigationTitle("Zion Tuiasoa - Rethink")
            .toolbar {
                Button("Count") {
                    showAlert = true
                }
                .alert(isPresented: $showAlert) {
                    Alert(title: Text("Total Object Count"), message: Text("User count: \(viewModel.users?.count ?? 0) \n Post count: \(viewModel.postsCount) \n CommentCount: \(viewModel.commentsCount)"), dismissButton: .default(Text("OK")))
                }.buttonStyle(CustomButton())
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
