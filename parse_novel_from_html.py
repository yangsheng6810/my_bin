#!/usr/bin/env python3
from bs4 import BeautifulSoup
import sys

input_file = sys.argv[1]

with open(input_file, "r") as i_file:
    content = i_file.read()

soup = BeautifulSoup(content, features="lxml")
for br in soup.find_all("br"):
    br.replace_with("\n")
title_find = soup.find_all("h1", {"class": "entry-title"})
if not title_find:
    title_find = soup.find_all("h3")
if not title_find:
    title_find = soup.find_all("h2")
if not title_find:
    title_find = soup.find_all("h1")
if not title_find:
    title_find = soup.find_all("div", {"class": "title_page"})
if not title_find:
    title_find = soup.find_all("div", {"class": "zhong"})
if not title_find:
    title_find = soup.find_all("span", {"class": "title"})
title = title_find[0].text.strip()
# print(title)

body_find = soup.find_all("div", {"class":"entry-content"})
if not body_find:
    body_find = soup.find_all("p", {"class":"articlecontent"})
if not body_find:
    body_find = soup.find_all("div", {"id":"_chapter"})
if not body_find:
    body_find = soup.find_all("div", {"id":"nr1"})
if not body_find:
    body_find = soup.find_all("div", {"id":"htmlContent"})
if not body_find:
    body_find = soup.find_all("div", {"id":"content"})
if not body_find:
    body_find = soup.find_all("div", {"class":"content"})
if not body_find:
    body_find = soup.find_all("div", {"id":"chaptercontent"})
if not body_find:
    body_find = soup.find_all("article", {"id":"nr"})
if not body_find:
    body_find = soup.find_all("div", {"id":"rd-txt"})
body = body_find[0].text

# output_file = "out_" + input_file
output_file = title + ".txt"
with open(output_file, "w") as o_file:
    print("-"*30, file=o_file)
    print(title, file=o_file)
    print("-"*30, file=o_file)
    print(body, file=o_file)

print(output_file)
