#!/usr/bin/env nu

const LOMBOK_DOWNLOAD_LINK = 'https://projectlombok.org/downloads/lombok-1.18.36.jar'

def form-lombok-download-link [version: string] {
  $'https://projectlombok.org/downloads/lombok-($version).jar'
}

def download-lombok [version: string, output_file: string] {
  http get (form-lombok-download-link $version) | save $output_file
}

# Initialize environment for nvim java development.
def main [
  # Specifies the version of lombok to download.
  --lombok-version(-l): string = '1.18.36',
  --overwrite(-o)
] {
  let lombok_jar_path = ($env.HOME | path join 'setups/files/lombok.jar')

  if ($lombok_jar_path | path exists) {
    if not $overwrite {
      print $"(ansi red) Lombok jar already exists at ($lombok_jar_path)(ansi reset)(ansi attr_italic)\(Use --overwrite/-o to overwrite file.\)(ansi reset)"
      exit 1
    } else {
      print $"(ansi attr_italic) Deleting old lombok jar at ($lombok_jar_path)...(ansi reset)"
      rm $lombok_jar_path
    }
  }
  
  if not (($lombok_jar_path | path dirname) | path exists) {
    print $"(ansi attr_italic) Setup directory not found \(($lombok_jar_path)\). Creating it...(ansi reset)"
    mkdir ($lombok_jar_path | path dirname)
  }

  download-lombok $lombok_version $lombok_jar_path
  print $"(ansi green)(ansi attr_italic) Lombok jar succesfully download at ($lombok_jar_path)."
}
