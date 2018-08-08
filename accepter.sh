#!/bin/sh

API_V3_URL=https://habitica.com/api/v3

api_user=${API_USER}
api_key=${API_KEY}

quest_data=$(
  curl \
    --silent \
    --request GET \
    --header "x-api-key: ${api_key}" \
    --header "x-api-user: ${api_user}" \
    "${API_V3_URL}/groups/party" | jq .data.quest)

quest_active=$(echo "${quest_data}" | jq '.active')

if [ "${quest_active}" = 'true' ]; then
  quest_key=$(echo "${quest_data}" | jq '.key')
  echo "The quest ${quest_key} has already started."
  exit
fi

if [ "$(echo "${quest_data}" | jq '.members')" = '{}' ]; then
  echo 'There was no invitation to a quest.'
  exit
fi

is_accepted=$(echo "${quest_data}" | jq ".members[\"${api_user}\"]")

if [ "${is_accepted}" = 'true' ]; then
  echo 'You have already accepted it.'
  exit
fi

curl \
  --silent \
  --request POST \
  --header 'Content-Length: 0' \
  --header "x-api-key: ${api_key}" \
  --header "x-api-user: ${api_user}" \
  "${API_V3_URL}/groups/party/quests/accept"
