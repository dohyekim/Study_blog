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
