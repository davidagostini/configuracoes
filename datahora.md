

~~~code

$url = "https://www.google.com"

try {
    # Obtém o cabeçalho do servidor
    $response = Invoke-WebRequest -Uri $url -Method Head -ErrorAction Stop
    $httpDate = $response.Headers.Date
    
    # Converte para DateTime em formato UTC (Universal)
    $utcDateTime = [DateTime]::Parse($httpDate).ToUniversalTime()
    
    # Adiciona -3 horas manualmente para garantir o horário de Brasília
    $brazilDateTime = $utcDateTime.AddHours(-3)
    
    Write-Host "Horário UTC: $utcDateTime" -ForegroundColor Gray
    Write-Host "Horário calculado (Brasília UTC-3): $brazilDateTime" -ForegroundColor Cyan
    
    # Aplica a data e hora no sistema
    Set-Date -Date $brazilDateTime
    
    Write-Host "Relógio atualizado com sucesso para UTC-3!" -ForegroundColor Green
}
catch {
    Write-Host "Erro: $($_.Exception.Message)" -ForegroundColor Red
}
~~~
