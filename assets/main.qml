/*
 * Copyright (c) 2011-2014 BlackBerry Limited.
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import bb.cascades 1.3

TabbedPane {
    id: tabbedPane
    showTabsOnActionBar: true
    onActiveTabChanged: {
        keyboardListener1.haveFocus = false
        keyboardListener2.haveFocus = false
        keyboardListener3.haveFocus = false
        if (activeTab == tab1)
            keyboardListener1.haveFocus = true
        if (activeTab == tab2)
            keyboardListener2.haveFocus = true
        if (activeTab == tab3)
            keyboardListener3.haveFocus = true
    }
    onCreationCompleted: {
        keyboardListener1.haveFocus = true
    }
    Tab { //First tab
        id: tab1
        // Localized text with the dynamic translation and locale updates support
        title: qsTr("Tab 1") + Retranslate.onLocaleOrLanguageChanged
        Page {
            Container {
                Label {
                    text: qsTr("First tab") + Retranslate.onLocaleOrLanguageChanged
                }
                KeyboardListener {
                    id: keyboardListener1
                    onSwipeLeft: {
                        tabbedPane.activeTab = tab3
                    }
                    onSwipeRight: {
                        tabbedPane.activeTab = tab2
                    }
                }
            }
        }
    } //End of first tab
    Tab { //Second tab
        id: tab2
        title: qsTr("Tab 2") + Retranslate.onLocaleOrLanguageChanged
        Page {
            Container {
                Label {
                    text: qsTr("\n\nSecond tab") + Retranslate.onLocaleOrLanguageChanged
                    multiline: true
                }
                KeyboardListener {
                    id: keyboardListener2
                    onSwipeLeft: {
                        tabbedPane.activeTab = tab1
                    }
                    onSwipeRight: {
                        tabbedPane.activeTab = tab3
                    }
                }
            }
        }
    } //End of second tab
    Tab { //Third tab
        id: tab3
        title: qsTr("Tab 3") + Retranslate.onLocaleOrLanguageChanged
        Page {
            Container {
                Label {
                    text: qsTr("\n\n\n\nThird tab") + Retranslate.onLocaleOrLanguageChanged
                    multiline: true
                }
                KeyboardListener {
                    id: keyboardListener3
                    onSwipeLeft: {
                        tabbedPane.activeTab = tab2
                    }
                    onSwipeRight: {
                        tabbedPane.activeTab = tab1
                    }
                }
            }
        }
    } //End of third tab
}
