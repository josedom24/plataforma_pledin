git commit -am "$1"
git push
ssh debian@endor.josedomingo.org "www/plataforma_pledin/plataforma.sh"
