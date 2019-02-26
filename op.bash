function opbash_signin() {
    op list templates >> /dev/null 2>&1
    if [[ $? -ne 0 ]]
    then
        eval $(op signin my)
    fi
}

function opbash_get_names() {
    op list items | jq -r '.[].overview.title'
}

function opbash_get_entry() {
    json=$(op get item "$1")
    username=$(echo $json | jq -r '.details.fields[]|select(.designation=="username")|.value')
    password=$(echo $json | jq -r '.details.fields[]|select(.designation=="password")|.value')
    echo "item: $1 | user: $username | pass: $password"
}

function oppw() {
    opbash_signin
    opname=$(opbash_get_names | fzf)
    opbash_get_entry "$opname"
}
