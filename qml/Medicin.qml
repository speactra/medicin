/*
  Copyright (C) 2013 Jolla Ltd.
  Contact: Thomas Perl <thomas.perl@jollamobile.com>
  All rights reserved.

  You may use this file under the terms of BSD license as follows:

  Redistribution and use in source and binary forms, with or without
  modification, are permitted provided that the following conditions are met:
    * Redistributions of source code must retain the above copyright
      notice, this list of conditions and the following disclaimer.
    * Redistributions in binary form must reproduce the above copyright
      notice, this list of conditions and the following disclaimer in the
      documentation and/or other materials provided with the distribution.
    * Neither the name of the Jolla Ltd nor the
      names of its contributors may be used to endorse or promote products
      derived from this software without specific prior written permission.

  THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND
  ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED
  WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
  DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDERS OR CONTRIBUTORS BE LIABLE FOR
  ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES
  (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES;
  LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND
  ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
  (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS
  SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
*/

import QtQuick 2.0
import Sailfish.Silica 1.0
import "pages"
import "cover"

ApplicationWindow
{

    initialPage: Page {
        id: page

        // To enable PullDownMenu, place our content in a SilicaFlickable
        SilicaFlickable {

            anchors.fill: parent

            // PullDownMenu and PushUpMenu must be declared in SilicaFlickable, SilicaListView or SilicaGridView
            PullDownMenu {
                MenuItem {
                    text: qsTr("About")
                    onClicked: pageStack.push(Qt.resolvedUrl("pages/SecondPage.qml"))
                }
                MenuItem {
                    text: qsTr("Reset")
                    onClicked: knapp.tagit = false

                }
            }

            // Tell SilicaFlickable the height of its content.
            contentHeight: column.height

            // Place our content in a Column.  The PageHeader is always placed at the top
            // of the page, followed by our content.
            Column {
                id: column

                width: page.width
                spacing: Theme.paddingLarge
                PageHeader {
                    title: qsTr("Medicin")
                }
                SectionHeader {
                    text: "Did you take your medicin today?"
                }
                //Knapp testedit
                Button {
                    id: knapp
                    property bool tagit
                    property alias med: knapp.tagit
                    text: "I've been taking it!"
                    enabled: !knapp.tagit
                    anchors.horizontalCenter: parent.horizontalCenter
                    preferredWidth: Theme.buttonWidthLarge
                    onClicked: knapp.tagit = true
                }



            }
        }


        /*attachedObjects: [
                SecondPage {
                    id: pushed
                }
            ]
    */


    }

    //cover: Qt.resolvedUrl("cover/CoverPage.qml")
    cover: CoverBackground{
        Label {
            anchors.centerIn: parent
            width: parent.width - 2*Theme.horizontalPageMargin
            wrapMode: Text.WordWrap
            maximumLineCount: 5
            text: knapp.tagit == true ? "You have been taking your medicin today!" : "Not yet"
        }
        CoverActionList {
            id: coverAction

            CoverAction {
                iconSource: knapp.tagit == true ? "image://theme/" : "image://theme/icon-cover-new"
                onTriggered: knapp.tagit = true
            }
        }
    }



    allowedOrientations: Orientation.All
    _defaultPageOrientations: Orientation.All
}



