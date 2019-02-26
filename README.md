# opbash
This bash script can be sourced to provide a bash function, oppw, that leverages fzf to find 1Password entries and display the password.

## usage
`source op.bash;oppw`

## installation (example)
`cp op.bash ~/;echo "source op.bash" >> .bashrc`

## prerequisites

  * [1Password CLI](https://support.1password.com/command-line/)
  * [fzf](https://github.com/junegunn/fzf)
  * [jq](https://stedolan.github.io/jq/)
