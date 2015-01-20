#!/bin/sh

# Converts an AdBlock Plus filter list to polipo forbidden format

# Verify arguments
FILTER="$1"
if [[ -z "${FILTER}" ]] || [[ ! -r "${FILTER}" ]]; then
	echo "Usage: $0 <filter>"
	exit 1
fi

cat "${FILTER}" | while read -r L; do
	if [[ -n "${L}" ]] && [[ "${L/#!}" == "${L}" ]] && [[ "${L/#@@}" == "${L}" ]] && [[ "${L/##}" == "${L}" ]] && [[ "${L/#[}" == "${L}" ]] && [[ "${L/\$}" == "${L}" ]]; then
		L="${L//./\\.}"
		L="${L//\*/.*}"
		#[[ "${L/%.\*/}" == "${L}" ]] && L="${L}.*"
		#[[ "${L/#http:\/\//}" == "${L}" ]] && [[ "${L/#.\*/}" == "${L}" ]] && L=".*${L}"
		L="${L/#http:\/\//^}"
		echo "${L}"

	fi	
done
