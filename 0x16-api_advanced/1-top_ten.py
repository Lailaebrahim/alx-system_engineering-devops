#!/usr/bin/python3
""" a function that queries the Reddit API and prints the titles
    of the first 10 hot posts listed for a given subreddit.
"""

import requests


def top_ten(subreddit):
    """first 10 hot posts listed for a given subreddit"""
    url = "https://www.reddit.com/r/{}/hot/.json?limit=10".format(subreddit)
    header = {'User-agent': 'Laila Ebrahim'}
    try:
        response_url = requests.get(url, headers=header,
                                    allow_redirects=False).json()
        for post in response_url.get('data').get('children'):
            print(post.get('data').get('title'))
    except Exception:
        print(None)
