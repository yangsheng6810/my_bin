# -*- coding: utf-8 -*-
# copied from https://github.com/TerrorJack/tsinghua.py

import requests
import hashlib
def is_in_thu():
    return 'indexOutJump.jsp' not in requests.get('http://info.tsinghua.edu.cn').url

def is_online():
    return ',' in requests.post('http://net.tsinghua.edu.cn/cgi-bin/do_login', data={'action': 'check_online'}).content

def login(username, password):
    return requests.post('http://net.tsinghua.edu.cn/cgi-bin/do_login',
                        data={'username': username, 'password': hashlib.md5(password).hexdigest(), 'drop': 0,
                        'type': 1, 'n': 100}).content

def logout():
    return requests.post('http://net.tsinghua.edu.cn/cgi-bin/do_logout').content
