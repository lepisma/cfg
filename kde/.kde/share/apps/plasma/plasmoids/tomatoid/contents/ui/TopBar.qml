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
import org.kde.plasma.components 0.1 as PlasmaComponents
import "plasmapackage:/code/logic.js" as Logic

PlasmaComponents.ToolBarLayout {
	id: topBar

	property string icon
	property int spacing: 3

	property alias query: taskField

	PlasmaComponents.Label {
		text: {
			if(tomatoid.inPomodoro)
				return i18n("Running pomodoro #") + (tomatoid.completedPomodoros + 1)
			else if(tomatoid.inBreak)
				return i18n("Break time!")

			return ""
		}

		visible: tomatoid.inPomodoro || tomatoid.inBreak
	}

	Keys.onPressed: {
		switch(event.key) {
			case Qt.Key_Tab: {
				if(taskField.focus)
					estimatedPomosField.focus = true;
				else
					taskField.focus = true;
				event.accepted = true;
				break;
			}
		}
	}

	Row {
		id: addTaskRow
		visible: !tomatoid.inPomodoro && !tomatoid.inBreak
		anchors.left: topBar.left
		anchors.right: topBar.right

		PlasmaCore.ToolTip {
			id: estimatedPomosToolTip
			target: estimatedPomosField
			subText: i18n("The estimation of pomodoros necessary to complete this task")
		}

		PlasmaComponents.TextField {
			id: estimatedPomosField
			placeholderText: i18n("Est.")
			height: addTaskButton.height
			width: 50

			validator: IntValidator { bottom: 1; top: 99 }

			Keys.onReturnPressed: {
				add()
			}
		}

		PlasmaComponents.TextField {
			id: taskField
			placeholderText: i18n("Task Name")
			height: addTaskButton.height
			anchors.leftMargin: topBar.spacing
			anchors.rightMargin: topBar.spacing
			anchors.left: estimatedPomosField.right
			anchors.right: addTaskButton.left

			Keys.onReturnPressed: {
				add()
			}
		}

		PlasmaComponents.Button {
			id: addTaskButton
			iconSource: "list-add"
			anchors.right: addTaskRow.right

			onClicked: {
				add();
				taskField.forceActiveFocus();
			}
		}
	}

	function add() {
		if(taskField.text != "") {
			Logic.newTask(taskField.text, estimatedPomosField.text == "" ? 0 : estimatedPomosField.text)
			taskField.text = ""
			estimatedPomosField.text = ""
		}
	}
}
