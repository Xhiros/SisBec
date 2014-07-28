@echo off
echo Instalando gemas faltantes

bundle update
bundle install
bundle update
bundle install

pause
exit