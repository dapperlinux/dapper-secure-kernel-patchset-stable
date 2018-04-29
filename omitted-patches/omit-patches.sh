# Reverses the patches found in this directory
# Uses patch -R to reverse
# To be called from test_patch.sh and init_rebase.sh

# ADD NEWEST FIRST

#patch -F 0 -R -p1 < ../../omitted-patches/omit-4.9.76.patch
patch -F 0 -R -p1 < ../../omitted-patches/omit-4.9.75.patch
