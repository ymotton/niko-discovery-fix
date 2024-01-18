set -e

echo "Creating build/ folder"
mkdir build

echo "Decompiling"
ilspycmd -p -o build /c/Program\ Files/Niko\ Home\ Control\ programming\ software/resources/app/backend/Niko.Nhc.Discovery.dll 
