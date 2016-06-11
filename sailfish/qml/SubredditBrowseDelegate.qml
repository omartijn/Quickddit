/*
    Quickddit - Reddit client for mobile phones
    Copyright (C) 2014  Dickson Leong

    This program is free software: you can redistribute it and/or modify
    it under the terms of the GNU General Public License as published by
    the Free Software Foundation, either version 3 of the License, or
    (at your option) any later version.

    This program is distributed in the hope that it will be useful,
    but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
    GNU General Public License for more details.

    You should have received a copy of the GNU General Public License
    along with this program.  If not, see [http://www.gnu.org/licenses/].
*/

import QtQuick 2.0
import Sailfish.Silica 1.0

ListItem {
    id: subredditDelegate
    contentHeight: mainColumn.height + 2 * constant.paddingMedium

    Column {
        id: mainColumn
        anchors {
            left: parent.left; right: parent.right; verticalCenter: parent.verticalCenter
            margins: constant.paddingMedium
        }
        height: childrenRect.height
        spacing: constant.paddingSmall

        Text {
            id: titleText
            anchors { left: parent.left; right: parent.right }
            font.pixelSize: constant.fontSizeDefault
            color: subredditDelegate.highlighted ? Theme.highlightColor : constant.colorLight
            font.bold: true
            text: model.url
        }

        Text {
            id: descriptionText
            anchors { left: parent.left; right: parent.right }
            font.pixelSize: constant.fontSizeDefault
            color: subredditDelegate.highlighted ? Theme.secondaryHighlightColor : constant.colorMid
            wrapMode: Text.Wrap
            visible: text != ""
            text: model.shortDescription
        }

        Row {
            anchors { left: parent.left; right: parent.right }
            spacing: constant.paddingMedium

            Text {
                anchors.verticalCenter: parent.verticalCenter
                font.pixelSize: constant.fontSizeDefault
                color: subredditDelegate.highlighted ? Theme.highlightColor : constant.colorLight
                wrapMode: Text.Wrap
                text: model.subscribers + " subscribers"
            }

            Bubble {
                anchors.verticalCenter: parent.verticalCenter
                color: "red"
                visible: model.isNSFW
                text: "NSFW"
                font.bold: true
            }

        }
    }
}