//
//  PostView.swift
//  Rethink Test Project
//
//  Created by Kevin Hartley on 7/17/23.
//

import SwiftUI

struct PostView: View {
    var post: Post
    
    var body: some View {
        HStack {
            Image(systemName: "mail.fill")
                .foregroundColor(.orange)
            Text(post.title)
            Spacer()
        }
    }
}
