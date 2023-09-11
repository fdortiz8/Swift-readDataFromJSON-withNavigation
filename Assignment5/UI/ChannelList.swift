//
//  ChannelList.swift
//  Assignment5
//
//  Created by Fernando Ortiz on 7/12/23.
//

import SwiftUI

struct ChannelList: View {
	
	let workspace: Workspace
	
    var body: some View {
		VStack {
			List {
				ForEach(workspace.channels!) { channel in
					NavigationLink(destination: MessageList(channel: channel)) {
						ChannelCard(channel: channel)
					}
				}
			}
		}
		.navigationTitle("\(workspace.name)")
		.padding(0)
    }
}

//struct ChannelList_Previews: PreviewProvider {
//    static var previews: some View {
//        ChannelList()
//    }
//}
