"""
Test E2E para Hospital Pharmacy Python API
Siembra datos en MySQL y llama a los endpoints con Basic Auth.
"""
import requests
import aiomysql
import asyncio

BASE_URL = "http://localhost:8000"
AUTH = ("admin", "1234")

async def seed_data():
    """Siembra datos mínimos en MySQL con el mismo bypass que el script de Node.js."""
    conn = await aiomysql.connect(host="localhost", user="root", password="1234", db="hospital_matricula")
    cur = await conn.cursor()

    await cur.execute("SET sql_mode = ''")
    await cur.execute("SET FOREIGN_KEY_CHECKS = 0")

    # 1. Espacio
    await cur.execute("SELECT ID FROM tbc_mr_espacios LIMIT 1")
    row = await cur.fetchone()
    if row:
        esp_id = row[0]
    else:
        await cur.execute("INSERT INTO tbc_mr_espacios (Nombre, Estatus) VALUES ('Farmacia Test', 1)")
        esp_id = cur.lastrowid

    # 2. Area
    await cur.execute("SELECT ID FROM tbc_ge_areas LIMIT 1")
    row = await cur.fetchone()
    if row:
        ar_id = row[0]
    else:
        await cur.execute("INSERT INTO tbc_ge_areas (Nombre, Espacio_ID, Personal_Responsable_ID, Estatus) VALUES ('Area Farmacia', %s, 1, 1)", (esp_id,))
        ar_id = cur.lastrowid

    # 3. Personal médico
    await cur.execute("SELECT ID FROM tbb_hr_personal_medico LIMIT 1")
    row = await cur.fetchone()
    if row:
        doc_id = row[0]
    else:
        await cur.execute("INSERT INTO tbb_hr_personal_medico (Turno, Area_ID, Estatus) VALUES ('MATUTINO', %s, 1)", (ar_id,))
        doc_id = cur.lastrowid

    # 4. Paciente
    await cur.execute("SELECT ID FROM tbb_md_pacientes LIMIT 1")
    row = await cur.fetchone()
    if row:
        pat_id = row[0]
    else:
        await cur.execute("INSERT INTO tbb_md_pacientes (estatus) VALUES (1)")
        pat_id = cur.lastrowid

    # 5. Medicamento
    await cur.execute("SELECT Id FROM tbc_ph_medicamentos LIMIT 1")
    row = await cur.fetchone()
    if row:
        med_id = row[0]
    else:
        await cur.execute("INSERT INTO tbc_ph_medicamentos (Nombre, Tipo_Medicamento, Estatus) VALUES ('Paracetamol Test', 'normal', 1)")
        med_id = cur.lastrowid

    # 6. Lote con stock
    await cur.execute("SELECT Id FROM tbd_ph_lotes_medicamentos WHERE Medicamento_Id = %s AND Cantidad_Actual > 0", (med_id,))
    if not await cur.fetchone():
        await cur.execute(
            "INSERT INTO tbd_ph_lotes_medicamentos (Medicamento_Id, Numero_Lote, Cantidad_Inicial, Cantidad_Actual, Estado_Lote, Fecha_Registro) "
            "VALUES (%s, 'LOT-PY-TEST', 100, 100, 'disponible', NOW())", (med_id,))

    # 7. Receta NUEVA (siempre nueva para evitar duplicados en Mongo)
    await cur.execute(
        "INSERT INTO tbb_ph_recetas_medicas (Paciente_Id, Personal_Medico_Id, Estado_Receta, Fecha_Emision, Fecha_Registro, Estatus) "
        "VALUES (%s, %s, 'Pendiente', NOW(), NOW(), 1)", (pat_id, doc_id))
    receta_id = cur.lastrowid

    # 8. Detalle de receta
    await cur.execute(
        "INSERT INTO tbd_ph_detalle_receta (Receta_Id, Medicamento_Id, Dosis, Frecuencia, Duracion, Cantidad, Indicaciones, Fecha_Registro) "
        "VALUES (%s, %s, '1 tab', '8h', '5 dias', 3, 'Test Python', NOW())", (receta_id, med_id))

    await cur.execute("SET sql_mode = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION'")
    await cur.execute("SET FOREIGN_KEY_CHECKS = 1")
    await conn.commit()
    await cur.close()
    conn.close()

    print(f"✅ Data seeded - Receta ID: {receta_id}, Medicamento ID: {med_id}")
    return receta_id, med_id

def test_endpoints(receta_id, med_id):
    print("\n--- Pruebas de la API Python ---\n")

    # 1. Health check (sin auth)
    r = requests.get(f"{BASE_URL}/")
    print(f"[1] GET /   → {r.status_code}: {r.json()}")

    # 2. Endpoint sin auth (debe dar 401)
    r = requests.post(f"{BASE_URL}/api/dispensacion/", json={"id_receta": receta_id})
    print(f"[2] POST /api/dispensacion/ sin auth → {r.status_code} (esperado 401)")

    # 3. Dispensación con auth
    r = requests.post(f"{BASE_URL}/api/dispensacion/", json={"id_receta": receta_id}, auth=AUTH)
    print(f"[3] POST /api/dispensacion/ con auth → {r.status_code}")
    if r.ok:
        data = r.json()
        print(f"    ✅ Éxito: {len(data.get('dispensados', []))} medicamentos surtidos")
        print(f"    📦 MongoDB ID: {data.get('id_dispensacion_mongo')}")
    else:
        print(f"    ❌ Error: {r.text[:200]}")

    # 4. Kardex
    r = requests.get(f"{BASE_URL}/api/kardex/{med_id}", auth=AUTH)
    print(f"[4] GET /api/kardex/{med_id} → {r.status_code}")
    if r.ok:
        movs = r.json().get("movimientos", [])
        print(f"    📋 Movimientos en Kardex: {len(movs)}")
    else:
        print(f"    ❌ Error: {r.text[:200]}")

    # 5. Compra
    r = requests.post(f"{BASE_URL}/api/compras/", json={
        "id_medicamento": med_id, "cantidad": 50,
        "numero_lote": "LOT-COMPRA-PY", "fecha_caducidad": "2029-01-01"
    }, auth=AUTH)
    print(f"[5] POST /api/compras/ → {r.status_code}")
    if r.ok:
        print(f"    ✅ Compra: {r.json()}")
    else:
        print(f"    ❌ Error: {r.text[:200]}")

    print("\n--- Pruebas completadas ---")

async def main():
    receta_id, med_id = await seed_data()
    test_endpoints(receta_id, med_id)

if __name__ == "__main__":
    asyncio.run(main())
