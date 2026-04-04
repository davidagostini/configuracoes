

~~~code

# Definindo a URL de um servidor confiável (Google é excelente para isso)
$url = "https://www.google.com"

try {
    # Realiza uma requisição básica para obter apenas o cabeçalho
    $response = Invoke-WebRequest -Uri $url -Method Head -ErrorAction Stop
    
    # Extrai o valor "Date" do cabeçalho
    $httpDate = $response.Headers.Date
    
    # Converte a string de data (GMT) para o formato DateTime local
    $dateTime = [DateTime]::Parse($httpDate).ToLocalTime()
    
    Write-Host "Horário obtido via HTTP: $dateTime" -ForegroundColor Cyan
    
    # Define a data e hora do sistema
    Set-Date -Date $dateTime
    
    Write-Host "Relógio atualizado com sucesso!" -ForegroundColor Green
}
catch {
    Write-Host "Erro ao tentar obter a hora via HTTP: $($_.Exception.Message)" -ForegroundColor Red
}

~~~
