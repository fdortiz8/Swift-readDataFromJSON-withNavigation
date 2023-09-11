//
//  MessageDetail.swift
//  Assignment5
//
//  Created by Fernando Ortiz on 7/12/23.
//

import SwiftUI

struct MessageDetail: View {
	
	let message: Message
	
    var body: some View {
		VStack {
			List {
				MessageDetailCard(message: message)
			}
		}
		.navigationTitle("\(message.member.name)")
    }
}


//struct MessageDetail_Previews: PreviewProvider {
//    static var previews: some View {
//        MessageDetail()
//    }
//}
