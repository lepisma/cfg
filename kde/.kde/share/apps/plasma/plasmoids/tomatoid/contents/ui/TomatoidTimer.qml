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

Item {
	property alias running: timer.running

	property int seconds // variable
	property int totalSeconds //constant

	property string taskId
	property string taskName

	signal tick()
	signal timeout()

	onTotalSecondsChanged: {
		seconds = totalSeconds;
	}

	Timer {
		id: timer
		interval: 1000
		running: false
		repeat: true

		onTriggered: {
			if(seconds > 1) {
				tick()
				seconds -= 1;
			} else {
				totalSeconds = 0;
				timeout()
			}
		}
	}
}
