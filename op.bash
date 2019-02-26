function opbash_signin() {
    eval $(op signin my)
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
    if [[ -z "$OP_SESSION_my" ]]; then
        opbash_signin
    fi
    opname=$(opbash_get_names | fzf)
    opbash_get_entry "$opname"
}
