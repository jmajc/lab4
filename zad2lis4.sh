#!/bin/bash

if [ "$1" = "--help" ] || [ "$1" = "-h" ]; then
    echo "Użycie: zad2lis4.sh [OPCJA]"
    echo "Opcje:"
    echo "  --help, -h          Wyświetla pomoc"
    echo "  --logs [LICZBA]     Tworzy pliki logx/logx.txt z liczbą plików LICZBA (domyślnie 100)"
    echo "  --error [LICZBA]    Tworzy pliki errorx/errorx.txt z liczbą plików LICZBA (domyślnie 100)"
    echo "  --init              Klonuje repozytorium do bieżącego katalogu i ustawia ścieżkę w zmiennej środowiskowej PATH"
    exit 0
fi

if [ "$1" = "--init" ]; then
    git clone https://github.com/lab4.git
    export PATH=$PATH:$(pwd)/lab4
    echo "Repozytorium zostało sklonowane, a ścieżka została dodana do zmiennej środowiskowej PATH."
    exit 0
fi

if [ "$1" = "--logs" ]; then
    liczba_plikow=${2:-100}
    for ((i=1; i<=liczba_plikow; i++))
    do
        nazwa_pliku="log$i/log$i.txt"
        echo "Nazwa pliku: $nazwa_pliku" >> $nazwa_pliku
        echo "Nazwa skryptu: zad2lis4.sh" >> $nazwa_pliku
        echo "Data: $(date)" >> $nazwa_pliku
    done
    echo "Utworzono $liczba_plikow plików logx/logx.txt."
    exit 0
fi

if [ "$1" = "--error" ] || [ "$1" = "-e" ]; then
    liczba_plikow=${2:-100}
    for ((i=1; i<=liczba_plikow; i++))
    do
        nazwa_pliku="error$i/error$i.txt"
        echo "Nazwa pliku: $nazwa_pliku" >> $nazwa_pliku
        echo "Nazwa skryptu: zad2lis4.sh" >> $nazwa_pliku
        echo "Data: $(date)" >> $nazwa_pliku
    done
    echo "Utworzono $liczba_plikow plików errorx/errorx.txt."
    exit 0
fi

echo "Nieznana opcja. Użyj zad2lis4.sh --help, aby uzyskać więcej informacji."
exit 1
