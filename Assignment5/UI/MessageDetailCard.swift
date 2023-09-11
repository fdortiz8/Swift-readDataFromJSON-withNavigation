//
//  MessageDetailCard.swift
//  Assignment5
//
//  Created by Fernando Ortiz on 7/12/23.
//

import SwiftUI

struct MessageDetailCard: View {
	let message: Message

	
	var body: some View {
		
		VStack(alignment: .leading) {
			
			Text("\(message.content)")
			
			
			Text(formatDate(message.posted))
				.frame(maxWidth: .infinity, alignment: .trailing)
				.font(.system(size: 12))
				.padding(1)
			
			
		}
	}
	private func formatDate(_ date: Date) -> String {
		let dateFormatter = DateFormatter()
		dateFormatter.dateFormat = "MMM dd, yyyy 'at' h:mm a"
		return dateFormatter.string(from:date)
	}
}

//struct MessageDetailCard_Previews: PreviewProvider {
//    static var previews: some View {
//        MessageDetailCard()
//    }
//}
