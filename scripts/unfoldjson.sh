#!/usr/bin/env bash

if [ -z "$SECRETS_JSON" ]; then
  echo 'No Secrets to unfold u.u'
  exit
fi

echo $SECRETS_JSON > /tmp/secrets.json
unset SECRETS_JSON

arr=()
while IFS='' read -r line; do
   arr+=(${line//\"})
done < <(jq 'keys[]' /tmp/secrets.json)


for item in "${arr[@]}"
do
    echo 'Exporting value of' $item
    CLEANITEM=".`echo ${item}`"
    VALUE=$(jq $CLEANITEM /tmp/secrets.json)
    export ${item}=${VALUE//\"}
done


rm /tmp/secrets.json
