#!/usr/bin/env python3

'''
#### Contest Parser ####
- It's not complete yet but it's working fine now.
- Make sure to use it only on Codeforces and AtCoder for now.
'''

import tornado.ioloop
import tornado.web
import json
import os
from colorama import *
import sys


class MainHandler(tornado.web.RequestHandler):
    def post(self):
        data = json.loads(self.request.body)
        createDirectory(data)

def make_app():
    return tornado.web.Application([
        (r"/", MainHandler),
    ])

def createDirectory(data):

    problem_file = os.getcwd() + '/' + data['name'][0] + '.cpp'
    with open(problem_file, 'w') as f:
        f.write(
            '''#include <bits/stdc++.h>\n\nusing namespace std;\n\nint main() {\n    ios::sync_with_stdio(false), cin.tie(nullptr);\n\n    return 0;\n}\n'''
        )

    tests = data['tests']
    print("Creating files for problem " + data['name'][0])
    test_no = 1
    for test in tests:
        with open(data['name'][0] + "-" + str(test_no) + ".in", 'w') as f:
            f.write(test["input"])

        with open(data['name'][0] + "-" + str(test_no) + ".out", 'w') as f:
            f.write(test["output"])
        test_no += 1

    print(Fore.GREEN + "Done")
    print(Style.RESET_ALL, end='\n')
    global number_of_problmes
    number_of_problmes -= 1
    if not number_of_problmes:
        print(Fore.GREEN + "Contest was parsed successfully. GL, HF.")
        exit()

def done_all():
    tornado.ioloop.IOLoop.instance().stop()

number_of_problmes = 26
contest = os.getcwd()
if len(sys.argv) > 1:
    contest = sys.argv[1]
if len(sys.argv) > 2:
    number_of_problmes = int(sys.argv[2])

if __name__ == "__main__":
    try:
        os.mkdir(os.getcwd() + '/' + contest)
        os.chdir(os.getcwd() + '/' + contest)
    except FileExistsError:
        print(Fore.RED + "Folder Exists.")
        print(Style.RESET_ALL, end='')
        exit()
    except:
        print(Fore.RED + "An error occured while creating the directory.")
        print(Style.RESET_ALL, end='')
        exit()
    app = make_app()
    app.listen(2619)
    tornado.ioloop.IOLoop.current().start()