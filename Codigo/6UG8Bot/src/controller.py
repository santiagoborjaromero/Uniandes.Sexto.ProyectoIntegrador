import os
import json
import mysql.connector
from datetime import date, time, datetime
import numpy as np

from config.init import DBUSER, DBPASS, DBHOST, DB
from pprint import pprint
from src.utils import logger, open_file

conn = None
cursor = None

def connectDB():
    try:
        return mysql.connector.connect(
            user = DBUSER,
            password = DBPASS,
            host = DBHOST,
            database = DB
        )
    except mysql.connector.Error as err:
        print(f"Error de conexión: {err}")
        logger("ERROR", err, "CONTROLLER.LN.21")
        return None
    
def closeDB():
    conn.close()  


def buildTable(rows):
    # for row in rows:
    #     d = row.split("|")
    return rows
    
def switchIAbot():
    switchbot = "own"
    conn = connectDB()
    if conn == None:
        print("e01")
        # logger("ERROR", "Sin conexion DB", "CONTROLLER.LN.33")
    else:
        sqlcmd = "select vvalue from bot_config WHERE module = 'switch_ia_bot' "
        msg = ""
        with conn.cursor() as cursor:
            cursor.execute(sqlcmd)
            rows = cursor.fetchall()
            
            if len(rows) == 0:
                return "ERROR"
            
    return rows
    
def capasNeuronales():
    try:
        conn = connectDB()
        if conn == None:
            print("e01")
        else:
            sqlcmd = "SELECT wordfind as entrada, menurun as salida FROM bot_spelling WHERE confirmed = 1 "
            msg = ""
            with conn.cursor() as cursor:
                cursor.execute(sqlcmd)
                rows = cursor.fetchall()
                
                if len(rows) == 0:
                    logger("ERROR", "Query", "CONTROLLER.LN.41")
                    return "ERROR"
                
                return rows
            
    except Exception as err: 
        logger("ERROR", err, "CONTROLLER.LN.76")
        print("error: ", err)
        

def botAudit(idUser = 0, author = '',lang = 'es', username='', textentered = "", keyresult = '', bot = None):
    try:
        conn = connectDB()
        if conn == None:
            print("e01")
            logger("ERROR", "Sin conexion DB", "CONTROLLER.LN.37")
        else:
            sqlcmd = "CALL store_bot_messages (%s, %s, %s, %s, %s, %s, %s)"
            args = (idUser,author,lang,username,textentered,keyresult,bot)
            msg = ""
            with conn.cursor() as cursor:
                cursor.execute(sqlcmd, args)
                rows = cursor.fetchall()
                
                if len(rows) == 0:
                    logger("ERROR", "Audit", "CONTROLLER.LN.49")
                    return "AUDITERROR"
            
                for row in rows:
                    msg = row[0]
                    
            # conn.commit()   # solo se usa cuando hay insert
            return msg
            # mycursor.executemany(sql, data)
            # mydb.commit()
            
    except Exception as err: 
        logger("ERROR", err, "CONTROLLER.LN.61")
        print("error: ", err)

def startSession(idUser, currentpass):
    conn = connectDB()
    if conn == None:
        return "Los datos no se encuentran disponibles por el momento, e01."
    else:
        sqlcmd = "CALL set_session(%s, %s)"
        args = (idUser, currentpass)
        
        # print(sqlcmd)
        
        msg = ""
        with conn.cursor() as cursor:
            cursor.execute(sqlcmd, args)
            rows = cursor.fetchall()
            
            if len(rows) == 0:
                return "ERROR|EMPTY"
        
            for row in rows:
                msg = row[0]
        return msg
    
def checkPassword(idUser):
    conn = connectDB()
    if conn == None:
        return "Los datos no se encuentran disponibles por el momento, e01."
    else:
        sqlcmd = "CALL check_password(" + str(idUser) + ")"
        
        # print(sqlcmd)
        
        msg = ""
        with conn.cursor() as cursor:
            cursor.execute(sqlcmd)
            rows = cursor.fetchall()
            
            if len(rows) == 0:
                return "ERROR|EMPTY"
        
            for row in rows:
                msg = row[0]
        return msg
        
def setPassword(idUser, password):
    conn = connectDB()
    if conn == None:
        return "Los datos no se encuentran disponibles por el momento, e01."
    else:
        sqlcmd = "CALL set_password (%s, %s)"
        args = (idUser, password)
        
        print(sqlcmd, args)
        
        msg = ""
        with conn.cursor() as cursor:
            cursor.execute(sqlcmd, args)
            rows = cursor.fetchall()
            
            if len(rows) == 0:
                return "ERROR|EMPTY"
        
            for row in rows:
                msg = row[0]
                
        # conn.commit()   # solo se usa cuando hay insert
        return msg
        
        
    return "Lista ya estas creado, gracias, ahora si a informarnos. Que necesitas saber?"

