FROM nubs/phpunit:latest

MAINTAINER Spencer Rinehart <anubis@overthemonkey.com>

# Add the project code to the correct spot
ONBUILD COPY . /code

# Install the dependencies
ONBUILD RUN composer install --no-interaction

# Execute the tests
ONBUILD RUN composer test

# Override phpunit CMD with one to execute the project
CMD ["composer", "start"]
