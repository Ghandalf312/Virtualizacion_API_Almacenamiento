# Generar números aleatorios usando Invoke-RestMethod
$numbers = Invoke-RestMethod -Uri "http://www.randomnumberapi.com/api/v1.0/random?min=100&max=1000&count=5"

# Obtener el nombre del archivo basado en los números generados
$filename = ($numbers -join "_") + ".txt"

# Crear la ruta completa del archivo en el escritorio
$desktopPath = [System.IO.Path]::Combine($env:USERPROFILE, "Desktop", $filename)

# Escribir el texto en el archivo
"Karl Bech 1015920 y Diego Morales 1132119" | Set-Content -Path $desktopPath

# Imprimir un mensaje de éxito
Write-Host "Archivo creado en el escritorio: $filename"