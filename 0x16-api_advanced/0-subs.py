#!/usr/bin/python3#!/usr/bin/python3
"""a function that queries the Reddit API and returns the number of subscribers
  (not active users, total subscribers) for a given subreddit.
  If an invalid subreddit is given,the function should return 0.
"""

import requests


def number_of_subscribers(subreddit):
    """Return number of subscribers"""
    url = "https://www.reddit.com/r/{}/about.json".format(subreddit)
    header = {"User-Agent": "0x16-api_advanced"}
    response = requests.get(url, headers=header, allow_redirects=False)
    if response.status_code == 200:
        subs_num = response.json().get("data").get("subscribers")
        return subs_num
    else:
        return 0
