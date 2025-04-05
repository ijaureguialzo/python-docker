# python-docker

Entorno de desarrollo para Python con Docker.

## Puesta en marcha

1. Instalar [Docker Desktop](https://www.docker.com/products/docker-desktop/).
2. En Windows, instalar [Scoop](https://scoop.sh) usando PowerShell:

   ```powershell
   Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser
   Invoke-RestMethod -Uri https://get.scoop.sh | Invoke-Expression
   ```

   Y después instalar los comandos necesarios:

   ```powershell
   scoop install make
   ```

3. Clonar este repositorio:

   ```shell
   git clone https://github.com/ijaureguialzo/python-docker.git
   ```

   > Si el comando anterior no funciona, habrá que [instalar Git](https://git-scm.com/downloads) en el sistema.

4. En un terminal, situarse en la carpeta `python-docker` (o si se ha renombrado, la que contenga este archivo
   `README.md` que estás leyendo):

   ```shell
   cd python-docker
   ```

5. Construir el contenedor:

   ```shell
   make build
   ```

   > Este proceso solo hay que lanzarlo una vez (salvo que queramos reconfigurar algo).

## Acceso al contenedor

Para iniciar sesión en el contenedor:

```shell
make workspace
```

> El contenedor solo puede leer y escribir en la carpeta `proyectos` de este repositorio. Ese será el directorio de
> trabajo a utilizar.

## Sesiones adicionales del contenedor

Para abrir sesiones extra del contenedor:

```shell
make workspace-extra
```

> Solo la sesión creada con `workspace` puede utilizar el puerto del servidor web.

## Configurar la versión de Python

Copiar el fichero `env-example` a `.env` y editar su contenido:

En macOS y Linux:

```shell
cp env-example .env
```

En Windows:

```shell
copy env-example .env
```

## Limpieza

Si no necesitamos más el contenedor y queremos liberar espacio en disco, podemos eliminar todos los datos con el
comando:

```shell
make clean
```

## Ejemplo: Crear un proyecto Django con Poetry

1. Entrar en el contenedor:

    ```shell
    make workspace
    ```

2. Crear la carpeta de proyecto:

    ```shell
    mkdir mi_proyecto && cd mi_proyecto
    ```

3. Inicializar Poetry:

    ```shell
    poetry init --no-interaction --python=^3.13
    ```

4. Definir las dependencias necesarias:

    ```shell
    poetry add django
    ```

5. Instalar las dependencias:

    ```shell
    poetry install --no-root
    ```

6. Inicializar el proyecto Django:

    ```shell
    poetry run django-admin startproject mi_proyecto .
    ```

7. Lanzar las migraciones:

    ```shell
    poetry run python manage.py migrate
    ```

8. Establecer la contraseña del usuario administrador:

    ```shell
    poetry run python manage.py createsuperuser
    ```

9. Arrancar el servidor de desarrollo:

    ```shell
    poetry run python manage.py runserver 0.0.0.0:8000
    ```

10. Acceder a los sitios web:

    - [Página principal](http://localhost:8000)
    - [Panel de administración](http://localhost:8000/admin)

## Referencias

- [Poetry](https://python-poetry.org)
- [How to start a new Django project using poetry?](https://stackoverflow.com/a/60252551)
- [Why is not recommended to install poetry with homebrew?](https://stackoverflow.com/questions/73365780/why-is-not-recommended-to-install-poetry-with-homebrew)
- [Poetry Plugin: Dependencies sorting](https://pypi.org/project/poetry-plugin-sort/)
