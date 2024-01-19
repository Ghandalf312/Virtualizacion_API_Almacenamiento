# Importar el módulo (asegúrate de que está instalado)
Install-Package -Name Google.Apis.Drive.v3

# Ruta al archivo JSON con las credenciales
$jsonFilePath = "C:\Users\marti\Desktop\credentials.json"

# Configurar las credenciales (reemplaza con tu lógica para obtener las credenciales)
# ...

# Crear el servicio de Google Drive
$driveService = New-Object Google.Apis.Drive.v3.DriveService -ArgumentList ($credential)

# Contenido del archivo
$fileContent = "Karl Bech 1015920 y Diego Morales 1132119"

# Crear el archivo
$fileMetadata = New-Object Google.Apis.Drive.v3.File
$fileMetadata.Name = "nombre_del_archivo.txt"
$fileMetadata.MimeType = "text/plain"
$fileMetadata.Parents = @("1i1EVfq6QvOVlgq-zKeLlsIW8yYr4a-dC")  # Reemplaza con la ID de la carpeta deseada

# Subir el contenido del archivo
$stream = [IO.MemoryStream] [Text.Encoding]::UTF8.GetBytes($fileContent)
$request = $driveService.Files.Create($fileMetadata, $stream, "text/plain")
$request.Upload()

# Imprimir un mensaje de éxito
Write-Host "Archivo creado y subido exitosamente a Google Drive en la carpeta con ID 1i1EVfq6QvOVlgq-zKeLlsIW8yYr4a-dC."
