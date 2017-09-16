import Cocoa

class EventView: NSView {

    private var event = Event(title: "New Event", colorHex: "FFFFFF", span: DateInterval(start: Date(), end: Date()))
    let titleTextField = NSTextField(string: "Event Title")
    let startDatePicker = NSDatePicker()
    var endDatePicker = NSDatePicker()
    var eventEventsDelegate: EventEventsDelegate? = nil
    
    convenience init(event: Event) {
        self.init(frame: NSRect.zero)
        
        self.event = event
        
        titleTextField.stringValue = event.title
        startDatePicker.dateValue = event.span.start
        endDatePicker.dateValue = event.span.end
    }
    
    override init(frame frameRect: NSRect) {
        super.init(frame: frameRect)
        
        // Title text field
        if #available(OSX 10.12.2, *) { titleTextField.allowsCharacterPickerTouchBarItem = true }
        titleTextField.isBezeled = false
        titleTextField.isBordered = false
        titleTextField.drawsBackground = false
        titleTextField.target = self
        titleTextField.action = #selector(titleChange)
        addSubview(titleTextField)
        titleTextField.translatesAutoresizingMaskIntoConstraints = false
        titleTextField.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        titleTextField.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        titleTextField.widthAnchor.constraint(equalTo: self.widthAnchor).isActive = true
        titleTextField.heightAnchor.constraint(equalToConstant: 20.0).isActive = true

        // Start date picker
        startDatePicker.target = self
        startDatePicker.action = #selector(startDateChange)
        addSubview(startDatePicker)
        startDatePicker.translatesAutoresizingMaskIntoConstraints = false
        startDatePicker.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        startDatePicker.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        startDatePicker.trailingAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        startDatePicker.heightAnchor.constraint(equalToConstant: 20.0).isActive = true
        
        // End date picker
        endDatePicker.target = self
        endDatePicker.action = #selector(endDateChange)
        addSubview(endDatePicker)
        endDatePicker.translatesAutoresizingMaskIntoConstraints = false
        endDatePicker.leadingAnchor.constraint(equalTo: startDatePicker.trailingAnchor).isActive = true
        endDatePicker.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
        endDatePicker.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        endDatePicker.heightAnchor.constraint(equalToConstant: 20.0)
    }
    
    @objc func titleChange() {
        eventEventsDelegate?.change(title: titleTextField.stringValue, forEventId: event.id)
    }
    
    @objc func startDateChange() {
        eventEventsDelegate?.change(startDate: startDatePicker.dateValue, forEventId: event.id)
    }
    
    @objc func endDateChange() {
        eventEventsDelegate?.change(endDate: endDatePicker.dateValue, forEventId: event.id)
    }
    
    required init?(coder decoder: NSCoder) {
        super.init(coder: decoder)
    }
    
    override func draw(_ dirtyRect: NSRect) {
        NSColor.lightGray.set()
        let topLine = NSBezierPath(rect: NSRect(x: 0, y: dirtyRect.height - 0.5, width: dirtyRect.size.width, height: 0.5))
        topLine.fill()
    }
    
}