def getSpelling(words):
    conn = connectDB()
    if conn == None:
        return "Los datos no se encuentran disponibles por el momento, e01."
    else:
        # listado,de,productos,por,cliente
        # sqlcmd = "SELECT menurun from bot_spelling WHERE wordfind like '%" + findText + "%' LIMIT 1"
        sqlcmd = "SELECT menurun from bot_spelling WHERE wordfind IN ("
        
        count = 0
        connc = ""
        
        for w in words:
            count = count + 1
            # sqlcmd = sqlcmd + " OR wordfind like '%" + w + "%'"
            if count>1:
                connc = ","
            else:
                connc = ""
                
            sqlcmd = sqlcmd + connc +  "'" + w + "'"
        
        sqlcmd = sqlcmd + ") LIMIT 1"
        
        # print(sqlcmd)
        
        try:
            cursor = conn.cursor()
            cursor.execute(sqlcmd)
            rows = cursor.fetchall()
            
            # pprint(rows)
            
            if len(rows) == 0:
                return ""
            
            for row in rows:
                return row[0]
                    
        except Exception as err:
            print(err)
            logger("ERROR", err, "CONTROLLER.LN.174")
            return "Los datos no se encuentran disponibles por el momento, e04."
        
        
def getDictionary(findText, largo, obj, author, idUser, bot, chat_id, modeBot):
    if findText == "":
        return
    textResult = ""
    
    ddate = datetime.now()
    
    fecha = ddate.strftime("%Y-%m-%d")
    
    hora = ddate.hour
    min = ddate.minute
    
    hora_completa  = ddate.strftime("%H:%M:%S")
    
    fecha_hora = f"{ddate.strftime("%Y%m%d_%H%M%S")}"
    
    tiempo = ""
    
    if (hora >= 0 and min>=0) and (hora <=11 and min <= 59):
        tiempo = "buenos dias"
    elif (hora >= 12 and min>=0) and (hora <=18 and min <= 29):
        tiempo = "buenas tardes"
    elif (hora >= 18 and min>=30) and (hora <=23 and min <= 59):
        tiempo = "buenas noches"
    
    conn = connectDB()
    if conn == None:
        textResult = "Los datos no se encuentran disponibles por el momento, e01."
    else:
        sqlcmd = "SELECT action,txt,field_search from bot_dictionary WHERE menu='" + findText + "' LIMIT 1"
        
        try:
            cursor = conn.cursor()
            cursor.execute(sqlcmd)
            
            # cols = [desc[0] for desc in cursor.description]
            # columnas = ",".join(cols)
             
            rows = cursor.fetchall()
            if len(rows) == 0:
                return "Lo siento " + author + ", no he comprendido lo que solicitas, necesitas mas ayuda?\n\n/ayuda - Despliega las opciones de ayuda\n/menu - Muestra las opciones del menu principal."
                
            # pprint(rows)
            
            for row in rows:
                # print(row)
                if row[0] == "T":
                    textResult = row[1].replace("<nombre>", author) 
                    textResult = textResult.replace("<tiempo>", tiempo) 
                    textResult = textResult.replace("<fecha>", fecha) 
                    textResult = textResult.replace("<time>", hora_completa) 
                    return textResult
                elif row[0] == "Q":
                    sqlcmd = row[1]
                    if (largo > 1 and modeBot != "redneuronal"):
                        if (obj!=""):
                            if (row[2]!=""):
                                sqlcmd = sqlcmd + " AND " + row[2] +  " LIKE '%" + obj[1] + "%'"
                    
                    # print(sqlcmd)
                    
                    cursor.execute(sqlcmd)
                    rs = cursor.fetchall()
                    
                    if len(rs) == 0:
                        return "No existen registros de " + findText + ", se encuentra vacío. \n\n/menu - Muestra las opciones del menu principal."
                    
                    
                    cols = [desc[0] for desc in cursor.description]
                    columnas = ",".join(cols) + "\n"
                    
                    
                    file_name = f"{findText}_{fecha_hora}.csv"
                    
                    f = open("temp/"+file_name, "w")
                    f.write(columnas)
                    
                    data = ""
                    for r in rs:
                        data = data + ",".join(r) + "\n"
                        
                    
                    f.write(data)
                    f.close()
                    
                    document = open("temp/"+file_name, "rb")
                    
                    bot.sendDocument(chat_id, document)
                        
                    toSend = "Aqui la información solicitada. \n/menu - Regresar."
                    
                    # file_name = "reporte.csv"
                    # if os.path.exists(file_name):
                    #     os.remove(file_name)
                    
                    # toSend = columnas + "\n" + data + \
                    #     "\n/menu - Regresar."
                        #"\n\n/cambiar_formato. Permite cambiar el formato de salida de los reportes" \
                    
                    return toSend 
                # elif row[0] == "U":
                #     sqlcmd = row[1]
                #     args = ()
                #     if (largo > 1):
                #         if (obj!=""):
                #             if (row[2]!=""):
                #                 sqlcmd = sqlcmd + " AND iduser = %s"
                #                 args = (idUser)     
                    
                #     cursor.execute(sqlcmd, args)
                #     rs = cursor.fetchall()
                    
                #     print(rs)
                    
                #     toSend = "Información actualizada con éxito"\
                #         "\n/menu - Regresar."
                #     return toSend
                elif row[0] == "F":
                    return open_file(row[1])
            
            # return "hola"
        except Exception as err:
            print(err)
            logger("ERROR", err, "CONTROLLER.LN.291")
            return "Los datos no se encuentran disponibles por el momento, e03."
    return textResult
            
