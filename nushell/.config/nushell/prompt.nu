$env.PROMPT_COMMAND_RIGHT = ""
$env.PROMPT_COMMAND = {
	let prefix = (formatted-german-translation)
	let starship_prompt = (starship prompt)
	$"($prefix)($starship_prompt)"
}