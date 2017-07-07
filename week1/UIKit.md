# UIKit

## App Structure
#### Core App
- Application
  - UIApplication : The centralized point of control and coordination for apps running in iOS. (iOS 2.0+)
- Device Environment
  - UIDevice : A representation of the current device. (iOS 2.0+)
  - UITraitCollection : The iOS interface environment for your app, defined by traits such as horizontal and vertical size class, display scale, and user interface idiom. (iOS 8.0+)
- Documents
  - UIDocument : An abstract base class for managing discrete portions of your app's data. (iOS 5.0+)
  - UIManagedDocument : A managed document object that integrates with Core Data. (iOS 5.0+)
- Pasteboard
  - UIPasteboard : An object that helps a user share data from one place to another within your app, and from your app to other apps. (iOS 3.0+)
  - UIPasteConfiguration : A paste configuration for use by responder objects to declare their ability to accept specific data types for pasting and for drag-and-drop activities. (iOS 11.0+ beta)
#### Resource Management
- Storyboards
 - UIStoryboard : An encapsulation of the design-time view controller graph represented in an Interface Builder storyboard resource file. (iOS 5.0+)
 - UIStoryboardSegue : An object that prepares for and performs the visual transition between two view controllers. (iOS 5.0+)
 - UIStoryboardUnwindSegueSource : An encapsulation of information about an unwind segue. (iOS 9.0+)
- Assets
 - UIImageAsset : A container for a collection of images that represent multiple ways of describing a single piece of artwork. (iOS 8.0+)
 - NSDataAsset : An object from a data set type stored in an asset catalog. (iOS 9.0+)
- Nib Files
 - UINib : An object that wraps, or contains, Interface Builder nib files. (iOS 4.0+)
#### App Extensions
- Document Provider
 - UIDocumentPickerExtensionViewController : The principal class for the Document Picker View Controller extension. (iOS 8.0+)
 - NSFileProviderExtension : The principal class for the File Provider extension. (iOS 8.0+)
- Custom Keyboard
 - UIInputViewController : The primary view controller for a custom keyboard app extension. (iOS 8.0+)
 - UILexicon : A read-only array of term pairs, each in a lexicon entry object, for use by a custom keyboard. (iOS 8.0+)
 - UILexiconEntry : A read-only term pair, available within a lexicon object, for use by a custom keyboard. (iOS 8.0+)

## User Interface
#### Views and Controls
- First Steps
  - UIView : An object that represents a rectangular area on the screen and manages the content in that area.
- Container Views (Collection Views)

- Container Views (TableViews)
  - View
    - UITableView : A view that presents data using rows arranged in a single column. (iOS 2.0+)
    - UITableViewController : A controller object that manages a table view. (iOS 2.0+)
    - UITableViewFocusUpdateContext : A context object that provides information relevant to a specific focus update from one view to another. (iOS 9.0+)
    - UILocalizedIndexedCollation : An object that provides ways to organize, sort, and localize the data for a table view that has a section index.
  - Rows
    - UITableViewCell : A cell in a table view.
    - UISwipeActionsConfiguration : The set of actions to perform when swiping on rows of a table. (Beta)
    - UIContextualAction : An action to display when the user swipes a table row. (Beta)
    - UITableViewRowAction : A single action to present when the user swipes horizontally in a table row.
    - enum UIContextualAction.Style : Constants indicating the style information that is applied to the action button. (Beta)

  - Headers and Footers
    - UITableViewHeaderFooterView : A reusable view that can be placed at the top or bottom of a table section to display additional information for that section.
      -Adornments
    - UIRefreshControl :A standard control that can initiate the refreshing of a table view’s contents.
  - Drag and Drop
    - protocol UITableViewDragDelegate : The interface for initiating drags from a table view. (Beta)
    - protocol UITableViewDropDelegate : The interface for handling drops in a table view. (Beta)
    - protocol UITableViewDropCoordinator : An interface for coordinating your custom drop-related actions with the table view. (Beta)
    - UITableViewDropProposal : Your proposed solution for handling a drop in a table view. (Beta)
    - protocol UITableViewDropItem : The data associated with an item being dropped into the table view. (Beta)
    - protocol UITableViewDropPlaceholderContext :An object that you insert temporarily into the table view while waiting to receive the actual data that you plan to display. (Beta)
    - protocol UIDataSourceTranslating : An advanced interface for managing a data source object. (Beta)
