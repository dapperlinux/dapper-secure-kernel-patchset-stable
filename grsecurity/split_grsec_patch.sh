# Splits the final grsecurity patch into file based patches for easier viewing
# Naming scheme is as same as ../patches, ie a_mm_memory.c for all patches
# related to /mm/memory.c

splitdiff -a -D grsecurity grsecurity-3.1-4.9.24-201704252333.patch
