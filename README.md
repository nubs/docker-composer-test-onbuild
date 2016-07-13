# docker-composer-test-onbuild
This is a docker image for executing tests of a [PHP][PHP]
[composer][composer] project [ONBUILD][ONBUILD].

## Purpose
This docker image builds on top of the [phpunit][docker-phpunit] image, but
adds `ONBUILD` instructions to install the project code into the container and
execute both `composer install` and `composer test`.  It also sets the default
command to the potentially-useful `composer start` (this depends on having a
`start` script setup in your `composer.json`).

## Usage
This library is useful with a simple `composer.json` and `Dockerfile`.  The
only addition to a `composer.json` file beyond the default, is the need to
define the [`composer test` custom command][composer-custom-command] to
execute.

For example, using the `composer.json` snippet:

```json
{
    "scripts": {
        "test": "phpunit"
    }
}
```

and `Dockerfile`:

```dockerfile
FROM nubs/composer-test-onbuild:latest
```

you can build an image with dependencies installed like so:

```bash
docker build --tag my-image .
```

Any failures with the above build (e.g., if `composer test` fails) will cause
the build to fail.

Once the image is built, to execute the default command (`composer start`),
you can simply run:

```bash
docker run -it --rm my-image
```

Other commands can also be executed.  For example, to run phpunit (assuming it
is installed via composer):

```bash
docker run -it --rm my-image phpunit
```

## License
docker-composer-test-onbuild is licensed under the MIT license.  See [LICENSE]
for the full license text.

[PHP]: http://php.net/ "PHP: Hypertext Preprocessor"
[composer]: https://getcomposer.org/
[ONBUILD]: https://docs.docker.com/reference/builder/#onbuild
[docker-phpunit]: https://github.com/nubs/docker-phpunit
[composer-custom-command]: https://getcomposer.org/doc/articles/scripts.md#writing-custom-commands
[LICENSE]: https://github.com/nubs/docker-composer-onbuild/blob/master/LICENSE
