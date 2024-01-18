set -e

cd build

targetFolder="/c/Program Files/Niko Home Control programming software/resources/app/backend"

DLL="Niko.Nhc.Discovery.dll"
patchedDLL="bin/Debug/netstandard2.0/${DLL}"
targetDLL="${targetFolder}/${DLL}"
backupDLL="${targetFolder}/${DLL}.bak"

echo $backupDLL

if [ ! -e "$backupDLL" ]; then
	mv "$targetDLL" "$backupDLL"
fi

echo "Copying patched dll"
cp "$patchedDLL" "$targetDLL"

echo "Patching config"

config="App.pc.config"
targetConfig="${targetFolder}/${config}"
backupConfig="${targetFolder}/${config}.bak"

if [ ! -e "$backupConfig" ]; then
	cp "$targetConfig" "$backupConfig"
fi

cp "$targetConfig" .

patch -p1 < ../config-fix.patch

cp "$config" "$targetConfig"

echo "Cleaning up"

cd ..
rm -r build/

echo "Done."

cd ..
