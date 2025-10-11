
def formatted-german-translation [] {
	const INDEX_EN_SINGULAR = "en_singular"
	const INDEX_EN_PLURAL = "en_plural"
	const INDEX_DE_SINGULAR = "de_singular"
	const INDEX_DE_PLURAL = "de_plural"
	let path = ($env.HOME | path join ".lang_dict")
	let parsed_contents = (open $path | from csv)
	let random_index = (random int 0..($parsed_contents | length))
	let selected_row = ($parsed_contents | get $random_index)
	$"'($selected_row | get $INDEX_DE_SINGULAR)' -> '($selected_row | get $INDEX_EN_SINGULAR)'\n'($selected_row | get $INDEX_DE_PLURAL)' -> '($selected_row | get $INDEX_EN_PLURAL)'"
}