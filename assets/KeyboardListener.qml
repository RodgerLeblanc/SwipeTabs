import bb.cascades 1.3

Container {
    property bool haveFocus: false
    signal swipeRight
    signal swipeLeft
    ScrollView {                
        id: mainScrollView
        scrollRole: haveFocus ? ScrollRole.Main : ScrollRole.None
        scrollViewProperties.scrollMode: ScrollMode.Horizontal
        property int startX
        property int stopX
        property int minimumDistance: ui.du(36)
        eventHandlers: [
            TouchKeyboardHandler {
                id: touchKeyboard
                onTouch: {
                    if (event.touchType == TouchType.Down) {
                        mainScrollView.startX = event.screenX
                        return
                    }
                    if (event.touchType == TouchType.Up) {
                        mainScrollView.stopX = event.screenX
                        var distance = mainScrollView.stopX - mainScrollView.startX
                        if (distance > mainScrollView.minimumDistance) {
                            console.log("Swiped right " + distance)
                            // Emit swipeRight signal
                            swipeRight()
                        } else {
                            if (distance < (0 - mainScrollView.minimumDistance)) {
                                console.log("Swiped left " + distance)
                                // Emit swipeLeft signal
                                swipeLeft()
                            } else {
                                console.log("Distance too short...")
                            }
                        }
                        return
                    }
                }
            }
        ]
    }
}
