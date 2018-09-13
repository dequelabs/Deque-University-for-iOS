#!/bin/bash

set -xe

git=$(sh /etc/profile; which git)
commit_num=$("$git" rev-list HEAD --count)
release_num=$("$git" describe --tags)

if [[ $release_num == *"-"* ]]; then
    release_tag=${release_num%%-*}
    release_num="$release_tag-SNAPSHOT"
fi

pushd AttestIOSApp

# Update Info.plist to include accurate release information
for plist in "AttestIOSApp/Info.plist"; do
    if [ -f "$plist" ]; then
        /usr/libexec/PlistBuddy -c "Set :CFBundleVersion $commit_num" "$plist"
        /usr/libexec/PlistBuddy -c "Set :CFBundleShortVersionString $release_num" "$plist"
    fi
done

# Clean
xcodebuild clean -project AttestiOSApp.xcodeproj -configuration Release -alltargets

# Archive the app
xcodebuild archive -project AttestiOSApp.xcodeproj -configuration FullRelease -scheme AttestiOSApp -archivePath AttestiOSApp.xcarchive

# Export the ipa file
xcodebuild -exportArchive -archivePath AttestiOSApp.xcarchive -exportPath AttestIOSAppExport -exportOptionsPlist Export.plist

# Send ipa file to HockeyApp
pushd AttestIOSAppExport
curl \
    -F "status=2" \
    -F "notify=1" \
    -F "ipa=@AttestiOSApp.ipa" \
    -H "X-HockeyAppToken: $HOCKEY_APP_API_KEY" \
    https://rink.hockeyapp.net/api/2/apps/upload
