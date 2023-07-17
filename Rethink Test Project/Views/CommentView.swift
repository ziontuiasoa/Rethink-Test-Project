//
//  CommentView.swift
//  Rethink Test Project
//
//  Created by Kevin Hartley on 7/17/23.
//

import SwiftUI

struct CommentView: View {
    var comment: Comment
    
    var body: some View {
        HStack {
            Image(systemName: "text.bubble.fill")
                .foregroundColor(.orange)
            Text(comment.name)
            Spacer()
        }
    }
}
