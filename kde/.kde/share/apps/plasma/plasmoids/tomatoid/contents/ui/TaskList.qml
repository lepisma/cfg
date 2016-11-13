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
import org.kde.plasma.components 0.1 as PlasmaComponents

Item {
	property bool done //is a list of done tasks?
	property ListModel model

	id: taskContainer

	signal doTask(string taskIdentity)
	signal removeTask(string taskIdentity)
	signal startTask(string taskIdentity, string taskName)
	signal renameTask(string taskIdentity, string newName)

	Keys.enabled: !tomatoid.timerActive

	anchors.fill: parent

	function decrementCurrentIndex() {
		taskList.decrementCurrentIndex();

		console.log("dec: " + taskList.currentIndex);

		highlight();
	}

	function incrementCurrentIndex() {
		taskList.incrementCurrentIndex();

		console.log("inc: " + taskList.currentIndex);

		highlight();
	}

	function highlight() {
		if(taskList.currentItem) {
			taskContainer.forceActiveFocus();

			if((!done || !tomatoid.timerActive) && taskList.highlightItem) { //dont enable highlight in completed task list when timer is running
				taskList.highlightItem.opacity = 1; //reenable opacity when entered an item
			}
		}
	}

	function unhighlight() {
		if(taskList.highlightItem) {
			if(tomatoid.timerActive) {
				taskList.highlightItem.opacity = done ? 0 : 1; //when timer is running dont turn off highlight in undone task list
			} else {
				taskList.highlightItem.opacity = 0; //when timer is not running turn off highlight when exited an item
			}
		}
	}

	// PlasmaComponents.ScrollBar {
	// 	id: scrollBar
	// 	orientation: Qt.Vertical
	// 	flickableItem: taskList
	// 	anchors.top: parent.top
	// 	anchors.right: parent.right
	// 	anchors.bottom: parent.bottom
	// }

	Keys.onReturnPressed: {
		startTask(taskList.currentItem.identity, taskList.currentItem.taskName)
	}

	Keys.onDeletePressed: {
		removeTask(taskList.currentItem.identity)
	}

	Keys.onPressed: {
		if(event.key == Qt.Key_R) {
			taskList.currentItem.doRename();
			event.accepted = true;
		} else if(event.key == Qt.Key_X) {
			doTask(taskList.currentItem.identity)
			event.accepted = true;
		}
	}

	ListView {
		id: taskList

		anchors.top: parent.top
		anchors.left: parent.left
		anchors.bottom: parent.bottom
		anchors.right: parent.right
		//anchors.right: scrollBar.visible ? scrollBar.left : parent.right

		clip: true //view itens only inside the container
		highlightFollowsCurrentItem: !tomatoid.timerActive //when timer is running the highlight will not change

		model: parent.model

		Component.onCompleted: currentIndex = -1

		highlight: PlasmaComponents.Highlight {
			opacity: 0
			Behavior on opacity {
				NumberAnimation {
					duration: 300
					easing.type: Easing.OutQuad
				}
			}
		}

		onCurrentIndexChanged: {
			taskContainer.highlight();
		}

		delegate: TaskItem {
			id: item
			identity: taskId
			name: taskName
			done: taskContainer.done
			donePomodoros: donePomos
			estimatedPomodoros: estimatedPomos
			active: taskList.currentIndex == index

			onEntered: taskList.currentIndex = index;
			onTaskDone: {
				doTask(identity)
				taskContainer.focus = true;
			}
			onRemoved: removeTask(identity)
			onStarted: startTask(identity, taskName)
			onRename: {
				renameTask(identity, name)
				taskContainer.focus = true;
			}
			onExited: {
				if(!tomatoid.timerActive)
					taskList.currentIndex = -1

				unhighlight();
			}
		}
	}
}
