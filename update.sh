git commit -am "$1"
git push
ssh debian@playerone.josedomingo.org "www/plataforma_pledin/plataforma.sh"
