#!/usr/bin/env bash

HC="herbstclient"

COLOR_CURRENT="#7dc4e4"
COLOR_OCCUPIED="#ffc300"
COLOR_NORMAL="#5E5C64"
COLOR_URGENT="#FB607F"

print_tags() {
    "$HC" tag_status | while read -ra tags; do
        output=""

        for item in "${tags[@]}"; do
            state="${item:0:1}"
            tag="${item:1}"

            # tag 1 -> tags.0
            # tag 2 -> tags.1
            # ...
            # tag 9 -> tags.8
            index=$((tag - 1))

            client_count=$(
                "$HC" attr "tags.${index}.client_count" 2>/dev/null
            )

            [[ "$client_count" =~ ^[0-9]+$ ]] || client_count=0

            if [[ "$state" == "#" ]]; then
                # Текущий workspace
                output+="%{F${COLOR_CURRENT}}%{A1:${HC} use ${tag}:}[${tag}]%{A}%{F-}"

            elif [[ "$state" == "+" || "$state" == "!" ]]; then
                # Urgent
                output+="%{F${COLOR_URGENT}}%{A1:${HC} use ${tag}:}${tag}%{A}%{F-}"

            elif (( client_count > 0 )); then
                # Workspace с окнами
                output+="%{F${COLOR_OCCUPIED}}%{A1:${HC} use ${tag}:}${tag}%{A}%{F-}"

            else
                # Пустой workspace
                output+="%{F${COLOR_NORMAL}}%{A1:${HC} use ${tag}:}${tag}%{A}%{F-}"
            fi

            # Минимальный промежуток
            output+=" "
        done

        printf '%s\n' "$output"
    done
}

print_tags

"$HC" --idle | while read -r event args; do
    case "$event" in
        tag_changed|tag_flags|tag_added|tag_removed|tag_attr|client_added|client_removed|reload)
            print_tags
            ;;
    esac
done