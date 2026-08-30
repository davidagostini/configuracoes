# 1. Instalar Aplicativos Desktop via WinGet
winget install --id Anthropic.Claude --silent --accept-package-agreements --accept-source-agreements
winget install --id 9NT1R1C2HH7J --source msstore --silent --accept-package-agreements --accept-source-agreements

# 2. Instalar Ferramentas de Linha de Comando (CLI)
irm https://claude.ai/install.ps1 | iex
winget install --id Anthropic.ClaudeCode --silent --accept-package-agreements
