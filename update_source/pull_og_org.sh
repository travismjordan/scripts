#!/bin/bash
#simple .sh to update fromoriginal org

txtbld=$(tput bold) # Bold
bldred=${txtbld}$(tput setaf 1) # red
bldgrn=${txtbld}$(tput setaf 2) # green
txtrst=$(tput sgr0) # Reset

git_user="fgl27"
branch="pie";
og_org="ResurrectionRemix";

checkout_pull() {
	for ((i=0; i<${#sources_path[@]}; ++i)); do
		cd "${sources_path[i]}" || exit;
		echo -e "\\n${bldred}	Pull origin folder ${sources_path[i]} ${txtrst}\\n"

		git checkout "$branch"
		git remote remove origin
		git remote add origin https://github.com/"$git_user"/"${sources_links[i]}"/
		git pull https://github.com/"$og_org"/"${sources_links[i]}"/ "$branch" --no-edit
		git push origin "$branch"

		cd - &> /dev/null || exit;
	done
}

sources_path=(	"packages/apps/ExactCalculator"
		"packages/apps/DocumentsUI"
		"packages/apps/Gallery2"
		"packages/apps/Trebuchet"
		"packages/overlays/Lineage"
		"packages/apps/LineageParts"
		"lineage-sdk"
		"device/qcom/sepolicy"
		"device/rr/sepolicy"
		"frameworks/av"
		"packages/services/Telephony"
		"system/core"
		"frameworks/support"
		"system/sepolicy"
		"packages/services/Telecomm"
		"packages/apps/Updater"
		"device/qcom/sepolicy-legacy"
		"build/soong"
		"build/make"
		"frameworks/opt/slimrecent"
		"packages/services/OmniJaws"
		"frameworks/base"
		"packages/apps/Settings"
		"vendor/rr"
		"platform_manifest"
		"packages/apps/SmartNav"
		"frameworks/native"
		"packages/apps/PackageInstaller"
		"frameworks/opt/net/wifi");

sources_links=(	"android_packages_apps_ExactCalculator_Pie"
		"android_packages_apps_DocumentsUI"
		"android_packages_apps_Gallery2"
		"android_packages_apps_Trebuchet_Pie"
		"android_packages_overlays_ResurrectionRemix"
		"android_packages_apps_LineageParts"
		"lineage-sdk"
		"device_qcom_sepolicy"
		"device_rr_sepolicy"
		"frameworks_av"
		"android_packages_services_Telephony"
		"android_system_core"
		"frameworks_support"
		"android_system_sepolicy"
		"android_packages_services_Telecomm"
		"android_packages_apps_Updater"
		"android_device_qcom_sepolicy-legacy"
		"android_build_soong"
		"android_build"
		"frameworks_opt_slimrecent"
		"packages_services_OmniJaws"
		"android_frameworks_base"
		"Resurrection_packages_apps_Settings"
		"android_vendor_resurrection"
		"platform_manifest"
		"packages_apps_SmartNav"
		"frameworks_native"
		"android_packages_apps_PackageInstaller"
		"android_frameworks_opt_net_wifi");

checkout_pull;

exit;
