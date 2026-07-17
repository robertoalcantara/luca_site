# Script para fazer push do projeto para GitHub
# Execute: .\PUSH_GITHUB.ps1

Write-Host "🚀 Iniciando push para GitHub..." -ForegroundColor Cyan
Write-Host ""

# Navegar para o diretório do projeto
$projectPath = Split-Path -Parent $MyInvocation.MyCommand.Path
Set-Location $projectPath

# Verificar se .git existe
if (!(Test-Path .\.git)) {
    Write-Host "❌ Erro: Repositório .git não encontrado!" -ForegroundColor Red
    Write-Host "   Execute este script na pasta do luca_site"
    exit 1
}

Write-Host "✓ Repositório git encontrado" -ForegroundColor Green

# Verificar git config
Write-Host ""
Write-Host "Configurando git..." -ForegroundColor Yellow

git config user.name "Roberto Alcantara"
git config user.email "robertoalcantara@gmail.com"

# Verificar se remoto existe
$remoteExists = git remote | findstr origin
if ($remoteExists) {
    Write-Host "✓ Remoto 'origin' já existe" -ForegroundColor Green
} else {
    Write-Host "Adicionando remoto..." -ForegroundColor Yellow
    git remote add origin https://github.com/robertoalcantara/luca_site.git
    Write-Host "✓ Remoto adicionado" -ForegroundColor Green
}

# Verificar branch
Write-Host ""
Write-Host "Verificando branch..." -ForegroundColor Yellow
$currentBranch = git rev-parse --abbrev-ref HEAD
Write-Host "Branch atual: $currentBranch" -ForegroundColor Cyan

# Renomear para main se está em master
if ($currentBranch -eq "master") {
    Write-Host "Renomeando branch para 'main'..." -ForegroundColor Yellow
    git branch -M main
    Write-Host "✓ Branch renomeado para 'main'" -ForegroundColor Green
}

# Fazer push
Write-Host ""
Write-Host "Fazendo push para GitHub..." -ForegroundColor Yellow
Write-Host "(Você pode ser solicitado a entrar com suas credenciais)" -ForegroundColor Gray
Write-Host ""

git push -u origin main

if ($LASTEXITCODE -eq 0) {
    Write-Host ""
    Write-Host "✅ Push concluído com sucesso!" -ForegroundColor Green
    Write-Host ""
    Write-Host "Seu site está em: https://github.com/robertoalcantara/luca_site" -ForegroundColor Cyan
    Write-Host "Para ativar GitHub Pages:" -ForegroundColor Yellow
    Write-Host "  1. Vá para Settings → Pages" -ForegroundColor Gray
    Write-Host "  2. Selecione 'main' como branch" -ForegroundColor Gray
    Write-Host "  3. Selecione '/ (root)' como pasta" -ForegroundColor Gray
    Write-Host "  4. Clique em 'Save'" -ForegroundColor Gray
    Write-Host ""
    Write-Host "Seu site estará disponível em: https://robertoalcantara.github.io/luca_site/" -ForegroundColor Cyan
} else {
    Write-Host ""
    Write-Host "❌ Erro ao fazer push!" -ForegroundColor Red
    Write-Host "Verifique sua conexão com a internet e suas credenciais do GitHub" -ForegroundColor Yellow
}

Write-Host ""
Write-Host "Pressione qualquer tecla para sair..."
$null = $Host.UI.RawUI.ReadKey("NoEcho,IncludeKeyDown")
