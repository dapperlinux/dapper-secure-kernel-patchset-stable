echo "Removing rebase dir..."
rm -rf rebase

echo "Removing test dir..."
rm -rf test/

echo "Removing log files..."
rm rebase.log
rm release.log
rm test.log

echo "Removing test patch..."
rm dapper-secure-kernel-patchset-test.patch
rm tmp.patch
