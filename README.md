# 📱 Rick & Morty SwiftUI App

Bienvenido a la **Rick & Morty SwiftUI App**, una aplicación desarrollada en **SwiftUI** que consume la famosa API de [Rick and Morty API](https://rickandmortyapi.com/). Este proyecto ha sido creado para explorar y practicar arquitecturas desacopladas, patrones de diseño y la integración de APIs REST en Swift.

## 📌 Características

✅ **Lista de personajes** con imágenes y detalles.
✅ **Búsqueda de personajes** por nombre.
✅ **Paginación** en la lista de personajes.
✅ **Detalle de personaje**, con información detallada.
✅ **Navegación fluida** con SwiftUI.
✅ **Arquitectura desacoplada** siguiendo Clean Architecture.
✅ **Filtrado por estado** (vivo, muerto, desconocido).
❌ **Pruebas unitarias** con XCtests.

## 🛠️ Tecnologías utilizadas

- **SwiftUI** 📱 - UI declarativa para iOS.
- **URLSession** 🌐 - Consumo de la API REST.
- **Codable** 🔄 - Decodificación de JSON.
- **Async/Await** ⚡ - Llamadas asíncronas modernas.
- **Clean Architecture** 🏗️ - División en capas para mayor mantenibilidad.

## 📂 Estructura del proyecto

```
RickAndMortyApp/
│── Presentation/         # Vistas en SwiftUI y ViewModels
│    ├── Views/           # Vistas y componentes de UI
│    ├── ViewModels/      # Lógica de presentación y binding con la vista
│── Domain/               # Casos de uso y modelos de negocio
│    ├── Entities/        # Modelos de datos del dominio
│    ├── UseCases/        # Lógica de negocio y casos de uso
│── Data/                 # Implementaciones de la capa de datos
│    ├── Repositories/    # Implementación de los repositorios
│    ├── Network/         # Capa de red y consumo de API
│    ├── DTOs/            # Objetos de transferencia de datos
│── RickAndMortyApp.swift # Punto de entrada de la app
```

## 🚀 Instalación y ejecución

1️⃣ Clona el repositorio:
```bash
git clone https://github.com/ahhhv/RickAndMorty.git
```

2️⃣ Abre el proyecto en **Xcode**.

3️⃣ Ejecuta en el simulador o en un dispositivo real.

## 🔗 API utilizada

Se utiliza la [Rick and Morty API](https://rickandmortyapi.com/) para obtener los datos de los personajes, episodios y ubicaciones.

Ejemplo de petición a la API:
```swift
let url = URL(string: "https://rickandmortyapi.com/api/character")!
```

## 📸 Capturas de pantalla

* Pendiente. 

## 🏗️ Mejoras futuras

- [ ] Favoritos persistentes.
- [ ] Soporte para episodios y localizaciones.

## 🤝 Contribución

Si quieres contribuir, ¡adelante! Haz un fork del repositorio y abre un pull request con tus mejoras.
