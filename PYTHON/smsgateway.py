'''
Created on Oct 22, 2016

@author: dok
'''

while True:  
    import datetime
    import time
    import mysql.connector
    conn = mysql.connector.connect(
    user="root",
    password="",
    host="127.0.0.1",
    database="sms"
    )
    cur=conn.cursor()
    cur.execute("SELECT * FROM t_transaksi where status = 'T'")
    result = cur.fetchall()
    for row in result: 
        id_transaksi = '%i' %(row[0])
        id_tanaman = '%i' %(row[4])
        id_kec = '%i' %(row[5])
        now = datetime.date.today()
        tanggal_d = '%d-%d-%d' %(now.year, now.month, now.day)
        tgl_hariini = datetime.datetime.strptime(tanggal_d, "%Y-%m-%d")
        #print(tgl_hariini)
        tgl_broadcast= '%s' %(row[1])
        tgl_buka = '%s' %(row[2])
        tgl_tutup = '%s' %(row[3])
        tanggal_c = datetime.datetime.strptime(tgl_broadcast, "%Y-%m-%d")
        #print(tanggal_c)
        if tgl_hariini == tanggal_c :
            print('hahah')
            cur.execute("select tanaman from t_tanaman where id_tanaman = %s",(id_tanaman,))
            tanam = cur.fetchone()
            print(tanam)
            print(id_kec)
            jenis_tanaman = '%s' %tanam[0]
            cur.execute("select telepon from t_kontak where id_kec = %s and jabatan = 'P3A' and publish = 1",(id_kec,))
            result2 = cur.fetchall()
            for row in result2:
                no_hp = '%s' %(row[0])
                print("Boadcast P3A")
                cur.execute("insert into outbox (DestinationNumber, TextDecoded, CreatorID) values (%s,'Pintu air akan dibuka pada tanggal '%s' harap persiapkan jenis tanaman '%s'','Gammu')",(no_hp, tgl_buka, jenis_tanaman))
            cur.execute("select telepon from t_kontak where id_kec = %s and jabatan = 'Ili-ili' and publish = 1",(id_kec,))
            result2 = cur.fetchall()
            for row in result2:
                no_hp = '%s' %(row[0])
                print("Broadcast Ili-ili")
                cur.execute("insert into outbox (DestinationNumber, TextDecoded, CreatorID) values (%s,'Buka pintu air pada tanggal '%s' sampai tanggal '%s' ','Gammu')",(no_hp,tgl_buka,tgl_tutup))
            cur.execute("update t_transaksi set status = 'F' where id_transaksi = %s",(id_transaksi,))
        
        else:
            print("Tidak ada broadcast")
    #REGULAR EXPRESSION
    #REGISTRASI 

    cur.execute("Select SenderNumber from inbox where Processed = 'false' ORDER BY ReceivingDateTime DESC LIMIT 1 ")
    nomor = cur.fetchone()
    telepon = '%s' % nomor
    print(telepon)
    cur.execute("Select substring(TextDecoded, 1, 3) from inbox where Processed = 'false' ORDER BY ReceivingDateTime DESC LIMIT 1") #REG
    char1 = cur.fetchone()
    regist = '%s' % char1
     
    if regist == 'REG':
        print('REG1')
        cur.execute("select count(telepon) as jumlah from t_kontak WHERE telepon = %s",(telepon,))
        result3 = cur.fetchone()
        jmlh = '%i' %result3
        jumlah = int(jmlh)
        if jumlah >= 1:
            print('No Telepon Sudah Ada')
            cur.execute("insert into outbox (DestinationNumber, TextDecoded, CreatorID) values (%s,'Nomor anda sudah terdaftar, ','Gammu')",(telepon,))
            cur.execute("Update Inbox SET Processed = 'true' WHERE SenderNumber = %s",(telepon,))
        else:
            print('REG2')
            cur.execute("Select substring(TextDecoded, 5, 3) from inbox where Processed = 'false' ORDER BY ReceivingDateTime DESC LIMIT 1")
            char2 = cur.fetchone()
            kode_kec = '%s' % char2
            cur.execute("select count(kode_kec) as jumlah from t_kecamatan where kode_kec = %s",(kode_kec,))
            result3 = cur.fetchone()
            jmlh = '%i' %result3
            jumlah = int(jmlh)
            if jumlah <= 0:
                cur.execute("insert into outbox (DestinationNumber, TextDecoded, CreatorID) values (%s,'Format yang anda masukkan salah','Gammu')",(telepon,))
                cur.execute("Update Inbox SET Processed = 'true' WHERE SenderNumber = %s",(telepon,))
            else:
                cur.execute("Select * from t_kecamatan where kode_kec = %s",(kode_kec,))
                keca = cur.fetchone()
                kecamatan = '%s' % keca[2]
                id_kec = '%s' % keca[0]
                if (kode_kec == kecamatan):#Kecamatan
                    #print(kec)
                    print('REG KECAMATAN')
                    cur.execute("Select substring(TextDecoded, 9, 3) from inbox where Processed = 'false' ORDER BY ReceivingDateTime DESC LIMIT 1")
                    char3 = cur.fetchone()
                    jabatan = '%s' % char3
                    print (jabatan)
                    if (jabatan == 'ILI'):
                        jabatan = 'Ili-ili'
                        print(jabatan)
                        cur.execute("Select substring(TextDecoded, 13, 30) from inbox where Processed = 'false' ORDER BY ReceivingDateTime DESC LIMIT 1")
                        char4 = cur.fetchone()
                        nama = '%s' % char4
                        if (nama == ''):
                            cur.execute("insert into outbox (DestinationNumber, TextDecoded, CreatorID) values (%s,'Format yang anda masukkan salah','Gammu')",(telepon,))
                            cur.execute("Update Inbox SET Processed = 'true' WHERE SenderNumber = %s",(telepon,))
                        else:
                            cur.execute("INSERT INTO t_kontak (nama, telepon, id_kec, jabatan, publish) VALUES (%s,%s,%s,%s,1)",(nama, telepon, id_kec, jabatan))
                            cur.execute("insert into outbox (DestinationNumber, TextDecoded, CreatorID) values (%s,'Terimakasih anda telah terdaftar dalam Layanan Informasi Pendistribusian Air Irigasi Dinas Pertanian Kota Metro','Gammu')",(telepon,))
                            cur.execute("Update Inbox SET Processed = 'true' WHERE SenderNumber = %s",(telepon,))
                    elif (jabatan == 'P3A'):
                        jabatan = 'P3A'
                        cur.execute("Select substring(TextDecoded, 13, 30) from inbox ORDER BY ReceivingDateTime DESC LIMIT 1")
                        char4 = cur.fetchone()
                        nama = '%s' % char4
                        if (nama == ''):
                            cur.execute("insert into outbox (DestinationNumber, TextDecoded, CreatorID) values (%s,'Format yang anda masukkan salah','Gammu')",(telepon,))
                            cur.execute("Update Inbox SET Processed = 'true' WHERE SenderNumber = %s",(telepon,))
                        else:
                            cur.execute("INSERT INTO t_kontak (nama, telepon, id_kec, jabatan, publish) VALUES (%s,%s,%s,%s,1)",(nama, telepon, id_kec, jabatan))
                            cur.execute("insert into outbox (DestinationNumber, TextDecoded, CreatorID) values (%s,'Terimakasih anda telah terdaftar dalam Layanan Informasi Pendistribusian Air Irigasi Dinas Pertanian Kota Metro','Gammu')",(telepon,))
                            cur.execute("Update Inbox SET Processed = 'true' WHERE SenderNumber = %s",(telepon,))
                    else:
                        print('salah')
                        cur.execute("insert into outbox (DestinationNumber, TextDecoded, CreatorID) values (%s,'Format yang anda masukkan salah','Gammu')",(telepon,))
                        cur.execute("Update Inbox SET Processed = 'true' WHERE SenderNumber = %s",(telepon,))
                else:
                    print('elsea')
                    cur.execute("insert into outbox (DestinationNumber, TextDecoded, CreatorID) values (%s,'Format yang anda masukkan salah','Gammu')",(telepon,))
                    cur.execute("Update Inbox SET Processed = 'true' WHERE SenderNumber = %s",(telepon,))
    #CEK
    elif regist == 'CEK':
        print(regist)
        
        #if (nomor == telepon):
        cur.execute("select count(telepon) as jumlah from t_kontak WHERE telepon = %s",(telepon,))
        result3 = cur.fetchone()
        jmlh = '%i' %result3
        jumlah = int(jmlh)
        if jumlah >= 1 :
            print('ada')
            cur.execute("Select * from t_kontak where telepon = %s",(telepon,))
            kontak = cur.fetchone()
            publish = '%s' %kontak[5]
            id_kec = '%s' %kontak[3]
            jabatan = '%s' %kontak[4]
            if publish == '1':
                print('publihs')
                cur.execute("select count(id_kec) as jumlah from t_transaksi WHERE id_kec = %s and status ='T'",(id_kec,))
                result3 = cur.fetchone()
                jmlh = '%i' %result3
                jumlah = int(jmlh)
                if jumlah >= 1 :
                    cur.execute("Select * from t_transaksi where id_kec = %s and status = 'T'",(id_kec,))
                    trans = cur.fetchone()
                    id_tanaman = '%i' %(row[4])
                    tgal_buka = '%s' %(row[2])
                    tgal_tutup = '%s' %(row[3])
                    #status = '%s' %(row[6])
                    cur.execute("Select tanaman from t_tanaman where id_tanaman = %s",(id_tanaman,))
                    tanaman = cur.fetchone()
                    jenis_tanaman = '%s' % tanaman
                    if (jabatan == 'P3A'):     
                        print('Pesan Cek P3A')
                        cur.execute("insert into outbox (DestinationNumber, TextDecoded, CreatorID) values (%s,'Pintu air akan dibuka pada tanggal '%s' harap persiapkan jenis tanaman '%s'','Gammu')",(telepon,tgl_buka,jenis_tanaman))
                        cur.execute("Update Inbox SET Processed = 'true' WHERE SenderNumber = %s",(telepon,))
                    else:
                        print('Pesan Cek Ili')
                        cur.execute("insert into outbox (DestinationNumber, TextDecoded, CreatorID) values (%s,'Buka pintu air pada tanggal '%s' sampai tanggal '%s'','Gammu')",(telepon,tgl_buka,tgl_tutup))
                        cur.execute("Update Inbox SET Processed = 'true' WHERE SenderNumber = %s",(telepon,))
                else:
                    print('Pesan Cek Udah Dibuka')
                    cur.execute("insert into outbox (DestinationNumber, TextDecoded, CreatorID) values (%s,'Pintu air untuk daerah anda sudah dibuka','Gammu')",(telepon,))
                    cur.execute("Update Inbox SET Processed = 'true' WHERE SenderNumber = %s",(telepon,))
            else:
                #cur.execute("insert into outbox (DestinationNumber, TextDecoded, CreatorID) values (%s,'Nomor di non-aktifkan silahkan hubungi petugas untuk mengaktifkan kembali','Gammu')",(telepon,))
                cur.execute("Update Inbox SET Processed = 'true' WHERE SenderNumber = %s",(telepon,))
        else:
            print('Nomor Anda Belum Terdaftar')
            cur.execute("insert into outbox (DestinationNumber, TextDecoded, CreatorID) values (%s,'Nomor anda belum terdaftar','Gammu')",(telepon,))
            cur.execute("Update Inbox SET Processed = 'true' WHERE SenderNumber = %s",(telepon,))
    else:
        cur.execute("Select substring(TextDecoded, 1,5 ) from inbox where Processed = 'false' ORDER BY ReceivingDateTime DESC LIMIT 1") #REG
        char1 = cur.fetchone()
        regist = '%s' % char1
        cur.execute("select count(telepon) as jumlah from t_kontak WHERE telepon = %s",(telepon,))
        result3 = cur.fetchone()
        jmlh = '%i' %result3
        jumlah = int(jmlh)
        if jumlah <= 0 :
            cur.execute("select count(processed) as jumlah from Inbox where processed = 'false' ")
            result4 = cur.fetchone()
            jmlh = '%i' %result4
            jumlh = int(jmlh)
            if (jumlh<=0):
                print('No Kosong')
            else:
                print('No Act')
                cur.execute("insert into outbox (DestinationNumber, TextDecoded, CreatorID) values (%s,'Nomor anda belum terdaftar','Gammu')",(telepon,))
                cur.execute("Update Inbox SET Processed = 'true' WHERE SenderNumber = %s",(telepon,))
                
        elif regist == 'UNREG':
            print('UNREG')
            #cur.execute("Update t_kontak SET publish = 0 where telepon = %s",(telepon,)) #UPDATE
            cur.execute("Delete from t_kontak where telepon = %s",(telepon,))#Delete
            cur.execute("insert into outbox (DestinationNumber, TextDecoded, CreatorID) values (%s,'Anda telah berhenti berlangganan layanan ini','Gammu')",(telepon,))
            cur.execute("Update Inbox SET Processed = 'true' WHERE SenderNumber = %s",(telepon,))
           
        else:
            print('PERINTAH SALAH')
            cur.execute("insert into outbox (DestinationNumber, TextDecoded, CreatorID) values (%s,'Format yang anda masukkan Salah','Gammu')",(telepon,))
            cur.execute("Update Inbox SET Processed = 'true' WHERE SenderNumber = %s",(telepon,))   
    conn.commit()
    time.sleep(1)
    cur.close()
    True
    conn.close()