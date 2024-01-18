set -e

cd build
dotnet restore
dotnet build
cd ..