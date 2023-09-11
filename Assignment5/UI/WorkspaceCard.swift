//
//  WorkspaceCard.swift
//  Assignment5
//
//  Created by Fernando Ortiz on 7/12/23.
//

// https://sarunw.com/posts/getting-number-of-days-between-two-dates/
import SwiftUI

struct WorkspaceCard: View {
	
	var workspace: Workspace
	
	var uniqueNames: [String] {
		var names = Set<String>()
		
		for channel in workspace.channels! {
			for message in channel.messages! {
				names.insert(message.member.name)
			}
		}
		return Array(names)
	}
	
	var mostRecent: [Date]? {
		var listRecentDates = Set<Date>()
		
		for channel in workspace.channels ?? []{
			if let messages = channel.messages {
				listRecentDates.formUnion(messages.compactMap { $0.posted })
				   }
		}
		let sortedDates = listRecentDates.sorted(by: >)
		return sortedDates.isEmpty ? nil : sortedDates
	}
	
	var calculatedDate: String? {
		let listOfDates = mostRecent
		
		guard let mostRecentDate = listOfDates?[0] else { return "" }
		
		let calendar = Calendar.current
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
			Text("\(workspace.name)")
			
			HStack {
				Spacer()
				Image(systemName: "folder")
				Text("\(workspace.channels!.count)")
				Spacer()
				Image(systemName: "person.3")
				Text("\(uniqueNames.count)")
				Spacer()
				Image(systemName: "clock")
				Text(calculatedDate! )
				Spacer()
			}
			.padding(1)
		}
	}
}

//struct WorkspaceCard_Previews: PreviewProvider {
//    static var previews: some View {
//        WorkspaceCard()
//    }
//}
