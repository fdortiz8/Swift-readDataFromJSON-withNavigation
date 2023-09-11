//
//  MessageList.swift
//  Assignment5
//
//  Created by Fernando Ortiz on 7/12/23.
//

import SwiftUI

//https://stackoverflow.com/questions/24130026/how-to-sort-an-array-of-custom-objects-by-property-value-in-swift
struct MessageList: View {
	
	let channel: Channel
	
	var sortedMessages: [Message] {
		channel.messages?.sorted(by: { $0.posted > $1.posted }) ?? []
	}
	
    var body: some View {
		VStack {
			List {
				ForEach(sortedMessages) { message in
					NavigationLink(destination: MessageDetail(message: message)) {
						MessageCard(message: message)
					}
				}
			}
		}
		.navigationTitle("\(channel.name)")
    }
}

//struct MessageList_Previews: PreviewProvider {
//    static var previews: some View {
//        MessageList()
//    }
//}
