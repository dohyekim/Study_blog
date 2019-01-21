#지난 시간에 작성한 meltop100.csv 파일을 읽어, meltop100.xlsx 로 저장하시오. (단, 랭킹, 좋아요, 좋아요차이 컬럼은 숫자형식으로 저장 할 것!)

import openpyxl
import csv, codecs

data = []
with open("./melon_top.csv", mode = "r", encoding = "euc-kr") as file:
    for line in file:
        line.split(',')[0]
        data.append([ line.split(',')[0], line.split(',')[1], line.split(',')[2], line.split(',')[3], line.split(',')[4]])

del data[0]    # header 제거

book = openpyxl.Workbook()
sheet = book.active
sheet.title = "Sheet 1"

for datum in data:
    sheet.append(datum)

book.save("./meltop100.xlsx")

# number_format

for i in range(1,100) :
    sheet['A{}'.format(i)].number_format
    sheet['D{}'.format(i)].number_format
    sheet['E{}'.format(i)].number_format

book.save("./meltop100.xlsx")
