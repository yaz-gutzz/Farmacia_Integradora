import httpx
import asyncio
from datetime import datetime

BASE_URL = "http://localhost:8000"
AUTH = ("admin", "1234")

async def run_scenario(name, func):
    print(f"\n>>> EJECUTANDO ESCENARIO: {name} <<<")
    try:
        await func()
        print(f"[OK] ESCENARIO COMPLETADO: {name}")
    except Exception as e:
        print(f"[ERROR] ESCENARIO {name}: {str(e)}")

async def test_full_flow():
    async with httpx.AsyncClient(auth=AUTH, timeout=10.0) as client:
        
        # 1. COMPRA INICIAL (Medicamento 4: Amoxicilina)
        print("1. Registrando Compra...")
        compra_res = await client.post(f"{BASE_URL}/api/compras/", json={
            "id_medicamento": 4, "cantidad": 50, "numero_lote": "TEST-AMOX-001",
            "presentacion": "Caja 10 caps"
        })
        assert compra_res.status_code == 200, f"Error en compra: {compra_res.text}"
        print("   - Compra OK")

        # 2. CREAR RECETA
        print("2. Creando Receta...")
        receta_res = await client.post(f"{BASE_URL}/api/recetas/", json={
            "id_paciente": 1, "id_personal_medico": 1,
            "medicamentos": [{"id_medicamento": 4, "cantidad": 20}]
        })
        assert receta_res.status_code == 200, f"Error en receta: {receta_res.text}"
        id_receta = receta_res.json()["id_receta"]
        print(f"   - Receta {id_receta} creada OK")

        # 3. DISPENSAR (Surtido Total)
        print("3. Dispensando Receta (Total)...")
        disp_res = await client.post(f"{BASE_URL}/api/dispensacion/", json={"id_receta": id_receta})
        assert disp_res.status_code == 200, f"Error en dispensación: {disp_res.text}"
        print("   - Dispensación OK")

        # 4. SURTIDO PARCIAL / SUBROGACION
        # Creamos receta sin stock suficiente (ID 5: Aspirina, asumimos poco o nada)
        print("4. Testeando Sin Existencias / Subrogación...")
        receta_fail_res = await client.post(f"{BASE_URL}/api/recetas/", json={
            "id_paciente": 1, "id_personal_medico": 1,
            "medicamentos": [{"id_medicamento": 5, "cantidad": 999}]
        })
        id_receta_fail = receta_fail_res.json()["id_receta"]
        
        # Intentar dispensar (Debe dar 400 por falta de stock total o avisar)
        disp_fail_res = await client.post(f"{BASE_URL}/api/dispensacion/", json={"id_receta": id_receta_fail})
        print(f"   - Intento dispensar con 0 stock: {disp_fail_res.status_code} (Detalle: {disp_fail_res.json()['detail']})")
        
        # Hacer Subrogación
        sub_res = await client.post(f"{BASE_URL}/api/subrogaciones/", json={"id_receta": id_receta_fail})
        assert sub_res.status_code == 200, f"Error en subrogación: {sub_res.text}"
        print("   - Subrogación creada OK")

        # 5. VERIFICAR KARDEX
        print("5. Verificando Kardex...")
        kardex_res = await client.get(f"{BASE_URL}/api/kardex/4")
        assert kardex_res.status_code == 200
        movs = kardex_res.json().get("movimientos", [])
        print(f"   - Movimientos encontrados para Medicina 4: {len(movs)}")
        for m in movs:
            print(f"     * [{m['tipo']}] {m['motivo']} | Qty: {m['cantidad']}")

async def main():
    await run_scenario("CIRCULO COMPLETO (Compra -> Receta -> Surtido -> Kardex)", test_full_flow)

if __name__ == "__main__":
    asyncio.run(main())
