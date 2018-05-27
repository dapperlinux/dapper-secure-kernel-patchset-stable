# Reverses the patches found in this directory
# Uses patch -R to reverse
# To be called from test_patch.sh and init_rebase.sh

# ADD NEWEST FIRST

patch -F 0 -R -p1 < ../../omitted-patches/omit-4.9.88.patch
patch -F 0 -R -p1 < ../../omitted-patches/omit-4.9.87.patch
# 4.9.86 does not need any omissions
patch -F 0 -R -p1 < ../../omitted-patches/omit-4.9.85.patch
patch -F 0 -R -p1 < ../../omitted-patches/omit-4.9.84.patch
patch -F 0 -R -p1 < ../../omitted-patches/omit-4.9.83.patch
# 4.9.82 does not need any omissions
patch -F 0 -R -p1 < ../../omitted-patches/omit-4.9.81.patch
# 4.9.80 does not need any omissions
patch -F 0 -R -p1 < ../../omitted-patches/omit-4.9.79.patch
patch -F 0 -R -p1 < ../../omitted-patches/omit-4.9.78.patch
patch -F 0 -R -p1 < ../../omitted-patches/omit-4.9.77.patch
patch -F 0 -R -p1 < ../../omitted-patches/omit-4.9.76.patch
patch -F 0 -R -p1 < ../../omitted-patches/omit-4.9.75.patch
