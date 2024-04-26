$data = @"
[
  {
    "eventType": "dataMario",
    "name": "Aron",
    "favouriteColor": "blue",
    "favouriteNumber": 42
  }
]
"@

$bytes = [System.Text.Encoding]::UTF8.GetBytes($data)
$stream = New-Object System.IO.MemoryStream
$stream.Write($bytes, 0, $bytes.Length)
$stream.Seek(0, [System.IO.SeekOrigin]::Begin)

$gzipStream = New-Object System.IO.Compression.GzipStream $stream, [System.IO.Compression.CompressionMode]::Compress
$compressedBytes = New-Object byte[] 1024
$memoryStream = New-Object System.IO.MemoryStream
while (($read = $gzipStream.Read($compressedBytes, 0, $compressedBytes.Length)) -ne 0) {
    $memoryStream.Write($compressedBytes, 0, $read)
}

$memoryStream.Position = 0
$apiKey = "YOUR_LICENSE_KEY"
$uri = "https://insights-collector.newrelic.com/v1/accounts/YOUR_ACCOUNT_ID/events"

Invoke-RestMethod -Uri $uri -Method Post -Headers @{
    "Api-Key" = $apiKey
    "Content-Type" = "application/json"
    "Content-Encoding" = "gzip"
} -Body $memoryStream.ToArray() -Verbose
