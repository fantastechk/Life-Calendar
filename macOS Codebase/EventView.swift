import Cocoa

class EventView: NSView {

    private var event: Event
    
    convenience init(event: Event) {
        self.init(frame: NSRect.zero)
        
        self.event = event
    }
    
    override init(frame frameRect: NSRect) {
        event = Event(title: "Default Event", colorHex: "FFFFFF", span: DateInterval(start: Date(), end: Date()))
        
        super.init(frame: frameRect)
    }
    
    required init?(coder decoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func draw(_ dirtyRect: NSRect) {
        NSColor.lightGray.set()
        let topLine = NSBezierPath(rect: NSRect(x: 0, y: dirtyRect.height - 0.5, width: dirtyRect.size.width, height: 0.5))
        topLine.fill()
        
        let topLeftPoint = CGPoint(x: 5, y: dirtyRect.height)
        let titlePosition = CGPoint(x: topLeftPoint.x, y: topLeftPoint.y - 23)
        let title = NSString(string: event.title)
        title.draw(at: titlePosition, withAttributes: nil)
        
        let formatter = DateFormatter()
        formatter.dateFormat = "MMM d, yyyy"
        
        let startDate = formatter.string(from: event.span.start)
        let endDate = formatter.string(from: event.span.end)
        
        let dates = NSString(string: "\(startDate) - \(endDate)")
        dates.draw(at: NSPoint(x: 5, y: 20), withAttributes: nil)
    }
    
}