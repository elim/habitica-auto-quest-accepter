habitica-auto-quest-accepter
============================

Auto-accepts an invitation of a quest from your party member on Habitica.

Usage
-----

* Docker Compose (recommended):

        cp .env{.sample,}
        vi $_
        docker-compose pull
        docker-compose up

* Docker directly:

        docker pull elim/habitica-auto-quest-accepter:0.0.2
        docker run --rm -it \
          -e API_USER=your-api-user \
          -e API_KEY=your-api-key \
          elim/habitica-auto-quest-accepter:0.0.2

License
-------

MIT: http://elim.mit-license.org/2018
