/*
 *   Copyright 2013 Arthur Taborda <arthur.hvt@gmail.com>
 *
 *   This program is free software; you can redistribute it and/or modify
 *   it under the terms of the GNU Library General Public License as
 *   published by the Free Software Foundation; either version 2 or
 *   (at your option) any later version.
 *
 *   This program is distributed in the hope that it will be useful,
 *   but WITHOUT ANY WARRANTY; without even the implied warranty of
 *   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 *   GNU General Public License for more details
 *
 *   You should have received a copy of the GNU Library General Public
 *   License along with this program; if not, write to the
 *   Free Software Foundation, Inc.,
 *   51 Franklin Street, Fifth Floor, Boston, MA  02110-1301, USA.
 */

 import QtQuick 1.1
 import org.kde.plasma.core 0.1 as PlasmaCore

 import "plasmapackage:/code/logic.js" as Logic

 Item {
	id: compactItem
	anchors.fill: parent

	property bool showTimer: true
	property string iconPrefix: ""

	property string timeString: Qt.formatTime(new Date(0,0,0,0,0, tomatoid.timer.seconds), "mm:ss")

	Component.onCompleted: {
		plasmoid.addEventListener("ConfigChanged", configChanged)
	}


	function configChanged() {
		showTimer = plasmoid.readConfig("showIconTimer");
		iconPrefix = plasmoid.readConfig("flatIconTheme") == true ? "" : "simple-";
	}


	function isConstrained() {
		return (plasmoid.formFactor == Vertical || plasmoid.formFactor == Horizontal);
	}


	MouseArea {
		id: mouseArea
		anchors.fill: parent
		hoverEnabled: true
		property int minimumWidth
		property int minimumHeight
		onClicked: plasmoid.togglePopup()

		PlasmaCore.Theme { id: theme }

		PlasmaCore.Svg {
			id: svgIcon
			imagePath: plasmoid.file("images", "tomatoid.svgz")
		}

		PlasmaCore.SvgItem {
			id: svgIconItem
			anchors.fill: parent
			svg: svgIcon
			elementId: {
				if(tomatoid.inPomodoro && !tomatoid.timer.running)
					return iconPrefix + "tomatoid-pause"
				else if(tomatoid.inPomodoro)
					return iconPrefix + "tomatoid-running"
				else if(tomatoid.inBreak)
					return iconPrefix + "tomatoid-break"
				else if(!tomatoid.inPomodoro && !tomatoid.inBreak)
					return iconPrefix + "tomatoid-idle"
			}
		}

		Item {
			id: timerContainer
			anchors.centerIn: parent
			property real size: Math.min(parent.width, parent.height)
			width: size
			height: size

			Rectangle {
				id: labelRect
				// should be 40 when size is 90
				width: Math.max(parent.size*4/9, 35)
				height: width/2
				anchors.centerIn: parent
				color: theme.backgroundColor
				border.color: "grey"
				border.width: 2
				radius: 4
				opacity: tomatoid.timerActive ? (showTimer ? 0.5 : (isConstrained() ? 0 : mouseArea.containsMouse*0.7)) : 0

				Behavior on opacity { NumberAnimation { duration: 100 } }
			}

			Text {
				id: overlayText
				text: timeString
				color: theme.textColor
				font.pixelSize: Math.max(timerContainer.size/8, 11)
				anchors.centerIn: labelRect
				opacity: labelRect.opacity > 0 ? 1 : 0
			}
		}
	}
}