- Container Views (..)
  - UIStackView : A streamlined interface for laying out a collection of views in either a column or a row. (iOS 9.0+)
  - UIScrollView : A view that allows the scrolling and zooming of its contained views. (iOS 2.0+)
- Content Views
  - UIActivityIndicatorView : A view that shows that a task is in progress. (iOS 2.0+)
  - UIImageView : An object that displays a single image or a sequence of animated images in your interface. (iOS 2.0+)
  - UIPickerView : A view that uses a spinning-wheel or slot-machine metaphor to show one or more sets of values. (iOS 2.0+)
  - UIProgressView : A view that depicts the progress of a task over time. (iOS 2.0+)
  - UIWebView : A view that embeds web content in your app. (iOS 2.0+)
- Controls
  - UIControl : The base class for controls, which are visual elements that convey a specific action or intention in response to user interactions. (iOS 2.0+)
  - UIButton : A control that executes your custom code in response to user interactions. (iOS 2.0+)
  - UIDatePicker : A control used for the inputting of date and time values. (iOS 2.0+)
  - UIPageControl : A control that displays a horizontal series of dots, each of which corresponds to a page in the app’s document or other data-model entity. (iOS 2.0+)
  - UISegmentedControl : A horizontal control made of multiple segments, each segment functioning as a discrete button. (iOS 2.0+)
  - UISlider : A control used to select a single value from a continuous range of values. (iOS 2.0+)
  - UIStepper : A control used to increment or decrement a value. (iOS 5.0+)
  - UISwitch : A control that offers a binary choice, such as On/Off. (iOS 2.0+)
- Text Views
  - UILabel : A view that displays one or more lines of read-only text, often used in conjunction with controls to describe their intended purpose. (iOS 2.0+)
  - UITextField : An object that displays an editable text area in your interface. (iOS 2.0+)
  - UITextView : A scrollable, multiline text region.
- Bars
  - class UIBarItem : An abstract superclass for items that can be added to a bar that appears at the bottom of the screen. (iOS 2.0+)
  - UIBarButtonItem : A button specialized for placement on a toolbar or tab bar. (iOS 2.0+)
  - UIBarButtonItemGroup : A set of bar button items on the shortcuts bar above the keyboard on iPad. (iOS 9.0+)
  - UINavigationBar : A control that supports navigation of hierarchical content, most often used in navigation controllers. (iOS 2.0+)
  - UISearchBar : A text field–like control that supports text-based searches. (iOS 2.0+)
  - UIToolbar : A control that displays one or more buttons along the bottom edge of your interface. (iOS 2.0+)
  - UITabBar : A control that displays one or more buttons in a tab bar for selecting between different subtasks, views, or modes in an app. (iOS 2.0+)
  - UITabBarItem : An item in a tab bar. (iOS 2.0+)
  - protocol UIBarPositioning : A set of methods for defining the ways that bars can be positioned in iOS apps. (iOS 7.0+)
  - protocol UIBarPositioningDelegate : A set of methods that support the positioning of a bar that conforms to the UIBarPositioning protocol (iOS 7.0+)
    -Menus
  - UIMenuController : The menu interface for the Cut, Copy, Paste, Select, Select All, and Delete commands.
  - UIMenuItem : A custom item in the editing menu managed by the UIMenuController object.
- Visual Adornments
  - UIVisualEffect : An initializer for visual effect views and blur and vibrancy effect objects. (iOS 8.0+)
  - UIVisualEffectView : An object that implements some complex visual effects. (iOS 8.0+)
  - UIVibrancyEffect : An object that amplifies and adjusts the color of the content layered behind a visual effect view. (iOS 8.0+)
  - UIBlurEffect : An object that applies a blurring effect to the content layered behind a visual effect view. (iOS 8.0+)
- Appearance Customization
  - protocol UIAppearance : A collection of methods that gives you access to the appearance proxy for a class. (iOS 5.0+)
  - protocol UIAppearanceContainer : A protocol that a class must adopt to allow appearance customization using the UIAppearance API. (iOS 5.0+)
- Related Types
  - struct UIEdgeInsets : The inset distances for views. (iOS 2.0+)
  - struct NSDirectionalEdgeInsets : Edge insets that take language direction into account. (Beta)
  - struct UIOffset : Defines a structure that specifies an amount to offset a position. (iOS 5.0+)

## Event Handling
#### Touches, Presses, and Gestures
- First Step
  - UIResponder : An abstract interface for responding to and handling events. (iOS 2.0+)
  - UIEvent : An object that describes a single user interaction with your app. (iOS 2.0+)
