#!/bin/bash
echo
echo PanXML

echo - macdeployqt

cd ~/Development/GitHub/PanXML

rm -R '../../Distribution/PanXML/PanXML.app'
cp -R './build-PanXML-Desktop_Qt_5_9_2_clang_64bit-Release/PanXML.app' '../../Distribution/PanXML/PanXML.app'
cp './trunk/Resources/Info.plist' '../../Distribution/PanXML/PanXML.app/Contents/Info.plist'

/Developer/Qt/5.9.2/clang_64/bin/macdeployqt '../../Distribution/PanXML/PanXML.app'

echo - code signing

codesign --force --verify --sign 'Developer ID Application: Alfred-Wegener-Institut fur Polar- und Meeresforschung (AWI)' '../../Distribution/PanXML/PanXML.app/Contents/Frameworks/QtCore.framework'
codesign --force --verify --sign 'Developer ID Application: Alfred-Wegener-Institut fur Polar- und Meeresforschung (AWI)' '../../Distribution/PanXML/PanXML.app/Contents/Frameworks/QtGui.framework'
codesign --force --verify --sign 'Developer ID Application: Alfred-Wegener-Institut fur Polar- und Meeresforschung (AWI)' '../../Distribution/PanXML/PanXML.app/Contents/Frameworks/QtNetwork.framework'
codesign --force --verify --sign 'Developer ID Application: Alfred-Wegener-Institut fur Polar- und Meeresforschung (AWI)' '../../Distribution/PanXML/PanXML.app/Contents/Frameworks/QtPrintSupport.framework'
codesign --force --verify --sign 'Developer ID Application: Alfred-Wegener-Institut fur Polar- und Meeresforschung (AWI)' '../../Distribution/PanXML/PanXML.app/Contents/Frameworks/QtSvg.framework'
codesign --force --verify --sign 'Developer ID Application: Alfred-Wegener-Institut fur Polar- und Meeresforschung (AWI)' '../../Distribution/PanXML/PanXML.app/Contents/Frameworks/QtWidgets.framework'

codesign --force --verify --sign 'Developer ID Application: Alfred-Wegener-Institut fur Polar- und Meeresforschung (AWI)' '../../Distribution/PanXML/PanXML.app/Contents/PlugIns/bearer/libqcorewlanbearer.dylib'
codesign --force --verify --sign 'Developer ID Application: Alfred-Wegener-Institut fur Polar- und Meeresforschung (AWI)' '../../Distribution/PanXML/PanXML.app/Contents/PlugIns/bearer/libqgenericbearer.dylib'
codesign --force --verify --sign 'Developer ID Application: Alfred-Wegener-Institut fur Polar- und Meeresforschung (AWI)' '../../Distribution/PanXML/PanXML.app/Contents/PlugIns/imageformats/libqgif.dylib'
codesign --force --verify --sign 'Developer ID Application: Alfred-Wegener-Institut fur Polar- und Meeresforschung (AWI)' '../../Distribution/PanXML/PanXML.app/Contents/PlugIns/imageformats/libqicns.dylib'
codesign --force --verify --sign 'Developer ID Application: Alfred-Wegener-Institut fur Polar- und Meeresforschung (AWI)' '../../Distribution/PanXML/PanXML.app/Contents/PlugIns/imageformats/libqico.dylib'
codesign --force --verify --sign 'Developer ID Application: Alfred-Wegener-Institut fur Polar- und Meeresforschung (AWI)' '../../Distribution/PanXML/PanXML.app/Contents/PlugIns/imageformats/libqjpeg.dylib'
codesign --force --verify --sign 'Developer ID Application: Alfred-Wegener-Institut fur Polar- und Meeresforschung (AWI)' '../../Distribution/PanXML/PanXML.app/Contents/PlugIns/imageformats/libqmacjp2.dylib'
codesign --force --verify --sign 'Developer ID Application: Alfred-Wegener-Institut fur Polar- und Meeresforschung (AWI)' '../../Distribution/PanXML/PanXML.app/Contents/PlugIns/imageformats/libqtga.dylib'
codesign --force --verify --sign 'Developer ID Application: Alfred-Wegener-Institut fur Polar- und Meeresforschung (AWI)' '../../Distribution/PanXML/PanXML.app/Contents/PlugIns/imageformats/libqtiff.dylib'
codesign --force --verify --sign 'Developer ID Application: Alfred-Wegener-Institut fur Polar- und Meeresforschung (AWI)' '../../Distribution/PanXML/PanXML.app/Contents/PlugIns/imageformats/libqwbmp.dylib'
codesign --force --verify --sign 'Developer ID Application: Alfred-Wegener-Institut fur Polar- und Meeresforschung (AWI)' '../../Distribution/PanXML/PanXML.app/Contents/PlugIns/imageformats/libqwebp.dylib'
codesign --force --verify --sign 'Developer ID Application: Alfred-Wegener-Institut fur Polar- und Meeresforschung (AWI)' '../../Distribution/PanXML/PanXML.app/Contents/PlugIns/platforms/libqcocoa.dylib'
codesign --force --verify --sign 'Developer ID Application: Alfred-Wegener-Institut fur Polar- und Meeresforschung (AWI)' '../../Distribution/PanXML/PanXML.app/Contents/PlugIns/printsupport/libcocoaprintersupport.dylib'
codesign --force --verify --sign 'Developer ID Application: Alfred-Wegener-Institut fur Polar- und Meeresforschung (AWI)' '../../Distribution/PanXML/PanXML.app/Contents/PlugIns/iconengines/libqsvgicon.dylib'

codesign --force --verify --sign 'Developer ID Application: Alfred-Wegener-Institut fur Polar- und Meeresforschung (AWI)' '../../Distribution/PanXML/PanXML.app'

echo - mount package

cd ~/Development/Distribution/PanXML
hdiutil attach ~/Development/Distribution/PanXML_OSX.dmg

rm -R '/Volumes/PanXML/PanXML.app'
cp -R PanXML.app '/Volumes/PanXML'

cd '/Volumes/PanXML'
rm -rf .fseventsd
mkdir .fseventsd
touch .fseventsd/no_log
cd ~/Development/Distribution/PanXML

echo - verify package

codesign -d '/Volumes/PanXML/PanXML.app'

echo
hdiutil detach '/Volumes/PanXML'

echo - move application

rm -R /Applications/PanXML.app
cp -R PanXML.app /Applications
cd ~/Development/Distribution

echo - finished
