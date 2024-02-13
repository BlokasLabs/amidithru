# amidithru - user mode ALSA MIDI thru port.
# Copyright (C) 2018  Vilniaus Blokas UAB, https://blokas.io/
#
# This program is free software; you can redistribute it and/or
# modify it under the terms of the GNU General Public License
# as published by the Free Software Foundation; version 2 of the
# License.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program; if not, write to the Free Software
# Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA  02110-1301, USA.
#

PREFIX?=/usr/local
INSTALL?=install
INSTALL_PROGRAM?=$(INSTALL) -s

all: amidithru

CXXFLAGS ?= -O3
LDFLAGS += -lasound

amidithru: amidithru.o
	$(CXX) $^ -o $@ $(LDFLAGS)
	strip $@

%.o: %.cpp
	$(CXX) -c $(CXXFLAGS) $^ -o $@

install: amidithru
	mkdir -p $(DESTDIR)$(PREFIX)/bin
	$(INSTALL_PROGRAM) amidithru $(DESTDIR)$(PREFIX)/bin/

clean:
	rm -f amidithru *.o
