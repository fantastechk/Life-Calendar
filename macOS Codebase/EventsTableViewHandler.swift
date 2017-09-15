import Cocoa

/// A handler object which provides the data source and delegation methods for a table view which displays the events of timeline.
class EventsTableViewHandler: NSObject, NSTableViewDelegate, NSTableViewDataSource {

    /// A reference to the timeline object which contains the events which will be displayed by the table view. This property is usually set by a view controller which owns this object.
    var timeline: Timeline!
    
    weak var viewController: WeeksViewController? = nil
    
    // MARK: DataSource stuff
    
    func numberOfRows(in tableView: NSTableView) -> Int {
        return timeline.events.count
    }
    
    // MARK: Delegate stuff
    
    func tableView(_ tableView: NSTableView, heightOfRow row: Int) -> CGFloat {
        return CGFloat(60)
    }
    
    func tableView(_ tableView: NSTableView, viewFor tableColumn: NSTableColumn?, row: Int) -> NSView? {
        let event = timeline.events[row]
        let eventView = EventView(event: event)
        
        eventView.eventEventsDelegate = viewController

        return eventView
    }
    
    func tableView(_ tableView: NSTableView, rowViewForRow row: Int) -> NSTableRowView? {
        let sidebarTableRowView = EventsTableRowView(frame: NSRect.zero)
        
        return sidebarTableRowView
    }
    
}