- Touches
  - UITouch : An object representing the location, size, movement, and force of a touch occurring on the screen. (iOS 2.0+)
- ButtonPress
  - UIPress : An object that represents the presence or movement of a button press on the screen for a particular event. (iOS 9.0+)
  - UIPressesEvent : An event that describes the state of a set of physical buttons that are available to the device, such as those on an associated remote or game controller. (iOS 9.0+)
- UIKit Gestures
  - UILongPressGestureRecognizer: A concrete subclass of UIGestureRecognizer that looks for long-press gestures. (iOS 3.2+)
  - UIPanGestureRecognizer: A concrete subclass of UIGestureRecognizer that looks for panning (dragging) gestures. (iOS 3.2+)
  - UIPinchGestureRecognizer: A concrete subclass of UIGestureRecognizer that looks for pinching gestures involving two touches. (iOS 3.2+)
  - UIScreenEdgePanGestureRecognizer: A gesture recognizer that looks for panning (dragging) gestures that start near an edge of the screen. (iOS 7.0+)
  - UISwipeGestureRecognizer: A concrete subclass of UIGestureRecognizer that looks for swiping gestures in one or more directions. (iOS 3.2+)
  - UIRotationGestureRecognizer: A concrete subclass of UIGestureRecognizer that looks for rotation gestures involving two touches. (iOS 3.2+)
  - UITapGestureRecognizer: A concrete subclass of UIGestureRecognizer that looks for single or multiple taps. (iOS 3.2+)
- Custom Gestures
  - UIGestureRecognizer : The base class for concrete gesture recognizers. (iOS 3.2+)
#### Peek and Pop
- Preview
  - UIPreviewAction : A preview action, or *peek quick action*, that is displayed below a peek when a user swipes the peek upward. (iOS 9.0+)
  - UIPreviewActionGroup : A group of one or more child quick actions, each an instance of the UIPreviewAction class. (iOS 9.0+)
  - UIPreviewInteraction : A class that registers a view to provide a custom user experience in response to 3D Touch interactions. (iOS 10.0+)
- HomeScreen
  - UIApplicationShortcutIcon : An image you can optionally associate with a Home screen quick action to improve its appearance and usability. (iOS 9.0+)
  - UIApplicationShortcutItem : An application shortcut item, also called a *Home screen dynamic quick action*, that specifies a user-initiated action for your app. (iOS 9.0+)
  - UIMutableApplicationShortcutItem : An item that specifies a configurable user-initiated action for your app (the item is also called a mutable Home screen dynamic quick action). (iOS 9.0+)
#### Keyboard and Menus
- Keyboard
  - UIKeyCommand : An object that specifies a key press performed on a hardware keyboard and the resulting action that should take place. (iOS 7.0+)
- Menus
  - UIMenuController : The menu interface for the Cut, Copy, Paste, Select, Select All, and Delete commands. (iOS 3.0+)
  - UIMenuItem :A custom item in the editing menu managed by the UIMenuController object. (iOS 3.2+)
- Custom Input
  - UIInputView : An object that displays and manages custom input for a view when that view becomes the first responder. (iOS 7.0+)

## Graphics, Drawing, and Printing
#### Images and PDF
- Representation
 - UIImage : An object that manages image data in your app. (iOS 2.0+)
#### Drawing
- Drawing Contexts
 - UIGraphicsRenderer : An abstract base class for creating graphics renderers. (iOS 10.0+)
 - UIGraphicsRendererContext : The base class for the drawing environments associated with graphics renderers. (iOS 10.0+)
 - UIGraphicsRendererFormat : A set of drawing attributes that represent the configuration of a graphics renderer context. (iOS 10.0+)
 - UIGraphicsImageRenderer : A graphics renderer for creating Core Graphics-backed images. (iOS 10.0+)
 - UIGraphicsImageRendererContext : The drawing environment associated with an image renderer. (iOS 10.0+)
 - UIGraphicsImageRendererFormat : A set of drawing attributes that represent the configuration of a image renderer context. (iOS 10.0+)
 - UIGraphicsPDFRenderer : A graphics renderer for creating PDFs. (iOS 10.0+)
 - UIGraphicsPDFRendererContext : A drawing environment associated with a PDF renderer. (iOS 10.0+)
 - UIGraphicsPDFRendererFormat : A set of drawing attributes that represents the configuration of a PDF renderer context. (iOS 10.0+)
- Color
 - UIColor : An object that stores color data and sometimes opacity (alpha value). (iOS 2.0+)
