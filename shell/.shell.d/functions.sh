hr()
{
    jot -b '═' -s '' "$(tput cols)"
}

lstrip()
{
    printf "%s\n" "${1##$2}"
}

rstrip()
{
    printf "%s\n" "${1##$2}"
}
