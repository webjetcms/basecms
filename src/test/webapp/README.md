# Automatizovane testovanie

[Presunute do dokumentacie](../../../docs/testing/README.md)

## Spustenie testovania

[Spustenie](https://codecept.io/commands/) všetkých testov:

```sh
cd src/test/webapp/
npx codeceptjs run --steps 
```

Spustenie konkrétneho testu:

```sh
npx codeceptjs run tests/components/gallery_test.js --steps
```