- Paths
 - UIBezierPath : A path that consists of straight and curved line segments that you can render in your custom views. (iOS 3.2+)
- Strings
  - NSStringDrawingContext : An object that manages metrics used when drawing attributed strings. (iOS 6.0+)
- Shadows
 - NSShadow : An encapsulation of the attributes used to create a drop shadow during drawing operations. (iOS 6.0+)
#### Printing
- Print Panels
 - UIPrintInteractionController : A printing user interface that manages the printing of documents, images, and other printable content in iOS. (iOS 4.2+)
 - UIPrinterPickerController : The system interface for selecting a printer. (iOS 8.0+)
- Renderer
 - UIPrintPageRenderer : An object that draws pages of content that are to be printed, with or without the assistance of print formatters. (iOS 4.2+)
- Job Info
 - UIPrinter : A printer on the network. (iOS 8.0+)
 - UIPrintInfo : Information about a print job. (iOS 4.2+)
 - UIPrintPaper : The size of paper used for a print job and the rectangle in which content can be printed. (iOS 4.2+)
- Formatters
 - UIPrintFormatter : An abstract base class for print formatters, which are objects that lay out custom printable content that can cross page boundaries. (iOS 4.2+)
 - UIViewPrintFormatter : An object that lays out the drawn content (which can span multiple pages) of a view for printing. (iOS 4.2+)
 - UISimpleTextPrintFormatter : An object that lays out plain text for printing, possibly over multiple pages. (iOS 4.2+)
 - UIMarkupTextPrintFormatter : An object that lays out HTML markup text for a multipage print job. (iOS 4.2+)

## Text
#### Text Display and Fonts
- Layout
 - NSLayoutManager : An object that coordinates the layout and display of characters held in an NSTextStorage object. (iOS 7.0+)
- Text Views
 - UILabel : A view that displays one or more lines of read-only text, often used in conjunction with controls to describe their intended purpose. (iOS 2.0+)
 - UITextField : An object that displays an editable text area in your interface. (iOS 2.0+)
 - UITextView : A scrollable, multiline text region. (iOS 2.0+)
- Fonts
 - UIFont : The interface for getting and setting font information. (iOS 2.0+)
 - UIFontDescriptor : A mechanism to describe a font with a dictionary of attributes. (iOS 7.0+)
 - UIFontMetrics (iOS 11.0+ beta)
- Spell Checking
 - UITextChecker : An object you use to check a string (usually the text of a document) for misspelled words. (iOS 3.2+)
#### Text Storage
- Data
 - NSTextStorage : The fundamental storage mechanism of TextKit. (iOS 7.0+)
 - NSTextContainer : A region where text is laid out. (iOS 7.0+)
 - NSAttributedString : A string that has associated attributes (such as visual style, hyperlinks, or accessibility data) for portions of its text. (iOS 3.2+)
- Metrics
 - UITextPosition : A position in a text container—that is, an index into the backing string in a text-display view. (iOS 3.2+)
 - UITextRange : A range of characters in a text container, identified by a starting index and an ending index in string backing a text-entry object. (iOS 3.2+)
 - UITextSelectionRect : An encapsulation of information about a selected range of text in a document. (iOS 6.0+)
- Paragraphs
 - NSParagraphStyle : The paragraph or ruler attributes used by an attributed string. (iOS 6.0+)
 - NSMutableParagraphStyle : An object that enables changing the values of the subattributes in a paragraph style attribute. (iOS 6.0+)
 - NSTextTab : A tab in an NSParagraphStyle object, storing an alignment type and location. (iOS 7.0+)
- Attachments
 - NSTextAttachment : The values for the attachment attributes of attributed strings and related objects. (iOS 7.0+)
#### Keyboards and Input
- Configuration
 - UITextInputAssistantItem : Configure the system keyboard, or create your own keyboards and handle input yourself. (iOS 9.0+)
- Input
 - UITextInputMode : The current text-input mode. (iOS 4.2+)
 - UITextInputStringTokenizer : A base implementation of the UITextInputTokenizer protocol. (iOS 3.2+)
 - UIDictationPhrase : An object that represents the textual interpretation of a spoken phrase as dictated by a user. (iOS 5.1+)
- Custom Keyboards
 - UIInputViewController : The primary view controller for a custom keyboard app extension. (iOS 8.0+)
 - UILexicon : A read-only array of term pairs, each in a lexicon entry object, for use by a custom keyboard. (iOS 8.0+)
 - UILexiconEntry : A read-only term pair, available within a lexicon object, for use by a custom keyboard. (iOS 8.0+)
