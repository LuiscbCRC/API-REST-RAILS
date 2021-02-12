## Prueba técnica Vippinn/HelloWine
En el presente proyecto se encuentra el API en Ruby on Rails, siguiendo los requerimientos entregados en la entrevista.

Actualmente se esta utilizando las siguientes versiones:
```bash
ruby 2.6.5
rails 6.0.3
PostgreSQL 13
Docker 20.10.2
```

## Docker
Para utilizar el API debe realizar los siguientes pasos
```bash
docker-compose -f docker-compose.yml up --build
```

Puede salirse de los servicios con Crtl + C para continuar con la configuración del proyecto.

Después, debe correr las migraciones y llenar la base de datos con información para poder utilizar el API de una manera más sencilla.

```bash
docker-compose run web rails db:migrate
docker-compose run web rails db:seed
```

Por último puede volver a correr el primer comando mostrado o únicamente realizar:
```bash
docker-compose up
```

## Ruby on Rails Local
Para utilizar el proyecto de forma local, debe de realizar los siguientes comandos:
```bash
bundle install
rake db:create
rake db:migrate
rake db:seed
rails s
```

## Testing y documentación
Para ingresar a la documentación debe de ingresar directamente en la página pricipal una vez que el servidor esté corriendo. De esta manera, al ingresar al navegador en localhost:3000, se le muestra la documentación

Para correr el testing de la aplicación, basta con correr el comando:
```bash
bundle exec rspec
```


