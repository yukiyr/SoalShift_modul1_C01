a. 
awk -F, 'NR > 1 && $7 == "2012" {arr[$1]+=$10} END {for (i in arr) {print i,arr[i]}}' WA_Sales_Products_2012-14.csv > output.sh
awk 'max < $2 { max = $1 } {min = $2} END { print max min }' output.sh

b. 
awk -F, 'NR > 1 && $7 == "2012" && $1 == "United States" {arr[$4]+=$10} END {for (i in arr) {print arr[i], i}}' WA_Sales_Products_2012-14.csv > output2.sh
sort -nrk1 output2.sh | awk '{print $2 " " $3} NR==3{exit}'

c.
awk -F, 'NR > 1 && $7 == "2012" && $1 == "United States" && $4 == "Personal Accessories" {arr[$6]+=$10} END {for (i in arr) {print arr[i],i}}' WA_Sales_Products_2012-14.csv > output3.sh
awk -F, 'NR > 1 && $7 == "2012" && $1 == "United States" && $4 == "Camping Equipment" {arr[$6]+=$10} END {for (i in arr) {print arr[i],i}}' WA_Sales_Products_2012-14.csv > output4.sh
awk -F, 'NR > 1 && $7 == "2012" && $1 == "United States" && $4 == "Outdoor Protection" {arr[$6]+=$10} END {for (i in arr) {print arr[i],i}}' WA_Sales_Products_2012-14.csv > output5.sh

echo "a. Personal Accessories"
sort -nrk1 output3.sh | awk '{print $2 " " $3 " " $4} NR==3{exit}'

echo "b. Camping Equipment"
sort -nrk1 output4.sh | awk '{print $2 " " $3 " " $4} NR==3{exit}'

echo "c. Outdoor Protection"
sort -nrk1 output5.sh | awk '{print $2 " " $3 " " $4} NR==3{exit}'
