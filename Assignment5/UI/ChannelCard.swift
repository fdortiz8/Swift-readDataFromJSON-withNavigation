//
//  ChannelCard.swift
//  Assignment5
//
//  Created by Fernando Ortiz on 7/12/23.
//

import SwiftUI

// https://serialcoder.dev/text-tutorials/swift-tutorials/higher-order-functions-in-swift-map-compactmap-flatmap/
// https://stackoverflow.com/questions/28861741/get-the-object-with-the-most-recent-date
// https://stackoverflow.com/questions/24130026/how-to-sort-an-array-of-custom-objects-by-property-value-in-swift
// https://serialcoder.dev/text-tutorials/swift-tutorials/higher-order-functions-in-swift-foreach-filter-sorted/
// https://stackoverflow.com/questions/49576235/how-to-get-distinct-values-from-an-array-of-classes
struct ChannelCard: View {
	var channel : Channel
	
	var uniqueNames: [String] {
		Set(channel.messages?.compactMap {$0.member.name} ?? []).sorted()
	}
	var mostRecent: Date? {
		channel.messages?.max(by: {$0.posted < $1.posted })?.posted
	}
	
	var calculatedDate: String {
		guard let mostRecentDate = mostRecent else {
			return ""
		}
		
		let calendar = Calendar.current
		//let today = Date()
		let currentDate = Date()
		let dateComponents = calendar.dateComponents([.day, .hour, .minute, .second], from: mostRecentDate, to : currentDate)
		if dateComponents.day! > 1 && dateComponents.hour! > 12{
			return "\(dateComponents.day! + 1) days"
		} else if dateComponents.day! > 1{
			return "\(dateComponents.day!) days"
		}else if dateComponents.hour! > 1{
			return "\(dateComponents.hour!) hours"
		} else if dateComponents.minute! > 1{
			return "\(dateComponents.minute!) mins"
		} else if dateComponents.second! > 1 {
			return "\(dateComponents.second!) secs"
		}
		else {
			return ""
		}

	}
	
    var body: some View {
		VStack(alignment: .leading) {
			Text("\(channel.name)")
			HStack {
				Spacer()
				Image(systemName: "envelope")
				Text("\(channel.messages!.count)")
				Spacer()
				Image(systemName: "person.3")
				Text("\(uniqueNames.count)")
				Spacer()
				Image(systemName: "clock")
				Text(calculatedDate)
				Spacer()
			}
		}
    }
}

//struct ChannelCard_Previews: PreviewProvider {
//    static var previews: some View {
//        ChannelCard()
//    }
//}
