@echo off
echo.
echo ========================================
echo   PUSH LUCA DIAS SITE PARA GITHUB
echo ========================================
echo.

REM Navegar para a pasta do projeto
cd /d "%~dp0"

REM Configurar git
echo [1/4] Configurando git...
git config user.name "Roberto Alcantara"
git config user.email "robertoalcantara@gmail.com"

REM Adicionar remoto
echo [2/4] Configurando remoto...
git remote remove origin 2>nul
git remote add origin https://github.com/robertoalcantara/luca_site.git

REM Renomear branch para main
echo [3/4] Preparando branch...
git branch -M main 2>nul

REM Fazer push
echo [4/4] Fazendo push para GitHub...
echo.
git push -u origin main

echo.
if %ERRORLEVEL% EQU 0 (
    echo ✓ SUCESSO! Repositorio enviado para GitHub
    echo.
    echo URL: https://github.com/robertoalcantara/luca_site
    echo.
) else (
    echo ✗ Erro ao fazer push
    echo Verifique sua conexao e credenciais do GitHub
    echo.
)

pause
