

import SwiftUI

extension Workspace {
	static func fromJSONResource(name: String) -> [Workspace] {
		if let bundlePath = Bundle.main.path(forResource: "Workspaces", ofType: "json") {
			do {
				if let jsonData = try String(contentsOfFile: bundlePath).data(using: .utf8) {
					let myDecoder = JSONDecoder()
					myDecoder.dateDecodingStrategy = .iso8601
					return try myDecoder.decode([Workspace].self, from: jsonData)
				}
			} catch {
				print("Error decoding JSON: \(error)")
			}
		}
		return []
	}
}

struct Assignment5View: View {
	
	@State private var workspaces: [Workspace] = Workspace.fromJSONResource(name: "Workspaces")
	
	var body: some View {
		VStack {
			List {
				ForEach(workspaces) { workspace in
					NavigationLink(destination: ChannelList(workspace: workspace)) {
						WorkspaceCard(workspace: workspace)
					}
				}
			}
			.navigationTitle("Workspaces")
		}
	}
}

#if !TESTING
struct Assignment5View_Previews: PreviewProvider {
	static var previews: some View {
		Assignment5View()
	}
}
#endif
