#!/bin/bash
#
# Description: Removes docker images created more than $1 days ago

DAYS_OLD=$1

if [ -z "$DAYS_OLD" ]; then
    echo "Please provide the number of days as an argument."
    exit 1
fi

CURRENT_DATE=$(date +%s)

# List all image IDs
for IMAGE_ID in $(docker images --format "{{.ID}}"); do
    # Find the most recent container based on this image
    LAST_USED_DATE=$(docker ps -a --filter "ancestor=$IMAGE_ID" --format "{{.CreatedAt}}" | sort -r | head -n 1)
    if [ -z "$LAST_USED_DATE" ]; then
        # If the image has never been used, consider deleting it (or skip)
        echo "Image $IMAGE_ID has never been used. Removing"
        docker rmi $IMAGE_ID
        continue
    fi
    # Adjusting date parsing to match the format returned by Docker
    LAST_USED_DATE_SECONDS=$(date --date="$LAST_USED_DATE" +%s 2>/dev/null)
    if [ $? -ne 0 ]; then
        echo "Failed to parse date for image $IMAGE_ID. Skipping."
        continue
    fi
    # Calculate the difference in days
    DIFF_DAYS=$(( ($CURRENT_DATE - $LAST_USED_DATE_SECONDS) / 86400 ))
    if [ $DIFF_DAYS -ge $DAYS_OLD ]; then
        echo "Deleting image $IMAGE_ID which was last used $DIFF_DAYS days ago."
        docker rmi $IMAGE_ID
    fi
done

