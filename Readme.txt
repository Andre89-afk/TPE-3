API REST de Bolsos.
Esta es una API RESTful para la gestión de bolsos en una tienda online.
La API permite realizar operaciones de incluir listado, creación y búsqueda por ID.

Endpoints
1. Obtener todos los bolsos (GET)
Endpoint: /api/bolsos
Lista todos los bolsos. Puedes aplicar ordenación y filtrado.

Parámetros:
orderBy: Campo por el cual ordenar los resultados (nombre, color, precio).
filterBy: Filtra los bolsos por un campo específico (por ejemplo, color, categoria).

2. Obtener un bolso por ID (GET)
Endpoint: /api/bolsos/{id}
Obtiene un bolso por su ID.

Parámetros:
{id}: El ID del bolso que deseas obtener.

Errores posibles:
404 Not Found: Si no se encuentra el bolso.

3. Crear un nuevo bolso (POST)
Endpoint: /api/bolsos
Crea un nuevo bolso. Se requiere un cuerpo de solicitud con los datos del bolso.

Parámetros (en el cuerpo de la solicitud):

Nombre: Nombre del bolso (cadena).
Color: Color del bolso (cadena).
Precio: Precio del bolso (número).
id_categoria: ID de la categoría a la que pertenece el bolso (número) depende del TPE2.

Errores posibles:
400 Bad Request: Si faltan campos obligatorios.
