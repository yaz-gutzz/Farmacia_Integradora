// =========================================================
// SISTEMA: FARMACIA HOSPITALARIA
// RBAC - CONTROL DE ACCESO (MONGODB)
// =========================================================

use farmacia;


// =========================================================
// 1. ROLES DEL SISTEMA
// =========================================================

// JEFE DE FARMACIA (control total)
db.createRole({
  role: "rol_jefe_farmacia",
  privileges: [
    {
      resource: { db: "farmacia", collection: "" },
      actions: ["find", "insert", "update", "remove"]
    }
  ],
  roles: []
});


// AUXILIAR DE FARMACIA (dispensación)
db.createRole({
  role: "rol_aux_farmacia",
  privileges: [
    { resource: { db: "farmacia", collection: "medicamentos" }, actions: ["find"] },
    { resource: { db: "farmacia", collection: "recetas" }, actions: ["find"] },
    { resource: { db: "farmacia", collection: "dispensacion" }, actions: ["insert"] },
    { resource: { db: "farmacia", collection: "inventario_medicamentos" }, actions: ["update"] }
  ],
  roles: []
});


// INVENTARIO
db.createRole({
  role: "rol_inventario_farmacia",
  privileges: [
    { resource: { db: "farmacia", collection: "inventario_medicamentos" }, actions: ["find"] },
    { resource: { db: "farmacia", collection: "movimientos" }, actions: ["insert", "update"] }
  ],
  roles: []
});


// COMPRAS
db.createRole({
  role: "rol_compras_farmacia",
  privileges: [
    { resource: { db: "farmacia", collection: "proveedores" }, actions: ["find"] },
    { resource: { db: "farmacia", collection: "medicamentos" }, actions: ["find"] },
    { resource: { db: "farmacia", collection: "compras" }, actions: ["insert"] }
  ],
  roles: []
});


// SUBROGACIÓN
db.createRole({
  role: "rol_subrogacion_farmacia",
  privileges: [
    { resource: { db: "farmacia", collection: "subrogaciones" }, actions: ["find", "insert"] },
    { resource: { db: "farmacia", collection: "recetas" }, actions: ["find"] }
  ],
  roles: []
});


// =========================================================
// 2. USUARIOS DEL SISTEMA
// =========================================================

db.createUser({
  user: "jefe_farmacia",
  pwd: "Jefe@123",
  roles: ["rol_jefe_farmacia"]
});

db.createUser({
  user: "aux_farmacia",
  pwd: "Aux@123",
  roles: ["rol_aux_farmacia"]
});

db.createUser({
  user: "inventario_farmacia",
  pwd: "Inv@123",
  roles: ["rol_inventario_farmacia"]
});

db.createUser({
  user: "compras_farmacia",
  pwd: "Comp@123",
  roles: ["rol_compras_farmacia"]
});

db.createUser({
  user: "subrogacion_farmacia",
  pwd: "Sub@123",
  roles: ["rol_subrogacion_farmacia"]
});


// =========================================================
// 3. VERIFICACIÓN
// =========================================================

show users;
show roles;