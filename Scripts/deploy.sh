#!/bin/bash

set -xe

git=$(sh /etc/profile; which git)
commit_num=$("$git" rev-list HEAD --count)
release_num=$("$git" describe --tags)

if [[ $release_num == *"-"* ]]; then
    release_tag=${release_num%%-*}
    release_num="$release_tag-SNAPSHOT"
fi

# Update Info.plist to include accurate release information
for plist in "DequeUniversityForIOS/Info.plist"; do
    if [ -f "$plist" ]; then
        /usr/libexec/PlistBuddy -c "Set :CFBundleVersion $commit_num" "$plist"
        /usr/libexec/PlistBuddy -c "Set :CFBundleShortVersionString $release_num" "$plist"
    fi
done

### Unsure if Clean is needed or not
# Clean
# xcodebuild clean -project DequeUniversityForIOS.xcodeproj -configuration Release -alltargets

# Archive the app
xcodebuild archive -project DequeUniversityForIOS.xcodeproj -configuration FullRelease -scheme DequeUniversityForIOS -archivePath DequeUniversityForIOS.xcarchive

# Export the ipa file
xcodebuild -exportArchive -archivePath DequeUniversityForIOS.xcarchive -exportPath DequeUniversityForIOSExport -exportOptionsPlist Export.plist

# Send ipa file to HockeyApp
pushd DequeUniversityForIOSExport
curl \
    -F "status=2" \
    -F "notify=1" \
    -F "ipa=@DequeUniversityForIOS.ipa" \
    -H "X-HockeyAppToken: $HOCKEY_APP_API_KEY" \
    https://rink.hockeyapp.net/api/2/apps/upload
