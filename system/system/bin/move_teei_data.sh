#!/system/bin/sh

DEST_PATH="/data/vendor/thh"
FILES_MOVED="/data/vendor/thh/files_moved"
SRC_PATH="/data/thh"
FPC_SRC_PATH="/data/system/users/0/fpdata"
FPC_DEST_PATH="/data/vendor_de/0/fpdata"
FPC_FILES_MOVED="/data/vendor_de/0/fpdata/files_moved"

if [ ! -f "$FILES_MOVED" ]; then
  for i in "$SRC_PATH/"*; do
    dest_path=$DEST_PATH/"${i#$SRC_PATH/}"
    if [ -d "$i" ]; then
      mkdir -p $dest_path -m 755
      mv $i "$DEST_PATH"
      find $dest_path -print0 | while IFS= read -r -d '' file
        do
          chgrp system "$file"
        done
    fi
  done
  restorecon -R "$DEST_PATH/"*
  echo 1 > "$FILES_MOVED"
fi
if [ ! -f "$FPC_FILES_MOVED" ]; then
  for i in "$FPC_SRC_PATH/"*; do
    mv $i "$FPC_DEST_PATH"
    find $FPC_DEST_PATH -print0 | while IFS= read -r -d '' file
      do
        chgrp system "$file"
        chgrp system "$file"
      done
  done
  restorecon -R "$FPC_DEST_PATH/"*
  echo 1 > "$FPC_FILES_MOVED"
fi
