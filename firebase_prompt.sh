firebase_prompt() {
    current_project=$(cat ~/.config/configstore/firebase-tools.json | \
        jq --arg currentDir $(pwd) << EOL '
        [
            .activeProjects
            | to_entries[]
            | .key as $key
            | select($currentDir | startswith($key))
        ] | [
            sort_by(.key | length)
            | reverse[]
        ] | .[0].value'
EOL
)

    if [ "$current_project" != "null" ];
    then
        echo "%{$fg[yellow]%}🔥 Firebase: %{$fg_bold[yellow]%}$current_project%{$reset_color%}";
    fi;
}
