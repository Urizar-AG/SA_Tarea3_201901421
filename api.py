from flask import Flask, request, jsonify
from flask_cors import CORS
from database import MySQLDataBase

db = MySQLDataBase()

app = Flask(__name__)
CORS(app) 

@app.route('/')
def index():
    cursor = db.get_connection().cursor(dictionary=True)
    cursor.execute('Select * from LOGS')
    rows = cursor.fetchall()
    print(rows)
    cursor.close()
    return jsonify({'msg': 'Funciono'}), 200

@app.route('/registrar_responsable', methods=['POST'])
def registrar_responsable():
    data = request.get_json()
    cnx = db.get_connection()
    cursor = cnx.cursor()
    cursor.execute("INSERT INTO RESPONSABLES (propietario) VALUES (%s)", (data['propietario'],))
    cnx.commit()
    cursor.close()
    return jsonify({'msg': 'Responsable registrado exitosamente'}), 200

@app.route('/actualizar_responsable', methods=['PUT'])
def actualizar_responsable():
    data = request.get_json()
    cnx = db.get_connection()
    cursor = cnx.cursor()
    cursor.execute("UPDATE RESPONSABLES SET propietario = %s WHERE id_responsable = %s", (data['responsable'], data['id_responsable']))
    cnx.commit()
    cursor.close()

    return jsonify({'msg': 'Información del responsable actualizada'}), 200


@app.route('/obtener_cis', methods=['GET'])
def obtener_cis():
    cnx = db.get_connection()
    cursor = cnx.cursor(dictionary=True)
    cursor.execute('SELECT * FROM CIS')
    rows = cursor.fetchall()
    cnx.commit()
    cursor.close()
    
    return jsonify({'data': rows }), 200

@app.route('/obtener_ci', methods=['POST'])
def obtener_ci_by_id():
    data = request.get_json()
    id = data.get('id_ci')

    cnx = db.get_connection()
    cursor = cnx.cursor(dictionary=True)
    cursor.execute('SELECT * FROM CIS WHERE id_ci = %s', (str(id),))
    record = cursor.fetchone()
    cnx.commit()
    cursor.close()

    return jsonify({'data': record}), 200

@app.route('/registrar_ci', methods=['POST'])
def registrar_ci():
    data = request.get_json()
    query = """
        INSERT INTO CIS (
            nombre, tipo, descripcion, numero_serie, version,
            fecha_adquisicion, estado_actual, relaciones, padres_hijos,
            ubicacion_fisica, id_responsable, nivel_seguridad, cumplimiento,
            estado_configuracion, numero_licencia, fecha_vencimiento
        ) VALUES (
            %s, %s, %s, %s, %s, %s, %s, %s, %s, %s,
            %s, %s, %s, %s, %s, %s
        )
    """
    cnx = db.get_connection()
    cursor = cnx.cursor()
    cursor.execute(query, list(data.values()))
    cnx.commit()
    cursor.close()
    
    return jsonify({'msg': 'Configuration Item registado con éxtio'}), 200

@app.route('/actualizar_ci', methods=['PUT'])
def actualizar_ci():
    data = request.get_json()
    columns = list(data.values())
    id_ci = columns.pop(0)

    query = """
        UPDATE CIS SET
            nombre = %s, tipo = %s, descripcion=%s, numero_serie=%s, version=%s,
            fecha_adquisicion=%s, estado_actual=%s, relaciones=%s, padres_hijos=%s,
            ubicacion_fisica=%s, id_responsable=%s, nivel_seguridad=%s, cumplimiento=%s,
            estado_configuracion=%s, numero_licencia=%s, fecha_vencimiento=%s
        WHERE id_ci = %s
    """

    columns.append(id_ci)
    cnx = db.get_connection()
    cursor = cnx.cursor()
    cursor.execute(query, columns)
    cnx.commit()
    cursor.close()
    
    return jsonify({'msg': 'Configuration Item actualizado con éxito'}), 200

@app.route('/eliminar_ci', methods=['DELETE'])
def eliminar_ci():
    data = request.get_json()
    id = data.get('id_ci')

    cnx = db.get_connection()
    cursor = cnx.cursor()
    cursor.execute('DELETE FROM CIS WHERE id_ci = %s', (str(id),))
    cnx.commit()
    cursor.close()

    return jsonify({'msg': 'Configuration Item eliminado con éxito'}), 200

@app.route('/registrar_incidente', methods=['POST'])
def registrar_incidente():
    data = request.get_json()

    cnx = db.get_connection()
    cursor = cnx.cursor()
    cursor.execute('INSERT INTO INCIDENTES_PROBLEMAS(incidente_problema, id_ci) VALUES(%s,%s)', (data['incidente'], data['id_ci']))
    cnx.commit()
    cursor.close()

    return jsonify({'msg': 'Incidente registro exitosamente'})

@app.route('/registrar_documentacion', methods=['POST'])
def registrar_documentacion():
    data = request.get_json()

    cnx = db.get_connection()
    cursor = cnx.cursor()
    cursor.execute('INSERT INTO DOCUMENTACIONES(documentacion_relacionada, id_ci) VALUES(%s,%s)', (data['documentacion'], data['id_ci']))
    cnx.commit()
    cursor.close()

    return jsonify({'msg': 'Documentacion almacenada exitosamente'})


if __name__ == '__main__':
    app.run(host='0.0.0.0', port=3000,  debug=True)
