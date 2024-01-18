set -e

cd build
echo "Patching DLL..."
patch -p1 < ../dll-fix.patch
cd ..
