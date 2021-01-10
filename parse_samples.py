#!/usr/bin/env python3

'''
#### Samples Parser ####
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
        print(Fore.GREEN + "Samples downloaded successfully. GL, HF.")
        exit()

def done_all():
    tornado.ioloop.IOLoop.instance().stop()

number_of_problmes = 26
if len(sys.argv) > 1:
    number_of_problmes = int(sys.argv[1])

if __name__ == "__main__":
    app = make_app()
    app.listen(2619)
    tornado.ioloop.IOLoop.current().start()