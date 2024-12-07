import os

# Ruta base donde están las carpetas "modulo1", "modulo2", etc.
base_path = "contenido"

for folder_name in os.listdir(base_path):
    folder_path = os.path.join(base_path, folder_name)
    # Verificar que es una carpeta
    if os.path.isdir(folder_path):
        for file_name in os.listdir(folder_path):
            if file_name.endswith(".md"):
                file_path = os.path.join(folder_path, file_name)
                # Leer el contenido del archivo
                with open(file_path, "r", encoding="utf-8") as file:
                    lines = file.readlines()

                # Extraer el título desde la primera línea
                if lines and lines[0].startswith("# "):
                    title = lines[0][2:].strip()  # Eliminar "# " y espacios
                    permalink = f"/cursos/podman2024/contenido/{folder_name}/{file_name.replace('.md', '.html')}"
                    
                    # Crear las nuevas líneas iniciales
                    header = f"""---
title: "{title}"
permalink: {permalink}
---
"""
                    # Sustituir la línea inicial por el nuevo encabezado
                    lines = [header] + lines[1:]

                    # Sobrescribir el archivo con los cambios
                    with open(file_path, "w", encoding="utf-8") as file:
                        file.writelines(lines)

print("Procesamiento completado.")
