# This software is a part of the A.O.D apprepo project
# Copyright 2015 Alex Woroschilow (alex.woroschilow@gmail.com)
#
# This program is free software; you can redistribute it and/or
# modify it under the terms of the GNU General Public License
# as published by the Free Software Foundation; either version 2
# of the License, or (at your option) any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program; if not, write to the Free Software
# Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA  02110-1301, USA.


all: 
	mkdir --parents $(PWD)/build/Boilerplate.AppDir
	wget --output-document="$(PWD)/build/build.tar.gz" "https://redirector.gvt1.com/edgedl/android/studio/ide-zips/2021.3.1.16/android-studio-2021.3.1.16-linux.tar.gz"

	mkdir --parents $(PWD)/build/Boilerplate.AppDir/opt/android-studio
	tar -zxvf $(PWD)/build/build.tar.gz	 --directory=$(PWD)/build/Boilerplate.AppDir/opt/android-studio
	mv --force $(PWD)/build/Boilerplate.AppDir/opt/android-studio*/android-studio*/* $(PWD)/build/Boilerplate.AppDir/opt/android-studio/
	rm --force --recursive $(PWD)/build/Boilerplate.AppDir/opt/android-studio*/android-studio*

	cp --force $(PWD)/AppDir/*.svg          $(PWD)/build/Boilerplate.AppDir                         || true
	cp --force $(PWD)/AppDir/*.png          $(PWD)/build/Boilerplate.AppDir                         || true
	cp --force $(PWD)/AppDir/*.desktop      $(PWD)/build/Boilerplate.AppDir                         || true
	cp --force $(PWD)/AppDir/AppRun         $(PWD)/build/Boilerplate.AppDir                         || true

	export ARCH=x86_64 && $(PWD)/bin/appimagetool.AppImage $(PWD)/build/Boilerplate.AppDir $(PWD)/Android-Studio.AppImage
	chmod +x $(PWD)/Android-Studio.AppImage

clean:
	rm -rf $(PWD)/build
