#!/bin/bash

# DESCRIPTION OF SCRIPT:
## Fetch all tags
## Check if currently on MASTER branch -- don't run rest of Script if not on MASTER
## Calculate whether this will be minor+ release
## Create tag for release (if needed)

## MAJOR RELEASE: 1.0.0 update => "(breaking)"
## MINOR RELEASE: 0.1.0 update => "feat"
## PATCH RELEASE: 0.0.1 update => everything else

MAJOR_RELEASE="(breaking)"
MINOR_RELEASE="feat"
PATCH_RELEASE="p"

git=$(sh /etc/profile; which git)
current_branch=$("$git" branch | grep \* | cut -d ' ' -f2)

# Fetch all tags
"$git" fetch --depth=2147483647
"$git" fetch --tags

# Only run rest of Script if on Master branch
if [[ $current_branch != "master" ]]; then 
    exit 0
fi

# Calculate whether this will be a minor+ release

## Previous tag
last_tag=$("$git" describe --tags --abbrev=0)

## List of commits since last tag
commit_list=#("$git" log $last_tag..HEAD --oneline --pretty=format:"%s")

## Iterate through each commit message -- look for angular commit messages. Figure out if Major, Minor, or Patch release.
release_type=$PATCH_RELEASE

while read -r line; do
    angular_commit=${line%%:*}

    # Major Release
    if [[ -z ${angular_commit%%*$MAJOR_RELEASE} ]]; then
        release_type=$MAJOR_RELEASE

    # Minor Release
    elif [[ $angular_commit == $MINOR_RELEASE ]] && [[ $release_type != $MAJOR_RELEASE ]]; then
        release_type=$MINOR_RELEASE
    fi

done <<< "$commit_list"

# Create new tag (if needed)

## If not major+ release, don't create tag
if [[ $release_type == $PATCH_RELEASE ]]; then
    exit 0
fi

## Split $last_tag into *.*
split_tag=(${last_tag//./ })

## If tag has a Patch number, remove it
unset 'split_tag[${#split_tag[@]}-1]'

## Update tag number based on Release Type
if [[ $release_type == $MAJOR_RELEASE ]]; then
    split_tag[0]=$((split_tag[0] + 1))
    split_tag[1]=0
elif [[ $release_type == $MINOR_RELEASE ]]; then
    split_tag[1]=$((split_tag[1] + 1))
fi

## Create new tag name
new_tag=${split_tag[@]}; new_tag=${new_tag// /.}

echo "Auto-created tag will be $new_tag."

## Create Tag, push to origin
$("$git" tag $new_tag)
echo "Successfully create tag $new_tag."

$("$git" push origin $new_tag)
echo "Pushed tag $new_Tag to origin."

