cat ~/.tool-versions | while read line
do
	plugin_name=${line%% *}
	version=${line##* }

	if [ -z "$plugin_name" ]; then
		continue
	fi

	asdf plugin add $plugin_name
	asdf install $plugin_name $version
	asdf global $plugin_name $version
	asdf reshim $plugin_name
done
