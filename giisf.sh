#!/system/bin/sh
old_file=$(ls ~/sdcard/Android/data/com.miHoYo.GenshinImpact/files/cache_versions_* | head -n 1)
cc=$(echo "$old_file" | grep -o '[0-9]*')
echo "Genshin Impact Storage Fix"
sleep 2
echo ""
echo "Version: 1.0"
sleep 1
echo "By: OzzyDev"
sleep 3
echo ""
echo "--[ Checking You Device ]--"
sleep 1
echo ""
echo "Device: $(getprop ro.product.model)"
sleep 1
echo "Brand: $(getprop ro.product.brand)"
sleep 1
echo "Build Number: $(getprop ro.build.id)"
sleep 1
echo "Android Version: $(getprop ro.build.version.release)"
sleep 1
echo "Manufacturer: $(getprop ro.product.manufacturer)"
sleep 1
echo "Serial: $(getprop ro.serialno)"
sleep 1
echo "Kernel: $(uname) | $(uname -r)"
sleep 1
echo "CPU Cores: $(grep -c processor /proc/cpuinfo)"
sleep 3
echo ""
echo "--[ Checking Genshin Impact ]--"
sleep 1
echo ""
echo "Genshin Impact UID: $(cat /sdcard/Android/data/com.miHoYo.GenshinImpact/files/Uidinfo.txt)"
sleep 1
echo "Genshin Impact Version: $(echo $cc)_v$(cat /sdcard/Android/data/com.miHoYo.GenshinImpact/files/ScriptVersion)"
sleep 2
echo ""
echo "WARNING: Use this script when downloading Genshin Impact resources!"
sleep 1
echo "For the first time (NO IN UPDATE STATE)!"
echo ""
sleep 3

f="/sdcard/cache_versions_$(echo $cc)"
echo "Generating ${f}..."
sleep 2
ls /sdcard/Android/data/com.miHoYo.GenshinImpact/files/AssetBundles/blocks/00/ | tee "$f"
sed -i "s/^/AssetBundles\/blocks\/00\//" "$f"
sed -i "2i hardware_model_config.json" "$f"
sleep 2
echo "Clean up generated file..."
sleep 1
grep -v "\.tmp$" "$f" | sed -i "/\.tmp$/d" "$f"
sed -i 's/\r//g' "$f"
sed -i '/^$/d' "$f" && printf %s "$(cat "$f")" > "$f"
echo "Done! Paste the file into your Genshin Impact folder, and enjoy:)"
