#!/system/bin/sh
if ! applypatch -c EMMC:/dev/block/platform/bootdevice/by-name/recovery:67108864:bec264c1683f0973b4d3ff346c8df5ac59a23833; then
  applypatch  EMMC:/dev/block/platform/bootdevice/by-name/boot:67108864:896e21b71f7ac484a69eb19a6a070be21085ddb5 EMMC:/dev/block/platform/bootdevice/by-name/recovery bec264c1683f0973b4d3ff346c8df5ac59a23833 67108864 896e21b71f7ac484a69eb19a6a070be21085ddb5:/system/recovery-from-boot.p && log -t recovery "Installing new recovery image: succeeded" || log -t recovery "Installing new recovery image: failed"
else
  log -t recovery "Recovery image already installed"
fi
