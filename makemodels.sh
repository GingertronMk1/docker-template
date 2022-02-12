#!/bin/sh

MODELS=(Client Site Building Floor Job EngineerAssignment EngineerCheckin Discipline DisciplineLink)

for MODEL in $MODELS
do
    docker-compose exec app php artisan make:model $MODEL -a
    cp -r ./resources/js/Pages/_template ./resources/js/Pages/$MODEL
done
