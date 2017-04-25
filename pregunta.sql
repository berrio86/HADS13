SELECT Codigo, Descripcion, TareasGenericas.HEstimadas, TipoTarea, CodAsig
FROM TareasGenericas LEFT JOIN EstudiantesTareas
ON TareasGenericas.Codigo = EstudiantesTareas.CodTarea
WHERE Explotacion=1 AND CodAsig='EDA1' AND EstudiantesTareas.Email='pepe@ikasle.ehu.es' AND EstudiantesTareas.CodTarea IS NULL 