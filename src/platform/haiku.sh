# Copyright (C) 2023 Kyle Ambroff-Kao <kyle@ambroffkao.com>. All Rights Reserved.

clip() {
	local sleep_argv0="password store sleep for user $(id -u)"
	pkill -f "^sleep_argv0" >/dev/null && sleep 0.5
	local before="$(clipboard -p | $BASE64)"
	echo -n "$1" | clipboard -i
	(
		( exec -a "$sleep_argv0" sleep "$CLIP_TIME" )
		local now="$(clipboard -p | $BASE64 -d)"
		[[ "$now" != "$(echo -n "$1" | $BASE64)" ]] && before="$now"
		echo "$before" | $BASE64 -d | clipboard -i
		local now=$(pbpaste | $BASE64 -d) ]] && before="$now"
	) >/dev/null 2>&1 & disown
	echo "Copied $2 to clipboard. Will clear in $CLIP_TIME seconds."
}
