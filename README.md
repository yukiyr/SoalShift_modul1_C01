# SoalShift_modul1_C01

1. Anda diminta tolong oleh teman anda untuk mengembalikan filenya yang telah dienkripsi oleh seseorang menggunakan bash script, file yang dimaksud adalah nature.zip. Karena terlalu mudah kalian memberikan syarat akan membuka seluruh file tersebut jika pukul 14:14 pada tanggal 14 Februari atau hari tersebut adalah hari jumat pada bulan Februari.
Hint: Base64, Hexdump

Jawaban 

- Ekstrak nature.zip

- Buat bash script

#!/bin/bash

number=1
for file in *.jpg
do
base64 -d "$file" | xxd -f > "foto"$number".jpg"
let number++
done

- Lalu crontabnya adalah

14 14 14 2 5 /bin/bash /home/test/soal1.sh

2. Anda merupakan pegawai magang pada sebuah perusahaan retail, dan anda diminta untuk memberikan laporan berdasarkan file WA_Sales_Products_2012-14.csv. Laporan yang diminta berupa:
a. Tentukan negara dengan penjualan(quantity) terbanyak pada tahun 2012.
b. Tentukan tiga product line yang memberikan penjualan(quantity) terbanyak pada soal poin a.
c. Tentukan tiga product yang memberikan penjualan(quantity) terbanyak berdasarkan tiga product line yang didapatkan    pada soal poin b.

Jawaban

2.a.

- Buat bash script pertama

awk -F, 'NR > 1 && $7 == "2012" {arr[$1]+=$10} END {for (i in arr) {print i,arr[i]}}' WA_Sales_Products_2012-14.csv > output.sh

- Lalu bash, dan buat bash script kedua

awk 'max < $2 { max = $1 } {min = $2} END { print max min }' output.sh

2.b.

- Buat bash script pertama

awk -F, 'NR > 1 && $7 == "2012" && $1 == "United States" {arr[$4]+=$10} END {for (i in arr) {print arr[i], i}}' WA_Sales_Products_2012-14.csv > output2.sh

- Lalu bash, buat bash script kedua

sort -nrk1 output2.sh | awk '{print $2 " " $3} NR==3{exit}'

2.c.

- Buat bash script pertama

awk -F, 'NR > 1 && $7 == "2012" && $1 == "United States" && $4 == "Personal Accessories" {arr[$6]+=$10} END {for (i in arr) {print arr[i],i}}' WA_Sales_Products_2012-14.csv > output3.sh

awk -F, 'NR > 1 && $7 == "2012" && $1 == "United States" && $4 == "Camping Equipment" {arr[$6]+=$10} END {for (i in arr) {print arr[i],i}}' WA_Sales_Products_2012-14.csv > output4.sh

awk -F, 'NR > 1 && $7 == "2012" && $1 == "United States" && $4 == "Outdoor Protection" {arr[$6]+=$10} END {for (i in arr) {print arr[i],i}}' WA_Sales_Products_2012-14.csv > output5.sh

- Lau bash, buat bash script kedua

echo "a. Personal Accessories"
sort -nrk1 output3.sh | awk '{print $2 " " $3 " " $4} NR==3{exit}'

echo "b. Camping Equipment"
sort -nrk1 output4.sh | awk '{print $2 " " $3 " " $4} NR==3{exit}'

echo "c. Outdoor Protection"
sort -nrk1 output5.sh | awk '{print $2 " " $3 " " $4} NR==3{exit}'

3. Buatlah sebuah script bash yang dapat menghasilkan password secara acak sebanyak 12 karakter yang terdapat huruf besar, huruf kecil, dan angka. Password acak tersebut disimpan pada file berekstensi .txt dengan ketentuan pemberian nama sebagai berikut:
a. Jika tidak ditemukan file password1.txt maka password acak tersebut disimpan pada file bernama password1.txt
b. Jika file password1.txt sudah ada maka password acak baru akan disimpan pada file bernama password2.txt dan begitu seterusnya.
c. Urutan nama file tidak boleh ada yang terlewatkan meski filenya dihapus.
d. Password yang dihasilkan tidak boleh sama.

Jawaban

- Buat bash script

#!/bin/bash

length=12

digits=({0..9})

lower=({a..z})

upper=({A..Z})

CharArray=(${digits[*]} ${lower[*]} ${upper[*]})

ArrayLength=${#CharArray[*]}

password=""

for i in `seq 1 $length`

do

        index=$(($RANDOM%$ArrayLength))
        
        char=${CharArray[$index]}
        
        password=${password}${char}
        
done 

file=password

numb=1

while test -e "$file$numb.txt"; do
        (( ++numb ))
done

fname="$file$numb.txt"

echo $password > "$fname"

- Lalu setiap kali bash maka nama file akan berubah meningkat yaitu password1.txt, password2.txt, dst.

4. Lakukan backup file syslog setiap jam dengan format nama file “jam:menit tanggal-bulan-tahun”. Isi dari file backup terenkripsi dengan konversi huruf (string manipulation) yang disesuaikan dengan jam dilakukannya backup misalkan sebagai berikut:
a. Huruf b adalah alfabet kedua, sedangkan saat ini waktu menunjukkan pukul 12, sehingga huruf b diganti dengan huruf alfabet yang memiliki urutan ke 12+2 = 14.
b. Hasilnya huruf b menjadi huruf n karena huruf n adalah huruf ke empat belas, dan seterusnya. 
c. setelah huruf z akan kembali ke huruf a
d. Backup file syslog setiap jam.
e. dan buatkan juga bash script untuk dekripsinya.
Jawaban


5. Buatlah sebuah script bash untuk menyimpan record dalam syslog yang memenuhi kriteria berikut:
a. Tidak mengandung string “sudo”, tetapi mengandung string “cron”, serta buatlah pencarian stringnya tidak bersifat case sensitive, sehingga huruf kapital atau tidak, tidak menjadi masalah.
b. Jumlah field (number of field) pada baris tersebut berjumlah kurang dari 13.
c. Masukkan record tadi ke dalam file logs yang berada pada direktori /home/[user]/modul1.
d. Jalankan script tadi setiap 6 menit dari menit ke 2 hingga 30, contoh 13:02, 13:08, 13:14, dst.

Jawaban

- Buat bash script

awk '/cron/ || /CRON/,!/sudo/' /var/log/syslog | awk 'NF < 13 {print}' >> /home/test/modl1/logsoal5.log

- Lau untuk crontabnya

2-30/6 * * * * /bin/bash /home/nama user/soal5.sh
