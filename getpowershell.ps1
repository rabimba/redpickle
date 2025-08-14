# Create directory for the model
New-Item -ItemType Directory -Path .\flan-t5-small -Force
# Define the list of model files
$files = @(
    "config.json",
    "pytorch_model.bin",
    "tokenizer.json",
    "tokenizer_config.json",
    "special_tokens_map.json",
    "vocab.txt"
)
# Base URL for the model files
$base_url = "https://huggingface.co/google/flan-t5-small/resolve/main/"
# Loop through each file and download it
foreach ($file in $files) {
    $url = "$base_url$file"
    $output = ".\flan-t5-small\$file"
    Invoke-WebRequest -Uri $url -OutFile $output
    Write-Host "Downloaded: $file"
}